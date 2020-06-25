module Mutations
  module Posts
    class CreatePostMutation < ::Mutations::BaseMutation
      argument :title, String, required: false
      argument :published, String, required: false
      argument :status, String, required: false
      argument :content, String, required: false

      field :post, Types::PostType, null: true
      field :errors, [String], null: false

      type Types::PostType

      def resolve(**attributes)
        user = context[:current_user]
        new_attributes = attributes.merge(user: user)

        post = Post.create!(new_attributes)
      end
    end
  end
end
