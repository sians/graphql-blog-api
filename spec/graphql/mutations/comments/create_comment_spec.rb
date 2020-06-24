require 'rails_helper'

module Mutations
  module Comments
    RSpec.describe CreateCommentMutation, type: :request do
      describe '.resolve' do
        it 'creates a comment' do
          user = create(:user)
          post = create(:post, title: "Post Title", user: user)

          expect do
            post '/graphql', params: { query: query(user_id: user.id, post_id: post.id) }
          end.to change { Comment.count }.by(1)
        end

        it 'returns a comment' do
          user = create(:user)
          post = create(:post, title: "Post Title", user: user)

          post '/graphql', params: { query: query(user_id: user.id, post_id: post.id) }
          json = JSON.parse(response.body)
          data = json['data']['createComment']

          expect(data).to include(
            'id'              => be_present,
            'text'           => "Text of Comment",
            'createdAt'          => be_present
          )
        end
      end

      def query(user_id:, post_id:)
        <<~GQL
          mutation {
            createComment(
              userId: #{user_id}
              postId: #{post_id}
              text: "Text of Comment"
            ) {
              id
              text
              createdAt
            }
          }
        GQL
      end
    end
  end
end
