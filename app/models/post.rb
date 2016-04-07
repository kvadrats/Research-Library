class Post < ActiveRecord::Base
	validates :title, :description, :researchlink, presence: true
	validates :title, uniqueness: true
	belongs_to :subcategory
	belongs_to :user
	has_many :bookmarks



  	def self.search(search)
  		where("title || description LIKE ?", "%#{search}%") 
	end

end
