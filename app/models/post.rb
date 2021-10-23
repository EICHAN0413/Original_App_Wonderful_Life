class Post < ApplicationRecord

    mount_uploader :cooking_image, CookingUploader
    
    validates :title, presence: true, length: { maximum: 50 }
    validates :text, length: { maximum: 300 }

    has_many :post_recipe_categories, dependent: :destroy
    has_many :post_material_categories, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    belongs_to :user

    has_many :materials, dependent: :destroy
    accepts_nested_attributes_for :materials, allow_destroy: true
    has_many :procedures, dependent: :destroy
    accepts_nested_attributes_for :procedures, allow_destroy: true

    has_many :comments, dependent: :destroy


    enum tag:{ ガッツリ系:0,
               さっぱり味:1,
               筋トレ飯:2,

              }

    enum recipe_category: {
        肉料理:0,
        魚料理:1,
        麺料理:2,
        野菜料理:3,
        ご飯もの:4,
        パスタ:5,
        和食:6,
        洋食:7,
        イタリア料理:8,
        フランス料理:9,
        サラダ:10,
        たれ・ソース:11,
        粉物:12,
        おつまみ:13,
        時短:14,
        アニメ飯:15,
        ダイエット:16,
        高タンパク:17,
        お菓子:18,
        定番:19,
        その他:20
    }

    
end
