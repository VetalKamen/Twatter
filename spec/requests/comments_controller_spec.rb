require 'rails_helper'

RSpec.describe CommentsController, type: :request do

  describe 'GET /comments' do
    it 'should get list of comments' do
      get comments_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /twats/<twat_id>/comments' do
    let(:twat) { create(:twat) }
    it 'should create comment' do
      comment = build(:comment)
      post twat_comments_path(twat), params: { comment: { body: comment.body, twat: twat } }
      get twat_path(twat)
      expect(response.body).to include 'Comment was successfully created.'
      expect(twat.comments.count).to eq(1)
    end
  end

  describe 'PUT /twats/<twat_id>/comments/<id>' do
    let(:twat) { create(:twat) }
    let(:comment) { create(:comment, twat: twat) }
    it 'should change comment with valid attributes' do
      put twat_comment_path(twat_id: twat.id, id: comment.id), params: { comment: { body: 'test comment' } }
      expect(comment.reload.body).to eq('test comment')
      get comment_path(comment)
      expect(response.body).to include 'Comment was successfully updated.'
    end

    it 'should change twat with invalid attributes' do
      put twat_comment_path(twat_id: twat.id, id: comment.id), params: { comment: { body: nil, twat: create(:twat) } }
      expect(response.status).to eq(422)
      expect(comment.reload.body).to eq(comment.body)
    end
  end

  describe 'DELETE /twats/<twat_id>/comments/<id>' do
    let(:twat) { create(:twat) }
    let(:comment) { create(:comment, twat: twat) }
    it 'should delete comment' do
      delete twat_comment_path(twat_id: twat.id, id: comment.id)
      expect(twat.comments.count).to eq(0)
      get comments_url
      expect(response.body).to include 'Comment was successfully destroyed.'
    end
  end

end
