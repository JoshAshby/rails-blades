module Shaving::ReviewsHelper
  def review_list_item review
    review.product.name + " - " + updated_at(review)
  end
end
