class Post < ActiveRecord::Base
	validates :title, :description, :researchlink, presence: true
	validates :title, uniqueness: true
	belongs_to :subcategory
	belongs_to :user
end
