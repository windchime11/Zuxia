class MiscThing < ActiveRecord::Base
	attr_accessible :id, :report_id, :description, :duration_hr
	belongs_to :report

  	default_scope :order => 'misc_things.created_at DESC'
  	
	#validates :report_id, :presence => true
	validates :description, :presence => true, :length => {:maximum => 200}
	validates :duration_hr, :presence => true
end

