# change network environment if ssid is "foo"
function foo_post_export() {
  # The name of network environment
  local env_name="FOO"

  scselect "${env_name}"

  if is_ip_assigned; then
    :
  fi
}

# echo export properties if ssid is foo
function export_foo() {
  local proxy_addr="http://foo.com"
  echo "export http_proxy=${proxy_addr}"
  echo "export https_proxy=${proxy_addr}"
  echo "export ALL_PROXY=${proxy_addr}"
}

# process things which you would like to do after calling export_foo
function foo_post_export() {
  :
}