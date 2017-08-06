# coding : utf-8

# ==============
# Dropbox Helper
# ==============
# helper module for dropbox block

require "dropbox_api"
require "open-uri"

module ArXivPrinter
  class DropboxHelper
    def initialize
      key = ENV["DROPBOX_KEY"]
      secret_key= ENV["DROPBOX_SECRET_KEY"]
      @client = DropboxApi
    end
  end
end
