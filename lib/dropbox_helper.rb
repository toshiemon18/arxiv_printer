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
      token = ENV["DROPBOX_TOKEN"]
      @client = DropboxApi::Client.new(token)
    end

    # Upload paper to specific folder on Dropbox
    # === Args
    #   file(File) : file object
    #   file_name(String) : file name
    # === Returns
    #   None
    def paper_backup(file, file_name)
      @client.upload("/#{file_name}", file)
    end
  end
end
