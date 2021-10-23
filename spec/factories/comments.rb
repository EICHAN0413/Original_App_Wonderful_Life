FactoryBot.define do

    factory :comment, class: Comment do 
        content { 'テスト１'}
    end

    factory :second_comment, class: Comment do 
        content { 'テスト2'}
    end

    factory :third_comment, class: Comment do 
        content { 'テスト3'}
    end
    
end