class CreateCodings < ActiveRecord::Migration
  def change
    create_table :codings do |t|
      t.integer :report_id
      t.string :description
      t.string :language
      t.float :duration_hr

      t.timestamps
    end
  end
end
