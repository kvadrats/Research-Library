class AddArticleIdToPosts < ActiveRecord::Migration
  def change
	add_reference :posts, :journal_articles, index: true
  end
end
