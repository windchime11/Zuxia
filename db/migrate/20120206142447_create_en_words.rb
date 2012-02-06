class CreateEnWords < ActiveRecord::Migration
  def change
    create_table :en_words do |t|
      t.integer :report_id
      t.string :word
      t.string :meaning
      t.string :synonyms
      t.string :sentence

      t.timestamps
    end
  end
end
