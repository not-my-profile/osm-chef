name "rhaegal"
description "Master role applied to rhaegal"

default_attributes(
  :location => "Zagreb, Croatia",
  :networking => {
    :interfaces => {
      :external_ipv4 => {
        :interface => "enp1s0f0",
        :role => :external,
        :family => :inet,
        :address => "10.5.0.77",
        :prefix => "16",
        :gateway => "10.5.0.1"
      }
    },
    :nameservers => [
      "10.5.0.7",
      "8.8.8.8"
    ]
  }
)

run_list(
  "role[carnet]"
)
