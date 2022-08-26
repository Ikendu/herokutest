class CreateCreates < ActiveRecord::Migration[7.0]
  def change
    create_table :creates do |t|
      t.string :name
      t.string :price
      t.string :color
      t.string :type
      t.string :image

      t.timestamps
    end
  end
end
