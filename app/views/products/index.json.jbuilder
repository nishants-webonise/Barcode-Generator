json.array!(@products) do |product|
  json.extract! product, :barcode
  json.url product_url(product, format: :json)
end