class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :list
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps null: false
    end
  end
end
