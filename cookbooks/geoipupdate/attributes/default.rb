default[:geoipupdate][:account] = "149244"
default[:geoipupdate][:editions] = %w[GeoLite2-ASN GeoLite2-City GeoLite2-Country]
default[:geoipupdate][:directory] = "/usr/share/GeoIP"

default[:apt][:sources] |= ["maxmind"]
