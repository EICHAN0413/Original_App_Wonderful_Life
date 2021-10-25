require 'rails_helper'

RSpec.describe 'お気に入り管理機能', type: :system do
    

    describe 'お気に入り機能のテスト' do

        before do 
            @user = FactoryBot.create(:user)
            @second_user = FactoryBot.create(:second_user)
            @post=FactoryBot.create(:post, user: @user) 
            @second_post=FactoryBot.create(:second_post, user: @second_user) 
            visit user_session_path
            fill_in "Eメール", with: @user.email
            fill_in "パスワード", with: @user.password
            click_button "ログイン"
        end
        
        context 'お気に入りしていないレシピがある場合' do
            it 'お気に入りができること' do            
                visit post_path(id: @second_post)   
                sleep 5
                click_on "お気に入りする"
                expect(page).to have_content 'レシピをお気に入りにしました'
            end
        end

        context 'お気に入りしているレシピがある場合' do
            it 'お気に入り解除できること' do            
                visit post_path(id: @second_post)   
                sleep 5
                click_on "お気に入りする"
                click_on "お気に入り解除する"
                expect(page).to have_content 'レシピをお気に入り解除しました'
            end
        end

    end
end