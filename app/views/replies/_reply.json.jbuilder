json.extract! reply, :id, :discussion_id, :user_id, :marked_as_answer, :created_at, :updated_at
json.url reply_url(reply, format: :json)
