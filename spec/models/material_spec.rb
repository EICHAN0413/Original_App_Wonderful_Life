require 'rails_helper'

RSpec.describe 'Material', type: :model do

    before do
        @post = FactoryBot.create(:post)
    end

describe '食材モデル機能', type: :model do

    describe 'バリデーションのテスト' do

        context '食材が空の場合' do
            it 'バリデーションにひっかかる' do
                material = Material.new(material: '', amount: '100g' )
                expect(material).not_to be_valid
            end
        end
    
        context '食材が20文字以上の場合' do
            it 'バリデーションにひっかかる' do
                material = Material.new(material: 'A' *  21, amount: 'B' * 10)
                expect(material).not_to be_valid
            end
        end

        context '分量が空の場合' do
            it 'バリデーションにひっかかる' do
                material = Material.new(material: 'テスト', amount: '' )
                expect(material).not_to be_valid
            end
        end
    
        context '分量が20文字以上の場合' do
            it 'バリデーションにひっかかる' do
                material = Material.new(material: 'A' *  10, amount: 'B' * 21)
                expect(material).not_to be_valid
            end
        end

        context '食材と分量が20文字以下で記載されている場合' do
            it 'バリデーションが通る' do
                material = FactoryBot.create(:material, post: @post)
                expect(material).to be_valid
            end
        end  
    end
end
end