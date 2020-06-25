module Mutations
  module Posts
    class CreatePostMutation < ::Mutations::BaseMutation
      argument :title, String, required: false
      argument :published, String, required: false
      argument :status, String, required: false
      argument :content, String, required: false
      argument :user_id, Integer, required: true

      field :post, Types::PostType, null: true
      field :errors, [String], null: false

      type Types::PostType

      def resolve(**attributes)
        # json = GraphqlBlogApiSchema.execute(params[:query], context: graphql_context(:user))

        if context[:current_user].nil?
          raise GraphQL::ExcecutionError,
              "You need to authenticate to perform this action"
        end

        post = Post.create!(attributes)
      end
    end
  end
end
