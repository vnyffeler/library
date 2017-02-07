class BooksController < ApplicationController

	def index 
		@books = Book.all
	end

	def new 
		@book = Book.new
	end

	def create
		Book.create(book_params)
		redirect_to root_path
	end

private

def book_params
	params.require(:book).permit(:title, :author, :year, :genre)
end

end
