# coding : utf-8

# ==============
# Proxy Settings
# ==============
# Initialize array constant for TNCT proxy system

module ArXivPrinter
  # This constant is the proxy parameters in TNCT proxy system
  PROXY = [
            ENV["PROXY_URL"],
            ENV["PROXY_USER"],
            ENV["PROXY_PASSWD"]
          ]
 end
