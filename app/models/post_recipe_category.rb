class PostRecipeCategory < ApplicationRecord
  belongs_to :post
  belongs_to :recipe
end
