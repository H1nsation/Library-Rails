class Book < ActiveRecord::Base
	validates_presence_of :title, :author, :description, :quantity
end
