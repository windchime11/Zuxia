class BookReading < ActiveRecord::Base
	attr_accessible :report_id, :book_id, :starting_pp, :ending_pp, :sections, :duration_hr
	
	belongs_to :report
	belongs_to :book

  	default_scope :order => 'book_readings.created_at DESC'
  	
	validates :book_id, :presence => true
	validates :duration_hr,   :presence => true	
end
