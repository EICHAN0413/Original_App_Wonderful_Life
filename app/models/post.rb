class Post < ApplicationRecord

    mount_uploader :cooking_image, CookingUploader
    mount_uploader :procedure_image, ProcedureUploader

    has_many :post_recipe_categories, dependent: :destroy
    has_many :post_material_categories, dependent: :destroy


    enum tag:{ ガッツリ系:0,
               さっぱり味:1,
               時短:2,
               高タンパク:3,
               筋トレ飯:4,

              }

    
end
