class Subcategory < ActiveRecord::Base
	has_many :posts
	belongs_to :category
	has_and_belongs_to_many :users
end
