require "creek"
require "json"

# Load the Excel XLSX file
file_path = "test.xlsx"
creek = Creek::Book.new(file_path)

# Define a data structure to hold the results
data = {
  deals: [],
  rights: [],
  restrictions: [],
  assets: [],
}

creek.sheets.each do |sheet|
  sheet_name = sheet.name
  puts "Processing Sheet: #{sheet_name}"

  rows = sheet.rows.to_a
  if rows.empty?
    puts "No data found in this sheet."
    next
  end

  # Get the headers from the first row
  first_row = rows.first
  header_keys = if first_row.respond_to?(:cells)
      first_row.cells.map { |_, cell| cell.value }
    else
      first_row.map { |_, value| value }
    end

  # Skip the first row (headers) and process the remaining rows
  rows[1..].each do |row|
    cell_values = nil

    if row.respond_to?(:cells)
      cell_values = row.cells.map { |_, cell| cell.value }
    else
      cell_values = row.values
    end

    next if cell_values.all?(&:nil?)

    # Create a hash of the header keys and the corresponding cell values
    row_data = Hash[header_keys.zip(cell_values)]

    # Determine where to store this row's data
    if sheet_name == "Deal Details"
      data[:deals] << row_data
    elsif sheet_name == "Rights"
      data[:rights] << row_data
    elsif sheet_name == "Restriction"
      data[:restriction] << row_data
    elsif sheet_name == "Assets"
      data[:assets] << row_data
    end
  end
end

# Output the collected data
data = data.to_json

puts data
