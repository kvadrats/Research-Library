class Post < ActiveRecord::Base
	validates :title, :description, :researchlink, presence: true
	validates :title, uniqueness: true
	belongs_to :subcategory
	belongs_to :user
	has_and_belongs_to_many :bookmarks
end
