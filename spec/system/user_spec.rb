require 'rails_helper'

RSpec.describe 'ユーザ管理機能', type: :system do
    

    describe 'ユーザ登録のテスト' do
        
        context 'ログインしていない場合' do
            it '新規登録ができること' do            
                visit new_user_registration_path
                fill_in "名前", with: 'テストユーザ1'
                fill_in "Eメール", with:'samplemail@gmail.com'
                fill_in "パスワード", with:'11111111'
                fill_in "パスワード(確認用)", with:'11111111'                
                click_on "登録する"
                click_on "マイページ"
                expect(page).to have_content 'テストユーザ1'
            end
            
            it 'レシピ画面に飛ぶとログイン画面に戻るテスト' do
                visit posts_path
                expect(current_path).to eq user_session_path
            end
        end
    end

    describe 'ログイン機能テスト' do
        before do
            @user = FactoryBot.create(:user)
            @second_user = FactoryBot.create(:second_user)
            @post=FactoryBot.create(:post, user: @second_user)
            @second_post=FactoryBot.create(:second_post, user: @second_user)
        end

        context 'ログインしていない状態でユーザデータがある場合' do
            it 'ログインできること' do
                visit user_session_path
                fill_in "Eメール", with: @user.email
                fill_in "パスワード", with: @user.password
                click_button "ログイン"
                expect(page).to have_content 'レシピ投稿'
            end
        end

        context 'ログインしている場合' do
        before do
            visit user_session_path
            fill_in "Eメール", with: @user.email
            fill_in "パスワード", with: @user.password
            click_button "ログイン"
        end

        it '自分の詳細画面に飛べること' do
            visit user_path(id: @user.id)
            expect(current_path).to eq user_path(id: @user.id)
        end

        it '他人のユーザ情報の編集ページへ飛べないこと' do
            visit edit_user_registration_path(id: @second_user.id)
            expect(page).to have_content 'テストプロフィール１'
        end

        it '他人の投稿を編集できないこと'do
            visit edit_post_path(id: @post)
            expect(current_path).to eq posts_path
        end

        it 'ログアウトできること' do
            click_on "ログアウト"
            expect(current_path).to eq root_path
        end
    end
    end

    describe 'ゲストログイン機能テスト' do

        context 'ログインしていない場合' do
            it 'ゲストログインできること' do
                visit root_path
                click_on "ゲストログイン", match: :first
                expect(page).to have_content 'ゲスト'
            end
            
            it '管理者ログインできること' do
                visit root_path
                click_on "管理者ログイン", match: :first
                expect(page).to have_content '管理者'
            end


        end
    end

    describe '管理者画面のテスト' do
        before do
            @user = FactoryBot.create(:user)
            @second_user = FactoryBot.create(:second_user)
        end
        
        context '管理ユーザの作成' do
            it '管理者は管理画面にアクセスできる' do
                visit user_session_path
                fill_in "Eメール", with: @second_user.email
                fill_in "パスワード", with: @second_user.password
                click_button "ログイン"
                click_on "管理画面へ"
                expect(page).to have_content "サイト管理"  
            end
        end

        

        context '一般ユーザがログインしている場合' do
            it '一般ユーザは管理画面にアクセスできないこと' do
                visit user_session_path
                fill_in "Eメール", with: @user.email
                fill_in "パスワード", with: @user.password
                click_button "ログイン"
                expect(page).not_to have_content '管理画面へ' 
            end
        end





    end
end