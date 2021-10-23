require 'rails_helper'

RSpec.describe 'Comment', type: :model do

    before do
        @post = FactoryBot.create(:post)
    end

describe 'コメントモデル機能', type: :model do

    describe 'バリデーションのテスト' do

        context 'コメントが空の場合' do
            it 'バリデーションにひっかかる' do
                comment = Comment.new(content: '' )
                expect(comment).not_to be_valid
            end
        end
    
        context 'コメントが100文字以上の場合' do
            it 'バリデーションにひっかかる' do
                comment = Comment.new(content: 'A' *  101)
                expect(comment).not_to be_valid
            end
        end

        context 'コメントが100文字以下で記載されている場合' do
            it 'バリデーションが通る' do
                comment = FactoryBot.create(:comment, post: @post)
                expect(comment).to be_valid
            end
        end  
    end
end
end