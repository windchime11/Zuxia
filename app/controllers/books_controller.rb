class BooksController < ApplicationController
    
  #before_filter :verify_admin, :except => [:index]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      flash[:success] = "Book #{@book.name} created!"
      redirect_back_or(root_path)
    else
      flash[:error] = "Unable to create book. Please try again."
      render 'new'
    end
  end

  def destroy
  end

  def update
  end

  def index
    @books = Book.all
  end

end
