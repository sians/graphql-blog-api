module Types
  class QueryType < Types::BaseObject

    field :users, [Types::UserType], null: false,
      description: "A list of all users"
    def users
      User.all
    end

    field :posts, [Types::PostType], null: false,
      description: "Return all posts in database"
    def posts
      Post.all.with_rich_text_content
    end

    field :users_posts,
      [Types::PostType],
      description: "Returns all posts by a user from user_id",
      null: false do
        argument :user_id, ID, required: true
      end
    def users_posts
      Post.includes(user).where(user_id: user_id)
    end

    field :post,
      Types::PostType,
      description: "Return a post by ID",
      null: false do
        argument :id, ID, required: true
      end
    def post(id:)
      Post.find(id)
    end

    field :comments, [Types::CommentType], null: false
    def comments
      Comment.all
    end


  end
end
