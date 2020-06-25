module Types
  class MutationType < Types::BaseObject

    field :create_post, mutation: Mutations::Posts::CreatePostMutation
    field :update_post, mutation: Mutations::Posts::UpdatePostMutation

    field :create_comment, mutation: Mutations::Comments::CreateCommentMutation
    field :update_comment, mutation: Mutations::Comments::UpdateCommentMutation
  end
end
