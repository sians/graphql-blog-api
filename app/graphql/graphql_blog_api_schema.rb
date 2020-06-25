class GraphqlBlogApiSchema < GraphQL::Schema

  # use GraphqlDevise::SchemaPlugin.new(
  #   query:            Types::QueryType,
  #   mutation:         Types::MutationType,
  #   resource_loaders: [
  #     GraphqlDevise::ResourceLoader.new('User', only: [:login])
  #   ]
  # )

  mutation(Types::MutationType)
  query(Types::QueryType)

  # Opt in to the new runtime (default in future graphql-ruby versions)
  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST

  # Add built-in connections for pagination
  use GraphQL::Pagination::Connections
end
