require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'タイトルと記事が入力されている場合（その１）' do
    before do
      user = User.create!({
        email: 'test1@example.com',
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

  context 'タイトルと記事が入力されている場合（その２）' do
    let!(:user) do
      user = User.create!({
        email: 'test2@example.com',
        password: '99999999'
      })
    end
    let!(:article) do
      user.articles.build({
        title: Faker::Lorem.characters(number: 20),
        content: Faker::Lorem.characters(number: 100)
      })
    end
    it '記事を保存できる。' do
      expect(article).to be_valid
    end
  end

  context 'タイトルが１文字の場合' do
  end
end
