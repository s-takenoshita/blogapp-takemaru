require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:user) { create(:user) }

  context 'タイトルと記事が入力されている場合（その１）' do
    before do
      @article = user.articles.build({
        title: Faker::Lorem.characters(number: 20),
        content: Faker::Lorem.characters(number: 100)
      })
    end
    it '記事を保存できる。' do
      puts user.email
      expect(@article).to be_valid
    end
  end

  context 'タイトルと記事が入力されている場合（その２）' do
    let!(:article) { build(:article, user: user) }
    it '記事を保存できる。' do
      expect(article).to be_valid
    end
  end

  context 'タイトルが１文字の場合' do
    let!(:article) { build(:article, title: Faker::Lorem.characters(number: 1), user: user) }
    before do
      article.save
    end
    it '記事を保存できない。' do
      # byebug
      puts article.errors.messages[:title][0]
      expect(article.errors.messages[:title][0]).to eq("は4文字以上で入力してください")
    end
  end
end
