User.create! (
    {
        id: 1000,
        name:  "管理者",
        email: "admin@example.jp",
        password:  "11111111",
        admin: true
        }
    )

50.times do |n|
    User.seed do |s|
        s.email= "test#{n + 1}@test.com"
        s.name="テスト太郎#{n + 1}"
        s.password = "12345678#{n+1}"
        s.profile = "テストプロフィール#{n+1}"
        s.id = n + 1 
    end
end


50.times do |n|
    Post.seed do |s|
        rand1 = rand(0..2)
        rand2 = rand(0..20)
        s.user = User.find_by(name: "テスト太郎#{n + 1}")
        s.id = n + 1
        s.title = "テスト#{n + 1}"
        s.cooking_image = Rails.root.join("db/fixtures/images/22173284.png").open
        s.tag = rand1
        s.recipe_category = rand2
        s.text = "テスト投稿#{n + 1}だよ"
    end
end

50.times do |n|
    Material.seed do |s|
        s.id = n + 1
        s.material = "テスト材料#{n + 1}"
        s.amount = "#{n + 1}g"
        s.post = Post.find_by(title: "テスト#{n + 1}") 
    end
end

50.times do |n|
    Material.seed do |s|
        s.id = n + 51
        s.material = "テスト材料#{n + 51}"
        s.amount = "#{n + 51}g"
        s.post = Post.find_by(title: "テスト#{n + 1}") 
    end
end

50.times do |n|
    Material.seed do |s|
        s.id = n +101
        s.material = "テスト材料#{n + 101}"
        s.amount = "#{n + 101}g"
        s.post = Post.find_by(title: "テスト#{n + 1}") 
    end
end

50.times do |n|
    Procedure.seed do |s|
        s.id = n + 1
        s.procedure = "テスト手順#{n + 1}"
        s.procedure_image = Rails.root.join("db/fixtures/images/22173284.png").open
        s.post = Post.find_by(title: "テスト#{n + 1}") 
    end
end

50.times do |n|
    Procedure.seed do |s|
        s.id = n + 51
        s.procedure = "テスト手順#{n + 51}"
        s.procedure_image = Rails.root.join("db/fixtures/images/22173284.png").open
        s.post = Post.find_by(title: "テスト#{n + 1}") 
    end
end

5.times do |n|
    Procedure.seed do |s|
        s.id = n + 101
        s.procedure = "テスト手順#{n + 101}"
        s.procedure_image = Rails.root.join("db/fixtures/images/22173284.png").open
        s.post = Post.find_by(title: "テスト#{n + 1}") 
    end
end

50.times do |n|
    Favorite.seed do |s|
        s.id= n + 1
        s.user= User.find_by(id: n + 1)
        s.post_id= 50 - n
    end
end

50.times do |n|
    Relationship.seed do |s|
        s.id= n + 1
        s.followed_id= n + 1
        s.follower_id= n + 1
    end
end

50.times do |n|
    Comment.seed do |s|
        s.id= n + 1
        s.user= User.find_by(id: n + 1)
        s.post= Post.find_by(id: n + 1)
        s.content= "テストコメント#{ n + 1 }"
    end
end