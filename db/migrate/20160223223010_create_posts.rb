class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.text :articlelink
      t.text :researchlink
      t.string :researchauth
      t.string :articleauth
      t.date :researchdate

      t.timestamps null: false
    end
  end
end
