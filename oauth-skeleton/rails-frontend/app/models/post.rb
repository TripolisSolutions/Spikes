class Post < BackendModel
  schema do
    string :title, :body
    boolean :published
  end
end
