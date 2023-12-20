json.extract! event, :id, :name, :description, :color, :duration, :customer_paid, :payment_required, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)
json.description event.description.to_s
