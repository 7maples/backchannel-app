class ConferenceFetcher

  def self.get(conference_slug)
    request(conference_slug)
  end

private

  def self.request(conference_slug)
    return nil if !conference_slug

    response = Typhoeus.get(conferences_uri, body: { conference: conference_slug })

    if response.code == 200
      OpenStruct.new(JSON.parse(response.body))
    else
      nil
    end
  end

  def self.conferences_uri
    'http://backchannel-conferences.herokuapp.com/conferences'
  end
end
