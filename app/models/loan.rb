class Loan < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  def checkout_date 
  	created_at.to_date.to_s(:db)
  end

  def due_date
  	(created_at + 14.days).to_date.to_s(:db)   
  end

 def self.money_owed(current_user)
  	total = 0
  	Loan.where(user_id: current_user).each { |loan| 
  		if loan.created_at.to_date + 30.days < Date.current
  			total += 5
  		elsif loan.created_at.to_date + 20.days < Date.current
  			total += 3
  		elsif loan.created_at.to_date == Date.current
  			total += 1
  		end
  	}
  	total
	end 
end
