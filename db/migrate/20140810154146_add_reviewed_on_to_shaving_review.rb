class AddReviewedOnToShavingReview < ActiveRecord::Migration
  def change
    add_column :shaving_reviews, :reviewed_on, :date
  end
end
