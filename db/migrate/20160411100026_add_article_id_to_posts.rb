class AddArticleIdToPosts < ActiveRecord::Migration
  def change
	add_reference :posts, :journal_article, index: true, foreign_key: true
  end
end
