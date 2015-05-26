class Loan < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  def checkout_date 
  	created_at.to_date.to_s(:db)
  end

  def due_date
  	(created_at + 14.days).to_date.to_s(:db)   
  end
   
end
