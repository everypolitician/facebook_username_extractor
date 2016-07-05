require 'facebook_username_extractor/version'

module FacebookUsernameExtractor
  def self.extract(page)
    return if page.to_s.empty?
    page = page.split(/(?=https?:)/).first
    # Anything after #!
    unless (matched = page.match /\#\!\/([^\?]+)/).nil?
      return matched.captures.last
    end
    return page[/profile.php\?id=(\w+)/, 1] if page.include? 'profile.php'
    page = page
           .sub(%r{^https?://}, '')
           .sub(/^([a-z\-]+\.)?facebook.com/, '')
           .sub(%r{^/+}, '')
           .sub(/\?.*/, '')
           .sub(%r{^#!/}, '')
           .sub(%r{/$}, '')
    return if page.start_with? 'search/'
    return page.sub('pages/', '').sub('/', '-') if page.start_with? 'pages/'
    return page.split('/')[1] if page.start_with? 'people/'
    return if page.include? 'facebook' # TODO: handle more cases
    page
  end
end
