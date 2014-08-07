module Shaving
  module ReviewsHelper
    def review_list_item review
      review.product.name + " - " + updated_at(review)
    end
  end
end
