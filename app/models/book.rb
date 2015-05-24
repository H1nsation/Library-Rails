class Book < ActiveRecord::Base
	has_many :loans
	has_many :users, through: :loans

	validates_presence_of :title, :author, :description, :quantity

	def num_available 
		quantity - loans.size
	end

	def is_available?
		if quantity - loans.size > 0
			true
		else 
			false
		end
	end

	def contains_user?(user)
		loans.each { |l| return true if l.user_id == user.id }
		false
	end

end

