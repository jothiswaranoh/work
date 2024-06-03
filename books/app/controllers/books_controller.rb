class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to "/books", notice: "Book was successfully created"
    else
      render :new
    end
  end

  def edit
    find_book
  end

  def update
    find_book
    if @book.update(book_params)
      redirect_to "/books", notice: "Book was successfully updated"
    else
      render :edit
    end
  end

  def bulkupload
    # Generate dummy data
    mod_asset_data = generate_dummy_data(150000)

    # Convert data to hash or array of hashes
    data_to_insert = mod_asset_data.map { |data| { name: data[:name], description: data[:description] } }

    # Bulk insert data
    User.import(data_to_insert, validate: false) # Set validate: false if you don't need validation

    render plain: "Data insertion completed."
  end

  private

  def generate_dummy_data(count)
    (0...count).map do |i|
      { name: "Asset #{i}", description: "Description #{i}" }
    end
  end

  def destroy
    find_book
    @book.destroy
    redirect_to "/books", notice: "Book was successfully deleted"
  end

  private

  def book_params
    params.require(:book).permit(:title, :content, :price)
  end

  def find_book
    @book = Book.find_by(id: params[:id])
  end
end
