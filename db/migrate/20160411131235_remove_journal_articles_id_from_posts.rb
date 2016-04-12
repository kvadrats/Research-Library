class RemoveJournalArticlesIdFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :journal_articles_id, :refereneces
  end
end
