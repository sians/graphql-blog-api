module Mutations
  module Comments
    class CreateCommentMutation < ::Mutations::BaseMutation
      argument :post_id, Integer, required: true
      argument :user_id, Integer, required: true
      argument :text, String, required: true

      field :comment, Types::CommentType, null: true
      field :errors, [String], null: false

      type Types::CommentType

      def resolve(**attributes)
        # if context[:current_user].nil?
        #   raise GraphQL::ExcecutionError,
        #       "You need to authenticate to perform this action"
        # end

        comment = Comment.create!(attributes)
      end
    end
  end
end
