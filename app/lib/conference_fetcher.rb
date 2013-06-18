class ConferenceFetcher

  def self.get(conference_slug)
    request(conference_slug)
  end

private

  def self.request(conference_slug)
    return nil if !conference_slug

    response = Typhoeus.get(conferences_uri(conference_slug))

    if response.code == 200
      OpenStruct.new(JSON.parse(response.body))
    else
      nil
    end
  end

  def self.conferences_uri(conference_slug)
    "http://localhost:3001/conferences/#{conference_slug}"
  end
end
