class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.integer :user_id
      t.string :name
      t.string :specialty_id

      t.timestamps
    end
  end
end
