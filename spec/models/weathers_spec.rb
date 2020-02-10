require 'rails_helper'

RSpec.describe Weather, type: :model do
  before do 
    @weather = build(:weather)
  end

  describe 'Validation' do
    it '必要なAttributeが設定されていればOK' do
      expect(@weather.valid?).to eq(true)
    end

  #   it 'nameが空だとNG' do
  #     @user.name = ''
  #     expect(@user.valid?).to eq(false)
  #   end

  #   it 'emailが空だとNG' do
  #     @user.email = ''
  #     expect(@user.valid?).to eq(false)
  #   end
  end
end