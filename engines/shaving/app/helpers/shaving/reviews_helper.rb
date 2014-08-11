module Shaving
  module ReviewsHelper
    def review_list_item review
      review.product.name + " - " + reviewed_on(review)
    end


    def reviewed_on review
      review.reviewed_on.to_s :short_12
    end
  end
end
