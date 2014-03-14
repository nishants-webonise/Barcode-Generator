class AddBarcodeTypeToProducts < ActiveRecord::Migration
  def up
    add_column :products, :barcode_type, :string
  end
  def down
    remove_column :products, :barcode_type
  end
end
