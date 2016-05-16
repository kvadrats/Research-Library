class Category < ActiveRecord::Base
	validates :name, presence: true
	has_many :subcategories, dependent: :destroy
	has_many :posts, through: :subcategories
end
