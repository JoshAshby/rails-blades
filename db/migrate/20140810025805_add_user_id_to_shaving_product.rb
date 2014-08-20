class AddUserIdToShavingProduct < ActiveRecord::Migration
  def change
    add_column :shaving_products, :user_id, :integer
  end
end
