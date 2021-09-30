json.extract! post, :id, :title, :material, :amount, :procedure, :cooking_image, :procedure_image, :tag, :text, :free_text, :created_at, :updated_at
json.url post_url(post, format: :json)
