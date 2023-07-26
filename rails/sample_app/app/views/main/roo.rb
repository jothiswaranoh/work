require 'roo'

# Open the Excel spreadsheet.
xls = Roo::Excel.new('my_spreadsheet.xls')

# Select the data that you want to export.
data = xls.sheet('My Sheet').select(:Name, :Age, :City, :Country)

# Save the data as an Excel file.
data.to_excel('my_exported_spreadsheet.xls')