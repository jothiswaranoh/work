
class MainController < ApplicationController
  def home
  end

  def feed
  end

  def message
  end

  def video
  end

  def games
  end
  def excel
  end
end


class Spreadsheet< ApplicationController
  def initialize
    @workbook = Spreadsheet::Workbook.new
  end

  def create_sheet(name)
    @workbook.create_sheet(name)
  end
end
