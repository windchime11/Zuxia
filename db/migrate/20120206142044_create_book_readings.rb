class CreateBookReadings < ActiveRecord::Migration
  def change
    create_table :book_readings do |t|
      t.integer :report_id
      t.integer :book_id
      t.integer :starting_pp
      t.integer :ending_pp
      t.string :sections
      t.float :duration_hr

      t.timestamps
    end
  end
end
