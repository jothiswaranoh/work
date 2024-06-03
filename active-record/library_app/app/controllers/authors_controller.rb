class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end
  
  def update
    author = Author.find(params[:id])
  
    if author.update(author_params)
      redirect_to authors_path, notice: 'Author was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to authors_path, notice: 'Author was successfully created.'
    else
      render :new
    end
  end

  # Add other actions like edit and update as needed.

  private

  def author_params
    params.require(:author).permit(:name)
  end

end
