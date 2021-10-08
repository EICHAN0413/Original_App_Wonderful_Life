class Recipe < ApplicationRecord
    has_many :post_recipe_categories, dependent: :destroy
    has_many :post_recipe_category_posts, through: :post_recipe_categories, source: :post
end
