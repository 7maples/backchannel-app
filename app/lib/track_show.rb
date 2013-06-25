class TrackShow
  attr_reader :track_id,
              :conference_slug

  def initialize(track_id, conference_slug)
    @track_id = track_id
    @conference_slug = conference_slug
    prime_the_pump
  end

  def users
    @users ||= User.where(id: user_ids).group_by { |user| user.id }
  end

  def messages
    @messages ||= message_fetcher.map do |message|
      message_openstruct(message['body'], users[message['user_id'].to_i].first)
    end
  end

  def track
    @track ||= Backchannel::Scheduler::Gem::ConferenceFetcher.get_track(track_id)
  end

private

  def user_ids
    @user_ids ||= message_fetcher.map { |message| message['user_id'].to_i }.uniq
  end

  def message_openstruct(body, user)
    OpenStruct.new(body: body,
                   user_name: user.name,
                   user_nickname: user.nickname,
                   user_image_url: user.image_url )
  end

  def message_fetcher
    @message_fetcher ||= MessageFetcher.for_tracks(track_id)
  end

  def prime_the_pump
    messages
  end
end
