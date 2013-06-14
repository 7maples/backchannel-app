class Question < ActiveRecord::Base

  def self.all
    [OpenStruct.new({user_id: 1, track_id: 4, body: "How are you?"}),
     OpenStruct.new({user_id: 1, track_id: 4, body: "What is your favourite colour?"}),
     OpenStruct.new({user_id: 1, track_id: 4, body: "What's your name?"})]
  end

end
