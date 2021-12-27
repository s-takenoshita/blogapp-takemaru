require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'タイトルと記事が入力されていれば記事を保存できる。' do
    user = User.create!({
      email: 'test@example.com',
      password: '99999999'
    })
    article = user.articles.build({
      title: Faker::Lorem.characters(number: 20),
      content: Faker::Lorem.characters(number: 100)
    })
    expect(article).to be_valid
  end
end
