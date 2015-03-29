class Property < ActiveRecord::Base
  belongs_to :test_suite

  validates_presence_of :test_suite_id, :name, :value
end
