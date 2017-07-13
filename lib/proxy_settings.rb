 module ArXivPrinter
  # This constant is the proxy parameters in TNCT proxy system
  PROXY = [
            ENV["PROXY_URL"],
            ENV["PROXY_USER"],
            ENV["PROXY_PASSWD"]
          ]
 end
