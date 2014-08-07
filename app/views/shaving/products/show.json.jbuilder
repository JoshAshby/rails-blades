json.product @product, :name, :description, :id, :brand_id, :type_id

json.reviews do
  json.partial! partial: 'shaving/reviews/show', collection: @product.reviews, as: :review
end
