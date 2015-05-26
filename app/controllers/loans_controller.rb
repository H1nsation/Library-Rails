class LoansController < ApplicationController
	before_filter :authenticate_user!

	def create
		if Loan.where(user_id: current_user).size < 10
			Book.find(params[:book_id]).loans.create(user: current_user)
			redirect_to :action => 'index'
		else 
			#flash[:notice] = "User can't take out anymore books!"
			redirect_to :controller => 'book', :action => 'show' 
		end
	end
	
	def index
		@loans = Loan.where(user_id: current_user)
	end

	def destroy

	end
end
