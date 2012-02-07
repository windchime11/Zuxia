class Report < ActiveRecord::Base
	attr_accessible :date_for, :date_created,  :author_id,  :reviewer_id

	belongs_to :user, :foreign_key => "author_id"
	has_many   :book_readings,  :dependent => :destroy

  	default_scope :order => 'reports.created_at DESC'
  	
	validates :author_id, :presence => true
	validates :reviewer_id, :presence => true
	#validates :description, :presence => true, :length => {:maximum => 200}
	

end
