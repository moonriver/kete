module SiteLinking
  unless included_modules.include? SiteLinking
    def set_kete_net_urls
      @kete_net = "http://kete.net.nz/site"
      @kete_sites = "#{@kete_net}/kete_sites"
      @new_kete_site = "#{@kete_sites}/new"
    end

    def check_nessesary_constants_set
      raise "Pretty Site Name and Site URL constants are not set, are you sure you restarted your server after you configured your Kete site?" if SITE_URL.blank? || PRETTY_SITE_NAME.blank?
    end

    def site_listing
      check_nessesary_constants_set
      set_kete_net_urls
      @site_listing = nil
      SiteLinkingResource.find(:all, :params => { :url => SITE_URL }).each do |link|
        link = link.attributes
        if link['url'].chomp('/') == SITE_URL.chomp('/') # take off the / on the end so it won't fail in some cases
          @site_listing = link
          break
        end
      end
      if @site_listing.nil?
        @site_listing = ''
      else
        @site_listing = "#{@kete_sites}/#{@site_listing['id']}"
      end
    end

    def error_linking_site
      set_kete_net_urls
      top_message = "There was an error linking to your site. "
      site_listing
      if @site_listing.blank?
        top_message += "You can do it manually at <a href='#{@new_kete_site}'>#{@new_kete_site}</a>."
      else
        top_message += "However, it appears that your site is now listed. Please check the listing to make sure it is correct at <a href='#{@site_listing}'>#{@site_listing}</a>."
      end
      render :update do |page|
        page.hide('spinner')
        page.replace_html("top_message", top_message)
      end
    end
  end
end

class SiteLinkingResource < ActiveResource::Base
  self.site = "http://kete.net.nz/site/"
  self.element_name = "kete_site"
  self.timeout = 60
end
