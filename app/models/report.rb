class Report < ActiveRecord::Base
	attr_accessible :date_for, :date_created,  :author_id,  :reviewer_id

	belongs_to :user
	has_many   :book_readings,  :dependent => :destroy

  	default_scope :order => 'miscthings.created_at DESC'
  	
	validates :report_id, :presence => true
	validates :description, :presence => true, :length => {:maximum => 200}
	validates :duration_hr, :presence => true

	
end
