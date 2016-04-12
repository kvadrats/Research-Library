class RemoveResearchFromPosts < ActiveRecord::Migration
  def change
  	change_table(:posts) do |t|
      t.remove :researchlink
  	  t.remove :researchauth
  	  t.remove :researchdate
	end
  end
end
