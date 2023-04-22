class CreateDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :image_url
      t.text :description
      t.integer :company_id
      t.timestamps
    end 
  end
end
