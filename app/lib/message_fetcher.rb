class MessageFetcher
  def self.for_tracks(track_id)
    response = Faraday.get(track_messages_uri(track_id))

    if response.status == 200
      JSON.parse(response.body)
    else
      nil
    end
  end

private

  def self.track_messages_uri(track_id)
    "http://localhost:3002/api/messages/#{track_id}"
  end
end
