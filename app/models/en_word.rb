class EnWord < ActiveRecord::Base
	attr_accessible :report_id, :word, :meaning, :sentence, :synonyms
	belongs_to :report

  	default_scope :order => 'en_words.created_at DESC'
  	
	validates :word, :presence => true, :length => {:maximum => 200}
	validates :meaning, :presence => true
		
end
