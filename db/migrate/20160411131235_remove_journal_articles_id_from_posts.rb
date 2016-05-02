class RemoveJournalArticlesIdFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :journal_article_id, :refereneces
  end
end
