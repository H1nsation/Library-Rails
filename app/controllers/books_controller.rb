class BooksController < ApplicationController
	before_filter :require_admin, only: [:new, :create, :edit, :update, :destroy]

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		if @book.save
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

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.update(book_params)
		redirect_to action: 'index'
	end

	def destroy
		@book = Book.find(params[:id])
		Loan.where(book_id: @book).destroy_all
		@book.destroy
		redirect_to action: 'index'
	end 

	private
		def book_params
			params.require(:book).permit(:title, :author, :year, :publisher, :genre, :description, :quantity, :cover)
		end
end
