class AddPostToResearchPaper < ActiveRecord::Migration
  def change
    add_reference :research_papers, :post, index: true, foreign_key: true
  end
end
