require 'rails_helper'

RSpec.describe 'フォロー管理機能', type: :system do
    

    describe 'フォロー機能のテスト' do

        before do 
            @user = FactoryBot.create(:user)
            @second_user = FactoryBot.create(:second_user)
            visit user_session_path
            fill_in "Eメール", with: @user.email
            fill_in "パスワード", with: @user.password
            click_button "ログイン"
        end
        
        context 'フォローしていないユーザがいる場合' do
            it 'フォローができること' do            
                visit user_path(id: @second_user)             
                click_on "フォロー"
                expect(page).to have_content 'フォロワー1'
            end
        end

        context 'フォローしているユーザがいる場合' do
            it 'フォロー解除できること' do            
                visit user_path(id: @second_user)             
                click_on "フォロー"
                click_on "フォロー解除"
                expect(page).to have_content 'フォロワー0'
            end
        end
            
    end
end