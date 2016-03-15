require 'test_helper'

class FacebookLinkCleanerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::FacebookLinkCleaner::VERSION
  end

  def test_it
    assert_equal 'bob', FacebookLinkCleaner.clean('http://facebook.com/bob')
  end
end
