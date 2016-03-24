class CreateJoinTableUserSubcategory < ActiveRecord::Migration
  def change
    create_join_table :users, :subcategories do |t|
      # t.index [:user_id, :subcategory_id]
      # t.index [:subcategory_id, :user_id]
    end
  end
end
