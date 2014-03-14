class Product < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  attr_accessible :barcode, :barcode_type
end
