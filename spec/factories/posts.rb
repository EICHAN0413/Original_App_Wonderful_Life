FactoryBot.define do
    factory :post, class: Post  do
        id {1}
        title { 'テストレシピ1' }
        cooking_image {'75167714-円は白背景にサンプル-レッド-スタンプ-テキスト.jpeg'}
        text { 'Factoryで作ったデフォルトのコンテント１' }
        recipe_category { '肉料理' }
        tag {0 }
        association :user
    end

    factory :second_post, class: Post do
        id {2}
        title { 'テストレシピ2' }
        cooking_image {'75167714-円は白背景にサンプル-レッド-スタンプ-テキスト.jpeg'}
        text { 'Factoryで作ったデフォルトのコンテント2' }
        recipe_category { '魚料理' }
        tag { 1 }
        association :user
    end

    factory :third_post, class: Post do
        id {3}
        title { 'テストレシピ3' }
        cooking_image {'75167714-円は白背景にサンプル-レッド-スタンプ-テキスト.jpeg'}
        text { 'Factoryで作ったデフォルトのコンテント3' }
        recipe_category { '麺料理' }
        tag { 2 }
        association :user
    end

end