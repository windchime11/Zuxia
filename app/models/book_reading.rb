class BookReading < ActiveRecord::Base
	attr_accessible :report_id, :book_id, :starting_pp, :ending_pp, :sections, :duration_hr
	
	belongs_to :report
	has_many   :books,  :dependent => :destroy

  	default_scope :order => 'book_readings.created_at DESC'
  	
	validates :report_id, :presence => true
	validates :book_id, :presence => true
	validates :starting_pp, :presence => true
	validates :ending_pp, :presence => true
	validates :sections, :presence => true
	validates :duration_hr,   :presence => true	
end
