require 'rails_helper'

RSpec.describe 'コメント投稿機能', type: :system do

    describe 'コメント投稿機能' do
        
        before do
            @user = FactoryBot.create(:user)
            @second_user = FactoryBot.create(:second_user)
            @post=FactoryBot.create(:post, user: @user) 
            @second_post=FactoryBot.create(:second_post, user: @second_user) 
            visit user_session_path
            fill_in "Eメール", with: @user.email
            fill_in "パスワード", with: @user.password
            click_button 'ログイン'
            visit posts_path
        end

        context 'コメントを投稿した場合' do
            it '作成したコメントが表示される' do
                visit post_path(id: @second_post)
                fill_in "コメント欄", with: 'テストコメント1'
                click_on 'コメントする'
                expect(page).to have_content 'テストコメント'
            end
        end
    end
end