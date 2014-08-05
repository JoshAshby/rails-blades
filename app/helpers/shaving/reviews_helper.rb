module Shaving::ReviewsHelper
  def review_time review
    review.updated_at.to_s :short_12
  end

  def review_list_item review
    review.product.name + " - " + review_time(review)
  end
end
