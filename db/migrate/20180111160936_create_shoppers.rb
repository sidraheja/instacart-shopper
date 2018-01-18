class CreateShoppers < ActiveRecord::Migration[5.1]
  def change
    create_table :shoppers do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone
    end
  end
end
