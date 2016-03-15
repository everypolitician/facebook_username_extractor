require 'test_helper'

class FacebookUsernameExtractorTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::FacebookUsernameExtractor::VERSION
  end

  def test_doesnt_touch_plain_username
    assert_equal 'TaylorSwift', FacebookUsernameExtractor.extract('TaylorSwift')
  end

  def test_http_url
    assert_equal 'TaylorSwift', FacebookUsernameExtractor.extract('http://www.facebook.com/TaylorSwift')
  end

  def test_https_url
    assert_equal 'TaylorSwift', FacebookUsernameExtractor.extract('https://www.facebook.com/TaylorSwift')
  end

  def test_trailing_slash
    assert_equal 'TaylorSwift', FacebookUsernameExtractor.extract('https://www.facebook.com/TaylorSwift/')
  end

  def test_language_code_subdomain
    assert_equal 'TaylorSwift', FacebookUsernameExtractor.extract('http://en-gb.facebook.com/TaylorSwift')
  end

  def test_page_id
    assert_equal 'TaylorSwift-123456', FacebookUsernameExtractor.extract('http://www.facebook.com/pages/TaylorSwift/123456')
  end
end
