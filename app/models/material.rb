class Material < ApplicationRecord
    belongs_to :post

    validates :material, length: { maximum: 20 }, presence: true
    validates :amount, length: { maximum: 20 }, presence: true
    
    
end
