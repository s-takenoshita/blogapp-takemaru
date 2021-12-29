require 'rails_helper'

RSpec.describe 'Api::Comments', type: :request do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, user: user)}
  let!(:comments) {create_list(:comment, 3, article: article)}

  describe 'GET /api/comments' do
    it 'Status => 200' do
      get api_comments_path(article_id: article.id)
      expect(response).to have_http_status(200)
      body = JSON.parse(response.body)
      expect(body.length).to eq 3
      expect(body[0]['content']).to eq comments.first.content
    end
  end
end
