json.array!(@posts) do |post|
  json.id post.id
  json.picture post.data["picture"]
  json.message post.data["message"]
end
