class Types::MutationType < Types::BaseObject

  # field :create_author, AuthorType, null: true, description: "Create an author" do
  #   # argument :author, Types::AuthorInputType, required: true
  # end

  # TODO AuthorInputTypeを使った実装にするとここでエラーがおきる　原因未調査
  # def create_author(first_name:, last_name:, yob:, is_alive:)
  #   Author.create(first_name: first_name, last_name: last_name, yob: yob, is_alive: is_alive)
  # end

  # TODO AuthorInputTypeを使った実装でエラーが出るので、一旦GraphQL::Schema::Mutationの実装に戻す
  field :create_author, Types::AuthorType, mutation: Mutations::CreateAuthor

  field :update_author, Boolean, null: false, description: "Update an author" do
    argument :author, Types::AuthorInputType, required: true
  end

  def update_author(author:)
    existing = Author.where(id: author[:id]).first
    existing&.update author.to_h
  end

  field :delete_author, Boolean, null: false, description: "Delete an author" do
    argument :id, ID, required: true
  end

  def delete_author(id:)
    Author.where(id: id).destroy_all
    true
  end

end
