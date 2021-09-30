class PostMaterialCategory < ApplicationRecord
  belongs_to :post
  belongs_to :material_category
end
