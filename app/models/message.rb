class Message < ActiveRecord::Base
  belongs_to :test_case
  validates_presence_of :type
end
