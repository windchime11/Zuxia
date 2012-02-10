class Coding < ActiveRecord::Base
	attr_accessible :id, :report_id, :description, :language, :duration_hr
	belongs_to :report

  	default_scope :order => 'codings.created_at DESC'
  	
	#validates :report_id, :presence => true
	#validates :description, :presence => true, :length => {:maximum => 200}
	validates :language, :presence => true
	validates :duration_hr,   :presence => true	
end
