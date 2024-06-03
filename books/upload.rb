require "creek"
require "csv"
require "digest"

file_path = "test.xlsx"
output_folder = "./csv_outputs/"

Dir.mkdir(output_folder) unless Dir.exist?(output_folder)

header_mappings = {
  "Deal Name" => "deal_name",
  "Deal Type" => "deal_type",
  "Execution Date" => "execution_date",
  "Term Start Date" => "term_start_date",
  "Term End Date" => "term_end_date",
  "Grantor Legal Name" => "grantor_legal_name",
  "Grantee Legal Name" => "grantee_legal_name",
  "Grantor Entity" => "grantor_entity",
  "Grantee Entity" => "grantee_entity",
  "Deal Notes" => "deal_notes",
  "Business Unit" => "business_unit",
  "Broker Name" => "broker_name",
  "Fee Type" => "fee_type",
  "Fee(In Thousands $ USD)" => "fee_thousands_usd",
  "Fee Notes" => "fee_notes",
  "Deal Lead" => "deal_lead",
  "Legal Lead" => "legal_lead",
  "Right Name" => "right_name",
  "Right Start Date" => "right_start_date",
  "Right End Date" => "right_end_date",
  "Field of Use" => "field_of_use",
  "Referring Section" => "referring_section",
  "Notes" => "notes",
  "Restriction Name" => "restriction_name",
  "Restriction Start Date" => "restriction_start_date",
  "Restriction End Date" => "restriction_end_date",
  "Portfolio" => "portfolio",
  "Asset Number" => "asset_number",
  "Title" => "title",
  "Filing Date" => "filing_date",
}

encrypted_fields = ["grantor_entity", "grantee_entity", "deal_type", "right_name", "right_start_date",
                    "right_end_date", "restriction_start_date", "restriction_end_date", "restriction_name"]

data = {
  deals: [],
  rights: [],
  restrictions: [],
  assets: [],
}

def encrypt_field(data)
  Digest::MD5.hexdigest(data.to_s)
end

creek = Creek::Book.new(file_path)

creek.sheets.each do |sheet|
  sheet_name = sheet.name
  puts "Processing Sheet: #{sheet_name}"

  rows = sheet.rows.to_a
  if rows.empty?
    puts "No data found in this sheet."
    next
  end

  first_row = rows.first
  original_header_keys = if first_row.respond_to?(:cells)
      first_row.cells.map { |_, cell| cell.value }
    else
      first_row.map { |_, value| value }
    end

  header_keys = original_header_keys.map { |key| header_mappings[key] || key }

  data[sheet_name.downcase.to_sym] ||= []

  rows[1..].each do |row|
    cell_values = if row.respond_to?(:cells)
        row.cells.map { |_, cell| cell.value }
      else
        row.values
      end

    next if cell_values.all? { |value| value.nil? || value.to_s.strip.empty? }

    encrypted_row_data = Hash[header_keys.zip(cell_values.map.with_index do |value, index|
                                if encrypted_fields.include?(header_keys[index])
                                  encrypt_field(value)
                                else
                                  value
                                end
                              end)]

    data[sheet_name.downcase.to_sym] << encrypted_row_data
  end

  csv_filename = "#{output_folder}/#{sheet_name}.csv"
  CSV.open(csv_filename, "w", col_sep: "\t") do |csv|
    csv << header_keys
    data[sheet_name.downcase.to_sym].each do |row|
      csv << row.values
    end
  end

  puts "Sheet '#{sheet_name}' has been converted to CSV with encrypted fields where applicable."
end
