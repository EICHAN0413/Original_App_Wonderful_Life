class Material < ApplicationRecord
    has_many :material_relationships, dependent: :destroy
    has_many :material_relationship_material_categories, through: :material_relationships, source: :material_category
    belongs_to :post
    
end
