class BooksController < ApplicationController
  before_action :set_author
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  def index
    @books = @author.books
  end

  def show
    @book = @author.books.find(params[:id])
  end

  def new
    @book = @author.books.build
  end

  def create
    @book = @author.books.build(book_params)

    if @book.save
      redirect_to author_path(@author), notice: 'Book was successfully created.'
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to author_path(@author), notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to author_path(@author), notice: 'Book was successfully deleted.'
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def set_author
    @author = Author.find(params[:author_id])
  end

  def book_params
    params.require(:book).permit(:title)
  end
end
