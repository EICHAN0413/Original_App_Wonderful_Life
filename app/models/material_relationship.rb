class MaterialRelationship < ApplicationRecord
  belongs_to :material_category
  belongs_to :material
end
