require 'rails_helper'

module Mutations
  module Posts
    TITLE = "New Title"
    RSpec.describe CreatePostMutation, type: :request do
      describe '.resolve' do
        it 'creates a post' do
          user = create(:user)

          expect do
            post '/graphql', params: { query: query(user_id: user.id) }
          end.to change { Post.count }.by(1)
        end

        it 'returns a post' do
          user = create(:user)

          post '/graphql', params: { query: query(user_id: user.id) }
          json = JSON.parse(response.body)
          data = json['data']['createPost']

          expect(data).to include(
            'id'              => be_present,
            'title'           => "New Title",
            'user'          => { 'id' => user.id.to_s, 'email' => user.email }
          )
        end
      end

      def query(user_id:)
        <<~GQL
          mutation {
            createPost(
              userId: #{user_id}
              title: "New Title"
            ) {
              id
              title
              user {
                id
                email
              }
            }
          }
        GQL
      end
    end
  end
end
