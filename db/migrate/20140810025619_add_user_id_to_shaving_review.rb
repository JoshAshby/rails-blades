class AddUserIdToShavingReview < ActiveRecord::Migration
  def change
    add_column :shaving_reviews, :user_id, :integer
  end
end
