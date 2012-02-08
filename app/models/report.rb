class Report < ActiveRecord::Base
	attr_accessible :date_for, :date_created,  :author_id,  :reviewer_id, :en_words_attributes, :book_readings_attributes

	belongs_to :user, :foreign_key => "author_id"
	has_many   :book_readings,  :dependent => :destroy
	has_many   :en_words, :dependent => :destroy

	accepts_nested_attributes_for :en_words, :reject_if => lambda { |attributes| attributes['word'].blank? || attributes['meaning'].blank?}, :allow_destroy => true

	accepts_nested_attributes_for :book_readings, :reject_if => lambda { |attributes| attributes['book_id'].blank?}, :allow_destroy => true

  	default_scope :order => 'reports.created_at DESC'
  	
	validates :author_id, :presence => true
	validates :reviewer_id, :presence => true
	#validates :description, :presence => true, :length => {:maximum => 200}
	

end
