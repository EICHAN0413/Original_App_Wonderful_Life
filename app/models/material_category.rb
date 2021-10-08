class MaterialCategory < ApplicationRecord

    has_many :post_material_categories, dependent: :destroy
    has_many :post_material_category_posts, through: :post_material_categories, source: :post
    has_many :material_relationships, dependent: :destroy
end
