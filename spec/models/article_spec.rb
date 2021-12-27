require 'rails_helper'

RSpec.describe Article, type: :model do
  user = User.create!({
    email: 'test6@example.com',
    password: '99999999'
  })

  context 'タイトルと記事が入力されている場合（その１）' do
    before do
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
    let!(:article) do
      user.articles.create({
        title: Faker::Lorem.characters(number: 1),
        content: Faker::Lorem.characters(number: 100)
      })
    end
    it '記事を保存できない。' do
      # byebug
      expect(article.errors.messages[:title][0]).to eq('は４文字以上で入力してください')
    end
  end
end
