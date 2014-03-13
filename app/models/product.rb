class Product < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  attr_accessible :barcode
end
