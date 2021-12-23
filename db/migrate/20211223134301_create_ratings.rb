class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :score
      t.string :reason
      t.float :recommend_price
      t.references :user 
      t.references :dish 
    end
  end
end
