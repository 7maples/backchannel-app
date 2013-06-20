class ConferenceFetcher

  def self.get(conference_slug)
    conference_request(conference_slug)
  end

  def self.get_track(track_id)
    track_request(track_id)
  end

private

  def self.conference_request(conference_slug)
    return nil if !conference_slug

    response = connection.get(conferences_uri(conference_slug))
    parse_response(response)
  end

  def self.track_request(track_id)
    return nil if !track_id

    response = connection.get(track_uri(track_id))
    parse_response(response)
  end

  def self.connection
    Faraday
  end

  def self.parse_response(response)
    if response.status == 200
      JSON.parse(response.body)
    else
      nil
    end
  end

  def self.conferences_uri(conference_slug)
    "#{base_uri}/conferences/#{conference_slug}"
  end

  def self.track_uri(track_id)
    "#{base_uri}/tracks/#{track_id}"
  end

  def self.base_uri
    'http://localhost:3001'
  end
end
