class CreateResearchPapers < ActiveRecord::Migration
  def change
    create_table :research_papers do |t|
      t.string :title
      t.string :link
      t.string :university
      t.decimal :price, precision: 8, scale: 2
      t.string :author
      t.date :researchdate
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
