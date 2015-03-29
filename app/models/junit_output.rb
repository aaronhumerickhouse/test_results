require 'nokogiri'

class JunitOutput < ActiveRecord::Base
  has_one :test_suite

  validates_presence_of :output

  def convert
    xml = Nokogiri::XML(self.output)
    puts "\n\n\n#{xml}\n\n\n"
  end
end
