class Post < ActiveRecord::Base
	validates :title, :description, presence: true
	validates :title, uniqueness: true
	belongs_to :subcategory
	belongs_to :user
	has_many :bookmarks
	has_many :journal_articles, :dependent => :destroy
	has_many :research_papers, :dependent => :destroy
	has_many :comments, :dependent => :destroy

	accepts_nested_attributes_for :research_papers, reject_if: proc { |attributes| attributes['link'].blank? }, allow_destroy: true
	accepts_nested_attributes_for :journal_articles, reject_if: proc { |attributes| attributes['link'].blank? }, allow_destroy: true



  	def self.search(search)
  		where("title || description LIKE ?", "%#{search}%") 
	end

end
