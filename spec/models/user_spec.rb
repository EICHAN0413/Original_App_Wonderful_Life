require 'rails_helper'

RSpec.describe 'User', type: :model do

describe ' ユーザモデル機能', type: :model do

    describe 'バリデーションのテスト' do
        
        context 'プロフィールが300文字以上の場合' do
            it 'バリデーションにひっかかる' do
                user = User.new(name: 'テスト' , profile: 'テスト' * 101 )
                expect(user).not_to be_valid
            end
        end


        context 'プロフィールに内容が記載されている場合' do
            it 'バリデーションが通る' do
                user = FactoryBot.create(:user, name: 'user', profile: 'テスト')
                expect(user).to be_valid
            end
        end  
    end
end
end