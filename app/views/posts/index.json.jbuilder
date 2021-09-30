json.array! @posts, partial: "posts/post", as: :post
json.array! @posts, :material, :description
json.array! @posts, :amount, :description
