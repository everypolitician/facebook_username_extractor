require 'facebook_link_cleaner/version'

module FacebookLinkCleaner
  def self.clean(page)
    return if page.to_s.empty?
    page = page.split(/(?=https?:)/).first
    return page[/profile.php\?id=(\w+)/, 1] if page.include? 'profile.php'
    page = page.sub(/^https?:\/\//,'').sub(/^([a-z\-]+\.)?facebook.com/,'').sub(/^\/+/,'').sub(/\?.*/,'').sub(/^#!\//,'')
    return if page.start_with? 'search/'
    return page.sub('pages/','').sub('/','-') if page.start_with? 'pages/'
    return page.split('/')[1] if page.start_with? 'people/'
    return if page.include? 'facebook' # TODO handle more cases
    return page
  end
end
