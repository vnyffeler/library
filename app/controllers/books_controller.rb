class BooksController < ApplicationController
	# before_action :set_book, only: [:show, :edit, :delete, :update]

	def index 
		@books = Book.all
	end

	def new 
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)

		if @book.save 
			redirect_to root_path, notice: "Book was successfully added." 
		else
			render :new, alert: "Your book was not successfully saved."
		end
	end

	def edit
		# raise params

		@book = Book.find_by(id: params[:id])
	end


	def update 
		@book = Book.find_by(id: params[:id])

		if @book
			@book.update!(book_params)
			redirect_to root_path, notice: "Book was successfully updated." 
		else
			render :edit, alert: "Your book was not successfully updated."
		end
	end

	def destroy
		@book = Book.find_by(id: params[:id])

		if @book
			@book.destroy
			redirect_to root_path, notice: "Book was successfully deleted."

		else
			redirect_to root_path, alert: "Book was not successfully deleted."
		end	
	end



private

def book_params
	params.require(:book).permit(:title, :author, :year, :genre)
end

end
