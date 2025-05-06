json.extract! discussion, :id, :title, :user_id, :pinned, :closed, :created_at, :updated_at
json.url discussion_url(discussion, format: :json)
