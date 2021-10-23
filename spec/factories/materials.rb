FactoryBot.define do

    factory :material, class: Material do 
        id {1}
        material {'テスト材料１'}
        amount {'テスト分量1g'}
        association :post
    end

    factory :second_material, class: Material do 
        id {2}
        material {'テスト材料2'}
        amount {'テスト分量2g'}
        association :post
    end

    factory :third_material, class: Material do 
        id {3}
        material {'テスト材料3'}
        amount {'テスト分量3g'}
        association :post
    end
    
end