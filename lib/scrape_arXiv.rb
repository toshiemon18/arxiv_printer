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

    # fetch target paper title
    # === Args
    #   None
    # === Return
    #   title(String) : paper title
    def fetch_paper_titile
      title = @html.xpath("//*[@id=\"abs\"]/div[2]/h1/text()").text.strip!
    end

    # fetch pdf link for target paper
    # === Args
    #   None
    # === Return
    #   url(String) : pdf link
    def fetch_pdf_link
      url.gsub!("abs", "pdf")
    end

    private
    # fetch html of arXiv page
    # === Args
    #   None
    # === Return
    #   None
    def fetch_html
      html = Nokogiri::HTML(open(@url, {proxy_http_basic_authentication: PROXY}))
      @html = html
    end
  end
end
