# frozen_string_literal: true

module BridgetownObsidian
  class Builder < Bridgetown::Builder
    REGEX_WIKILINK = /(?<!\!)\[\[([^\]]+?)(?:\|([^\]]+))?\]\]/.freeze
    REGEX_IMAGES = /!\[\[(.+?)\]\]/.freeze

    def build
      generator :wikilinks  
      generator :images
    end

    def wikilinks
      resources.each do |post|              
        post.content.gsub!(REGEX_WIKILINK) do |match|                            
          wikilink = Regexp.last_match(1)
          wikilink_title = Regexp.last_match(2) || wikilink          

          "[#{wikilink_title}](#{url_for("_posts/#{wikilink}.md")})"
        end
      end
    end

    def images
      resources.each do |post|
        post.content.gsub!(REGEX_IMAGES) do |match|
          image = Regexp.last_match(1)
          "![](/#{image})"
        end
      end
    end

    private
    
    def resources
      site.collections.posts.resources
    end

    def url_for(url)
      Bridgetown::RubyTemplateView::Helpers.new(resource, site).url_for(url)
    end
    
  end
end