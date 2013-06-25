class MessageFetcher
  def self.for_tracks(track_id)
    get_request(track_id)
  end

  def self.create_message(data)
    post_request(data)
  end

private

  def self.get_request(track_id)
    response = Faraday.get(track_messages_uri(track_id))

    if response.status == 200
      JSON.parse(response.body)
    else
      nil
    end
  end

  def self.post_request(data)
    response = Faraday.post(create_message_uri(data))

    if response.status == 201
      JSON.parse(response.body)
    else
      nil
    end
  end

  def self.track_messages_uri(track_id)
    "http://localhost:3002/api/messages/#{track_id}"
  end

  def self.create_message_uri(data)
    "http://localhost:3002/api/messages?message[user_id]=#{data[:user_id]}&message[track_id]=#{data[:track_id]}&message[body]=#{data[:body]}"
  end
end
