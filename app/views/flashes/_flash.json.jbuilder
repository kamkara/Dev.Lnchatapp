json.extract! flash, :id, :title, :content, :slug, :user_id, :course_id, :created_at, :updated_at
json.url flash_url(flash, format: :json)
json.content flash.content.to_s
