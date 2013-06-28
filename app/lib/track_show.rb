class Message < OpenStruct
  def user_name
    user.name
  end

  def user_image_url
    user.image_url
  end

  def user_nickname
    user.nickname
  end
end

class TrackShow
  attr_reader :track_id,
              :conference_slug

  def initialize(track_id, conference_slug)
    @track_id = track_id
    @conference_slug = conference_slug
  end

  def users
    @users ||= User.where(id: user_ids).inject({}) { |memo, user| memo[user.id] = user; memo }
  end

  def messages
    @messages ||= message_data.map do |message|
      Message.new(body: message['body'], user: users[message['user_id']])
    end
  end

  def track
    @track ||= ConferenceFetcher.get_track(track_id)
  end

private

  def user_ids
    @user_ids ||= message_data.map do |message|
      message['user_id']
    end.uniq
  end

  def message_data
    @message_data ||= MessageFetcher.for_tracks(track_id)
  end

end
