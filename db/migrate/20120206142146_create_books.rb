class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.integer :edition
      t.integer :pub_year

      t.timestamps
    end
  end
end
