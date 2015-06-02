class LoansController < ApplicationController
	before_filter :authenticate_user!
	before_filter :require_user, only: [:create]
	before_filter :require_admin, only: [:index, :destroy]

	def create
		Book.find(params[:id]).loans.create(user: current_user)
		redirect_to :action => 'show'
	end
	
	def show
		@loans = Loan.where(user_id: current_user)
	end

	def index
		@loans = Loan.all
	end

	def destroy
		if params.has_key?(:id)
  			Loan.destroy(params[:loan_ids])
		end
		redirect_to :action => 'index'
	end
end
