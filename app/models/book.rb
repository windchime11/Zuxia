class Book < ActiveRecord::Base
	attr_accessible :name, :author, :edition, :pub_year
	has_many :book_readings

  	default_scope :order => 'books.created_at DESC'
  	
	validates :name, :presence => true, :length => {:maximum => 100}
	validates :author,   :presence => true, :length => {:maximum => 140}
	
end
