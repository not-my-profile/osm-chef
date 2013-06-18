name "shenron"
description "Master role applied to shenron"

default_attributes(
  :apache => {
    :mpm => "event",
    :event => {
      :max_requests_per_child => 2000
    }
  },
  :networking => {
    :interfaces => {
      :external_ipv4 => {
        :interface => "eth0",
        :role => :external,
        :family => :inet,
        :address => "89.16.179.150",
        :prefix => "26",
        :gateway => "89.16.179.129"
      },
      :external_ipv6 => {
        :interface => "eth0",
        :role => :external,
        :family => :inet6,
        :address => "2001:41c8:0010:0996:21d:7dff:fec3:df70",
        :prefix => "64",
        :gateway => "fe80::1"
      },
    }
  },
  :openvpn => {
    :address => "10.0.16.3",
    :tunnels => {
      :shenron2ucl => {
        :port => "1194",
        :mode => "server",
        :peer => {
          :host => "ridley.openstreetmap.org"
        }
      }
    }
  }
)

run_list(
  "role[bytemark]",
  "role[mail]",
  "role[lists]",
  "role[git]",
  "role[subversion]",
  "role[trac]",
  "role[osqa]",
  "role[irc]",
  "role[dns]",
  "role[geodns]",
  "role[chef-repository]",
  "recipe[openvpn]"
)
