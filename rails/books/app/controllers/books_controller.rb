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
            redirect_to '/books', notice:'Book was successfully created'
        else
            render :new
        end
    end
    def  edit
        find_book
    end
    def update
        find_book
                if @book.update(book_params)
                    redirect_to '/books', notice:'Book was successfully updated'
                else
                    render :edit
                end

    end
    def destroy
        find_book
        @book.destroy
        redirect_to '/books', notice:'Book was successfully deleted'
    end
   
    private
    def book_params
        params.require(:book).permit(:title, :content, :price)
    end
    def find_book
        @book = Book.find_by(id:params[:id])
    end
end
