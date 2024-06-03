def update_rights(rights, deal_id, hash_name)
  return [] unless rights.is_a?(Array)

  rights.map do |right|
    right ||= {}

    if right["start_date"].is_a?(Time) || right["start_date"].is_a?(DateTime)
      right["start_date"] = right["start_date"].strftime("%m/%d/%Y")
    end

    if right["end_date"].is_a?(Time) || right["end_date"].is_a?(DateTime)
      right["end_date"] = right["end_date"].strftime("%m/%d/%YYYY")
    end
    right.delete("deal_name")
    right = right.transform_values { |v| v.nil? ? "" : v }
    right = right.transform_keys { |k| k.nil? ? k : k.to_sym }
    right[:lm_license_id] = deal_id
    right[:portfolio_ids] = {},
    my_hash = { hash_name.to_sym => right }
    my_hash
  end
end

rights = [
  {
    "deal_name" => "Deal Test 1",
    "lm_right_type_name" => "Custom right 1",
    "start_date" => Time.new(2024, 3, 13, 0, 0, 0, "+05:30"),
    "end_date" => Time.new(2024, 3, 28, 0, 0, 0, "+05:30"),
    "field_of_use" => nil,
    "ref_section" => nil,
    "notes" => nil,
    nil => nil
  },
  {
    "deal_name" => "Deal Test 1",
    "lm_right_type_name" => "Right to sublicense",
    "start_date" => Time.new(2024, 3, 13, 0, 0, 0, "+05:30"),
    "end_date" => Time.new(2024, 3, 28, 0, 0, 0, "+05:30"),
    "field_of_use" => nil,
    "ref_section" => nil,
    "notes" => nil,
    nil => nil
  }
]

result = update_rights(rights, 123, "license_rights")
puts result
