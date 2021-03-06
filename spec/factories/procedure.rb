FactoryBot.define do

    factory :procedure, class: Procedure do
        procedure {'サンプルテスト1'}
        procedure_image {'75167714-円は白背景にサンプル-レッド-スタンプ-テキスト.jpeg'}
    end

    factory :second_procedure, class: Procedure do
        procedure {'サンプルテスト2'}
        procedure_image {'75167714-円は白背景にサンプル-レッド-スタンプ-テキスト.jpeg'}
    end

    factory :third_procedure, class: Procedure do
        procedure {'サンプルテスト3'}
        procedure_image {'75167714-円は白背景にサンプル-レッド-スタンプ-テキスト.jpeg'}
    end

end

