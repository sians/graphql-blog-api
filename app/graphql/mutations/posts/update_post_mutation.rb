module Mutations
  class Posts::UpdatePostMutation < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :published, String, required: false
    argument :status, String, required: false
    argument :content, String, required: false

    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    def resolve(id:, title: title, published: published, status: status, content: content)
      post = Post.find(id)

      return {} unless post

      if post.update(
        title: title,
        published: published,
        status: status,
        content: content)
          { post: post }
      else
        { errors: post.errors.full_messages}
      end
    end
  end
end

