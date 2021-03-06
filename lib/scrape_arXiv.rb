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

    def initialize(url, **args)
      @url = url
      @html = nil
      fetch_html(args)
    end

    # fetch target paper title
    # === Args
    #   None
    # === Return
    #   title(String) : paper title
    def fetch_paper_titile
      title = @html.xpath("//*[@id=\"abs\"]/div[2]/h1/text()").text.strip!
    end

    def download
      paper_url = fetch_pdf_link
      paper = open(paper_url)
    end

    private
    # fetch pdf link for target paper
    # === Args
    #   None
    # === Return
    #   url(String) : pdf link
    def pdf_link
      url.gsub!("abs", "pdf")
    end

    # fetch html of arXiv page
    # === Args
    #   args : optional variable
    # === Return
    #   None
    def fetch_html(**args)
      html = Nokogiri::HTML(open(@url, args))
      @html = html
    end
  end
end
