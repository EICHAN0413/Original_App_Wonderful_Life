FactoryBot.define do

    factory :user, class: User  do
        id { 1 }
        name {'テストユーザ1'}
        email {'sample@gmail.com'}
        password {'11111111'}
        admin { false }
        profile {'テストプロフィール１'}
        birth_date {'1999-09-09'}
        public_or_private {'false'}
    end

    factory :second_user, class: User do
        id { 2 }
        name {'テストユーザ2'}
        email {'sample2@gmail.com'}
        password {'22222222'}
        admin { true }
        profile {'テストプロフィール2'}
        birth_date {'2000-10-09'}
        public_or_private {'false'}
    end

    factory :third_user, class: User do
        id { 3 }
        name {'テストユーザ3'}
        email {'sample3@gmail.com'}
        password {'33333333'}
        admin { false }
        profile {'テストプロフィール3'}
        birth_date {'2010-10-09'}
        public_or_private {'true'}
    end

end