module Mutations
  class Comments::UpdateCommentMutation < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :text, String, required: true

    field :comment, Types::CommentType, null: true
    field :errors, [String], null: false

    def resolve(id:, text: text)
      comment = Comment.find(id)

      return {} unless comment

      if comment.update(text: text)
          { comment: comment }
      else
        { errors: comment.errors.full_messages}
      end
    end
  end
end

