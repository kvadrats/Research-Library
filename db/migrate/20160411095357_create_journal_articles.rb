class CreateJournalArticles < ActiveRecord::Migration
  def change
    create_table :journal_articles do |t|
      t.string :title
      t.string :link
      t.string :author
      t.date :articledate
      t.references :user, index: true, foreign_key: true
    end
  end
end
