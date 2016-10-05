class RemoveAllergyFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :allergy, :string
  end
end
