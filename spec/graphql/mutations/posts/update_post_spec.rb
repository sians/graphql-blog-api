require 'rails_helper'

module Mutations
  module Posts
    RSpec.describe UpdatePostMutation, type: :request do
      describe 'resolve' do
        it 'updates a post' do
          user = create(:user)
          post   = create(:post, title: 'Hero', user: user)

          post '/graphql', params: { query: query(id: post.id) }

          expect(post.reload).to have_attributes(
            'user_id'        => user.id,
            'title'          => 'Update to Tripwire'
          )
        end

        it 'returns a post' do
          user = create(:user)
          post   = create(:post, title: 'Hero', user: user)

          post '/graphql', params: { query: query(id: post.id) }

          json = JSON.parse(response.body)
          data = json['data']['updatePost']

          puts data

          expect(data).to include(
            'post' => {
              'id'           => post.id.to_s,
              'title'        => 'Update to Tripwire',
              'user'         => { 'id' => user.id.to_s }
            }
          )
        end
      end

      def query(id:)
        <<~GQL
          mutation {
            updatePost(
              id: #{id}
              title: "Update to Tripwire"
            ) {
              post {
                id
                title
                user {
                  id
                }
              }
            }
          }
        GQL
      end
    end
  end
end
