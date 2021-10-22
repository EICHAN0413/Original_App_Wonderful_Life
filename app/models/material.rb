class Material < ApplicationRecord
    has_many :material_relationships, dependent: :destroy
    has_many :material_relationship_material_categories, through: :material_relationships, source: :material_category
    belongs_to :post

    validates :material, length: { maximum: 20 }
    validates :amount, length: { maximum: 20 }
    
end
