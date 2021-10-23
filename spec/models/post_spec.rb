require 'rails_helper'

RSpec.describe 'Post', type: :model do

  before do
    @user = FactoryBot.create(:user)
  end

  describe 'レシピ投稿モデル機能', type: :model do

    describe 'バリデーションのテスト' do

      context 'レシピのタイトルが空の場合' do
        it 'バリデーションにひっかかる' do
          post = Post.new(title: '', text: 'テスト１１１')
          expect(post).not_to be_valid
        end
      end

      context 'レシピタイトルが50文字以上の場合' do
        it 'バリデーションにひっかかる' do
          post = Post.new(title: 'テスト' * 51, text: 'テスト' )
          expect(post).not_to be_valid
        end
      end
      
      context 'レシピコメントが300文字以上の場合' do
        it 'バリデーションにひっかかる' do
          post = Post.new(title: '失敗テスト', text: 'n' * 301)
          expect(post).not_to be_valid
        end
      end


      context 'レシピのタイトルとコメントに内容が記載されている場合' do
        it 'バリデーションが通る' do
          post = FactoryBot.create(:post, title: 'Post', text: 'testload', user: @user)
          expect(post).to be_valid
        end
      end
    end
  end
end
  