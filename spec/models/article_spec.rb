require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'タイトルと記事が入力されている場合' do
    before do
      user = User.create!({
        email: 'test@example.com',
        password: '99999999'
      })
      @article = user.articles.build({
        title: Faker::Lorem.characters(number: 20),
        content: Faker::Lorem.characters(number: 100)
      })
    end
    it '記事を保存できる。' do
      expect(@article).to be_valid
    end
  end
end
