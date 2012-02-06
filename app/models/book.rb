class Book < ActiveRecord::Base
	attr_accessible :name, :author, :edition
	belongs_to :bookreading

  	default_scope :order => 'books.created_at DESC'
  	
	validates :name, :presence => true, :length => {:maximum => 140}
	validates :author,   :presence => true, :length => {:maximum => 140}
	#validates :edition, :presence => true

end
