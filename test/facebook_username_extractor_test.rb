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

  def test_maduru
    assert_equal 'xiomara.maduro', FacebookUsernameExtractor.extract('https://www.facebook.com/ItzzCris?ref=ts&fref=ts#!/xiomara.maduro?fref=ts')
  end

  def test_kelly
    assert_equal 'jeffrey.kelly.35574', FacebookUsernameExtractor.extract('https://www.facebook.com/search/results.php?init=quick&q=Clarisca%20Nereida%20Velasquez&tas=0.23712987835773125#!/jeffrey.kelly.35574?fref=ts')
  end

  def test_fb_com
    assert_equal 'MichelleDonelanChippenham', FacebookUsernameExtractor.extract('http://fb.com/MichelleDonelanChippenham')
  end
end
