require 'rails_helper'

RSpec.describe 'レシピ投稿機能', type: :system do
    
    
    describe '一覧表示機能' do
        before do
            @user = FactoryBot.create(:user)
            visit user_session_path
            fill_in "Eメール", with: @user.email
            fill_in "パスワード", with: @user.password
            click_button 'ログイン'
            FactoryBot.create(:post, user: @user) 
            FactoryBot.create(:second_post, user: @user) 
            FactoryBot.create(:third_post, user: @user)
            visit posts_path
        end
        
        context '一覧画面に遷移した場合' do
            it '作成済みレシピ一覧が表示される' do
                expect(page).to have_content 'テストレシピ1'
            end
        end

        context 'タイトルであいまい検索をした場合' do
            it "検索キーワードを含むレシピで絞り込まれる" do
                fill_in "タイトル", with: 'テストレシピ1'
                click_button '検索する'
                expect(page).to have_content 'テストレシピ1'
            end
        end
    end


    describe '新規作成機能' do
        
        before do
            @user = FactoryBot.create(:user)
            visit user_session_path
            fill_in "Eメール", with: @user.email
            fill_in "パスワード", with: @user.password
            click_button 'ログイン'
            visit posts_path
        end

        context 'レシピを新規作成した場合' do
            it '作成したレシピが表示される' do
                visit new_post_path
                fill_in "レシピ名", with: 'テストレシピ'
                fill_in "コメント", with: 'テストコメント'
                attach_file  "post[cooking_image]", "#{Rails.root}/spec/fixtures/images/1828439.png"
                find('.add_material').click
                find('.add_procedure').click
                all('.find_material')[0].set('テスト材料1')
                all('.find_material')[1].set('テスト材料2')
                all('.find_amount')[0].set('テスト分量1')
                all('.find_amount')[1].set('テスト分量2')
                all('.find_procedure_image')[0].attach_file("#{Rails.root}/spec/fixtures/images/1828439.png")
                all('.find_procedure_image')[1].attach_file("#{Rails.root}/spec/fixtures/images/1828439.png")
                all('.find_procedure')[0].set('テスト手順1')
                all('.find_procedure')[1].set('テスト手順2')
                select "ガッツリ系", from: 'タグ'
                select "肉料理", from: 'レシピカテゴリー'
                click_on '投稿する'
                click_on '詳細を見る'
                expect(page).to have_content 'テストコメント'
                expect(page).to have_content 'テストレシピ'
                expect(page).to have_content 'テスト材料1'
                expect(page).to have_content 'テスト分量2'
                expect(page).to have_content 'テスト手順1'
                expect(page).to have_content 'テスト手順2'
                expect(page).to have_content 'ガッツリ系'
                expect(page).to have_content '肉料理'
                # all('#')[0].set(入力値)
            end
        end
    end
  
    describe '詳細表示機能' do

        before do
            @user = FactoryBot.create(:user)
            visit user_session_path
            fill_in "Eメール", with: @user.email
            fill_in "パスワード", with: @user.password
            click_button 'ログイン'
            visit posts_path
        end

        context '任意のレシピ詳細画面に遷移した場合' do
            it '該当レシピの内容が表示される' do
                FactoryBot.create(:post, user: @user)
                visit posts_path
                click_on '詳細を見る'
                
                expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
            end

            it '投稿ユーザはレシピを編集できる' do
                FactoryBot.create(:post, user: @user)
                visit posts_path
                click_on '詳細を見る'
                click_on '編集'
                expect(page).to have_content '編集画面'
            end
        end



        context 'レシピカテゴリー画面に遷移した場合' do
            it 'レシピをもっと見るでカテゴリー毎でソートされている' do
                FactoryBot.create(:post, user: @user)
                FactoryBot.create(:second_post, user: @user)
                FactoryBot.create(:third_post, user: @user)
                visit recipe_posts_path
                click_on 'レシピをもっと見る', match: :first
                click_on '詳細を見る', match: :first
                expect(page).to have_content '肉料理'
            end
        end
    end
end