class AddSubcategoyIdToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :subcategory, index: true, foreign_key: true
  end
end
