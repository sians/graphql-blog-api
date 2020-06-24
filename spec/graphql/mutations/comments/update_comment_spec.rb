require 'rails_helper'

module Mutations
  module Comments
    RSpec.describe UpdateCommentMutation, type: :request do
      describe 'resolve' do
        it 'updates a comment' do
          user = create(:user)
          post = create(:post, title: "Post Title", user: user)
          comment = create(:comment, user: user, post: post)
          updated_text = "Updated text"

          post '/graphql', params: { query: query(id: comment.id) }

          expect(comment.reload).to have_attributes(
            'user_id'        => user.id,
            'text'          => updated_text
          )
        end

        it 'returns a comment' do
          user = create(:user)
          post   = create(:post, title: 'Post Title', user: user)
          comment = create(:comment, user: user, post: post)

          post '/graphql', params: { query: query(id: comment.id) }

          json = JSON.parse(response.body)

          data = json['data']['updateComment']

          expect(data).to include(
            'comment' => {
              'id'           => comment.id.to_s,
              'text'         => "Updated text",
              'createdAt'    => be_present
            }
          )
        end
      end

      def query(id:)
        <<~GQL
          mutation {
            updateComment(
              id: #{id},
              text: "Updated text"
            ) {
              comment {
                id
                createdAt
                text
              }
            }
          }
        GQL
      end
    end
  end
end
