# coding : utf-8

# ==============
# Printer Helper
# ==============
# helper module for using printer system

$:.unshift(File.join(File.dirname(__FILE__), "lib"))

require "open-uri"
require "open3"

module ArXivPrinter
  class PrinterHelper
    def initialize
      @ccpd = "/etc/init.d/ccpd"
      @ccpd = false
      init_ccpd
    end

    # Initializing ccpd service
    # === Args
    #   None
    # === Return
    #   None
    def init_ccpd
      stdout, _, status = ccpd_status
      if !status
        stdout, _, status = ccpd_start
        if status
          puts stdout
        end
        @ccpd_status
      else
        puts stdout
      end
    end

    private
    # Start ccpd service process
    # === Args
    #   None
    # === Returns
    #   stdout(String) : Standaed output strings
    #   stderr(String) : Error message on standard output strings
    #   status(Process::Status) : Process status obejct of child process
    def ccpd_start
      stdout, stderr, status = sudo("#{@ccpd} start")
    end

    # Check ccpd service process
    # === Args
    #   None
    # === Returns
    #   stdout(String) : Standaed output strings
    #   stderr(String) : Error message on standard output strings
    #   status(Process::Status) : Process status obejct of child process
    def ccpd_status
      stdout, stderr, status = sudo("#{@ccpd} status")
    end

    # Execute sudo command with arguments and -A option
    # === Args
    #   *args(Array) : variable length arguments
    # === Returns
    #   stdout(String) : Standaed output strings
    #   stderr(String) : Error message on standard output strings
    #   status(Process::Status) : Process status obejct of child process
    def sudo(*args)
      args.unshift("-A") unless ENV["SUDO_ASKPASS"].nil?
      # fetch results of sudo command
      # results = `/usr/bin/sudo #{args.join(" ")}`.split("\n")
      stdout, stderr, status = Open3.capture3("sudo", args.join(" "))
      return stdout, stderr, status
    end
  end
end
