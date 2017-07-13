# coding : utf-8

# =============
# Scrape arXiv
# =============
# scrape arxiv.com and download paper file with PDF

$:.unshift(File.join(File.dirname(__FILE__), "lib"))

require "open-uri"
require "nokogiri"
require "./lib/proxy_settings"

module ArXivPrinter
  class ScrapeArXiv
    attr_accessor :url

    def initialize(url)
      @url = url
      @html = nil
      fetch_html
    end

    def fetch_paper_titile
      title = @html.xpath("//*[@id=\"abs\"]/div[2]/h1/text()").text.strip!
    end

    def fetch_pdf_link
      base_url = "https://arxiv.org"
      href = @html.xpath("//*[@id=\"abs\"]/div[1]/div[1]/ul/li[1]/a").attribute("href").value
      return "#{base_url}#{href}"
    end

    private
    def fetch_html
      html = Nokogiri::HTML(open(@url, {proxy_http_basic_authentication: PROXY}))
      @html = html
    end
  end
end
