FactoryBot.define do
    factory :post, class: Post  do
        id {1}
        title { 'テスト1' }
        cooking_image {'75167714-円は白背景にサンプル-レッド-スタンプ-テキスト.jpeg'}
        text { 'Factoryで作ったデフォルトのコンテント１' }
        recipe_category { '肉料理' }
        tag { 'ガッツリ系' }
        association :user
    end

    factory :second_post, class: Post do
        id {2}
        title { 'テスト2' }
        cooking_image {'75167714-円は白背景にサンプル-レッド-スタンプ-テキスト.jpeg'}
        text { 'Factoryで作ったデフォルトのコンテント2' }
        recipe_category { '魚料理' }
        tag { 'さっぱり系' }
        association :user
    end

    factory :third_post, class: Post do
        id {3}
        title { 'テスト3' }
        cooking_image {'75167714-円は白背景にサンプル-レッド-スタンプ-テキスト.jpeg'}
        text { 'Factoryで作ったデフォルトのコンテント3' }
        recipe_category { '麺料理' }
        tag { '筋トレ飯' }
        association :user
    end

end