class BooksController < ApplicationController
	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		if @book.save
			#flash[:notice] = "Added " + @book.title
			redirect_to action: 'index'
		else 
			render 'new'
		end
	end

	def index
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
	end

	def create_loan
		Book.find(params[:id]).loans.create(user: current_user)
		redirect_to :controller => 'loans', :action => 'index'
	end

	private
		def book_params
			params.require(:book).permit(:title, :author, :description, :quantity)
		end
end
