json.extract! user_echange, :id, :title, :content, :wiki, :status, :slug, :course_id, :user_id, :created_at, :updated_at
json.url user_echange_url(user_echange, format: :json)
json.content user_echange.content.to_s
json.wiki user_echange.wiki.to_s
