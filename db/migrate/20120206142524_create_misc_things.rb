class CreateMiscThings < ActiveRecord::Migration
  def change
    create_table :misc_things do |t|
      t.integer :report_id
      t.string :description
      t.float :duration_hr

      t.timestamps
    end
  end
end
