require 'test_helper'

class ActsAsPositionTest < Test::Unit::TestCase
  def test_exists
    assert ActiveRecord::Base.respond_to?(:acts_as_position)
  end
end
