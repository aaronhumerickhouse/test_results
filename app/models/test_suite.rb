class TestSuite < ActiveRecord::Base
  belongs_to :junit_output
  has_many :properties
  has_many :test_cases

  validates_presence_of :junit_output_id, :name, :timstamp, :hostname, :time
end
