class Schedule < ActiveRecord::Base

  def self.all
    [OpenStruct.new({conference_id: 1, name: "Rocky Mtn Ruby"}),
     OpenStruct.new({conference_id: 2, name: "Rails Conf"}),
     OpenStruct.new({conference_id: 3, name: "GORUCO"})]
  end

end
