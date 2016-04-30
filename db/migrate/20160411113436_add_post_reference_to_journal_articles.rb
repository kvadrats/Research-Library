class AddPostReferenceToJournalArticles < ActiveRecord::Migration
  def change
  	add_reference :journal_articles, :post, index: true
  end
end
