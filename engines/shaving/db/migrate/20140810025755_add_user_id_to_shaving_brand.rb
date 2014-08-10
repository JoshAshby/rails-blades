class AddUserIdToShavingBrand < ActiveRecord::Migration
  def change
    add_column :shaving_brands, :user_id, :integer
  end
end
