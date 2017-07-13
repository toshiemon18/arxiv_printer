# coding : utf-8

# ==============
# Printer Helper
# ==============
# helper module for using printer system

$:.unshift(File.join(File.dirname(__FILE__), "lib"))

require "open-uri"

module ArXivPrinter
  class PrinterHelper
    def initialize

    end


    def ccpd_status
      sudo("/etc/init.d/ccpd status")
    end

    def sudo(*args)
      args.unshift("-A") unless ENV["SUDO_ASKPASS"].nil?
      systemu("/usr/bin/sudo", *args)
      results = `/usr/bin/sudo #{args.join(" ")}`
    end
  end
end
