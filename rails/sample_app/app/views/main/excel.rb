require 'spreadsheet'

# Create a new spreadsheet object.
spreadsheet = Spreadsheet::Workbook.new

# Add data to the spreadsheet.
sheet = spreadsheet.create_sheet('My Sheet')
sheet[0, 0] = 'Name'
sheet[1, 0] = 'Age'
sheet[2, 0] = 'City'
sheet[3, 0] = 'Country'

sheet[0, 1] = 'John Doe'
sheet[1, 1] = 30
sheet[2, 1] = 'San Francisco'
sheet[3, 1] = 'United States'

# Save the spreadsheet as an Excel file.
spreadsheet.save('my_spreadsheet.xls')
