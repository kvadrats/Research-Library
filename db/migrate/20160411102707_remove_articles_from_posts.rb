class RemoveArticlesFromPosts < ActiveRecord::Migration
  def change
  	change_table(:posts) do |t|
  		t.remove :articlelink
  		t.remove :articleauth
	end
  end
end
