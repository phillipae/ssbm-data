Rails.application.routes.draw do
  # if Rails.env.development?
  #   mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  # end
  post "/query", to: "application#query"
end
