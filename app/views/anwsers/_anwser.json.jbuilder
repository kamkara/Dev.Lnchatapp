json.extract! anwser, :id, :content, :user_id, :question_id, :created_at, :updated_at
json.url anwser_url(anwser, format: :json)
json.content anwser.content.to_s
