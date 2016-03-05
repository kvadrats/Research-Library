class PostsAndSubcategoriesJoin < ActiveRecord::Migration
  def change
  	create_table :posts_subcategories, id: false do |t|
      t.belongs_to :post, index: true
      t.belongs_to :subcategory, index: true
    end
  end
end
