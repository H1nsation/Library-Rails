class LoansController < ApplicationController
	def index
		@loans = Loan.where(user_id: current_user)
	end
end
