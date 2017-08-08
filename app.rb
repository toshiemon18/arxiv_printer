# coding : utf-8

# ==============
# app.rb
# ==============
# arxiv printer

require "./lib/scrape_arXiv"
require "./lib/printer_helper"
require "./lib/proxy_settings"
require "./lib/dropbox_helper"
require "optparse"

module ArXivPrinter
  class CLI
    def options_define(argv=ARGV)
      @opt = OptionParser.new
      @options = {
        use_proxy: false,
        use_ccpd:  false
      }

    def options_define
      @opt.on("--use-proxy", "Use proxy server (default : false)") do |v|
        @options[:use_proxy] = v
      end
      @opt.on("--use-ccpd", "Use Ccpd system (default : false)") do |v|
        @options[:use_ccpd] = v
      end
    end

    def run
      begin
        @opt.parse!(argv)
      rescue OptionParser::InvalidOption => e
        puts e.message
      end
      @options
    end
  end
end
