class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :barcode

      t.timestamps
    end
  end
end
