class LoansController < ApplicationController
	before_filter :authenticate_user!

	def create
		Book.find(params[:book_id]).loans.create(user: current_user)
		redirect_to :action => 'index'
	end
	
	def index
		@loans = Loan.where(user_id: current_user)
	end

	def destroy
	end
end
