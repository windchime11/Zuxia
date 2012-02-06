class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.date :date_for
      t.date :date_created
      t.integer :author_id
      t.integer :reviewer_id

      t.timestamps
    end
  end
end
