json.extract! event, :id, :type, :instrument, :level, :price, :start_date, :duration, :description, :location, :available_seats, :created_at, :updated_at
json.url event_url(event, format: :json)
