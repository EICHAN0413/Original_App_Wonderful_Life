require 'rails_helper'

RSpec.describe 'Procedure', type: :model do

    before do
        @post = FactoryBot.create(:post)
    end

describe ' 料理手順モデル機能', type: :model do

    describe 'バリデーションのテスト' do

        context '料理手順が空の場合' do
            it 'バリデーションにひっかかる' do
                procedure = Procedure.new(procedure: '' )
                expect(procedure).not_to be_valid
            end
        end
    
        
        context '料理手順が50文字以上の場合' do
            it 'バリデーションにひっかかる' do
                procedure = Procedure.new(procedure: 'A' *  51)
                expect(procedure).not_to be_valid
            end
        end


        context '料理手順が50文字以下で記載されている場合' do
            it 'バリデーションが通る' do
                procedure = FactoryBot.create(:procedure, post: @post)
                expect(procedure).to be_valid
            end
        end  
    end
end
end