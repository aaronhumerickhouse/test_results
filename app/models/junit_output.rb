class JunitOutput < ActiveRecord::Base
  has_one :test_suite

  validates_presence_of :output
end
