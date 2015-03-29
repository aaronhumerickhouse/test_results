class TestCase < ActiveRecord::Base
  belongs_to :test_suite
  has_one :message

  enum status: [:failure, :error, :pass]
  validates_inclusion_of :test_suite_id, :name, :classname, :time, :status
end
