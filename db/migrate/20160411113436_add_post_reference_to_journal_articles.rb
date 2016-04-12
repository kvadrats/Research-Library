class AddPostReferenceToJournalArticles < ActiveRecord::Migration
  def change
  	add_reference :journal_articles, :post, index: true, foreign_key: true
  end
end
