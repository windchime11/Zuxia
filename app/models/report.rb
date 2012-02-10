class Report < ActiveRecord::Base
	attr_accessible :date_for, :date_created,  :author_id,  :reviewer_id, :en_words_attributes, 
					:book_readings_attributes, :codings_attributes, :misc_things_attributes

	belongs_to :user, :foreign_key => "author_id"
	has_many   :en_words, :dependent => :destroy
	has_many   :book_readings,  :dependent => :destroy
	has_many   :codings, :dependent => :destroy
	has_many   :misc_things, :dependent => :destroy

	accepts_nested_attributes_for :en_words, :reject_if => lambda { |attributes| attributes['word'].blank? || attributes['meaning'].blank?},
	 :allow_destroy => true
	accepts_nested_attributes_for :book_readings, :reject_if => lambda { |attributes| attributes['book_id'].blank? || attributes['duration_hr'].blank?},
	 :allow_destroy => true
	accepts_nested_attributes_for :codings, :reject_if => lambda { |attributes| attributes['language'].blank? || attributes['duration_hr'].blank?},
	 :allow_destroy => true
	accepts_nested_attributes_for :misc_things, :reject_if => lambda { |attributes| attributes['description'].blank? || attributes['duration_hr'].blank?},
	 :allow_destroy => true

  	default_scope :order => 'reports.created_at DESC'
  	
	validates :author_id, :presence => true
	validates :reviewer_id, :presence => true
	

end
