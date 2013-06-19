class ConferenceFetcher

  def self.get(conference_slug)
    request(conference_slug)
  end

private

  def self.request(conference_slug)
    return nil if !conference_slug

    response = Faraday.get(conferences_uri(conference_slug))

    if response.status == 200
      JSON.parse(response.body)
    else
      nil
    end
  end

  def self.conferences_uri(conference_slug)
    "http://localhost:3001/conferences/#{conference_slug}"
  end
end
