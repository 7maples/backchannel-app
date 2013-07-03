class Message < OpenStruct
  def user_name
    user.name
  end

  def user_image_url
    user && user.image_url
  end

  def user_nickname
    user && user.nickname
  end
end

class QuestionData < OpenStruct
  def user_name
    user.name
  end

  def user_image_url
    user && user.image_url
  end

  def user_nickname
    user && user.nickname
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

  def questions
    @questions ||= question_data.inject({}) do |memo, question|
      memo[question["id"]] = QuestionData.new(body: question['body'], id: question["id"], user: users[question['user_id']], vote_count: question["vote_count"])
      memo
    end
  end

  def track
    @track ||= ConferenceFetcher.get_track(track_id)
  end

private

  def user_ids
    @user_ids ||= (message_data + question_data).map do |post|
      post['user_id']
    end.uniq
  end

  def message_data
    @message_data ||= MessageFetcher.for_tracks(track_id)
  end

  def question_data
    @question_data ||= QuestionFetcher.for_tracks(track_id)
  end

end
