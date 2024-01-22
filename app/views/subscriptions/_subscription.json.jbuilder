json.extract! subscription, :id, :subscribed_id, :subscriber_id, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
