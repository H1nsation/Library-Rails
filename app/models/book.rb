class Book < ActiveRecord::Base
	has_many :loans
	has_many :users, through: :loans
	has_attached_file :cover
	validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

	validates_presence_of :title, :author, :description, :quantity

	def num_available 
		quantity - loans.size
	end

	def is_available?
		quantity - loans.size > 0
	end

	def contains_user?(user)
		loans.each { |l| return true if l.user_id == user.id }
		false
	end
end

