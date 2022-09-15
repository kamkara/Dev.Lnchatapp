json.extract! anwser, :id, :content, :question_id, :user_id, :created_at, :updated_at
json.url anwser_url(anwser, format: :json)
json.content anwser.content.to_s
