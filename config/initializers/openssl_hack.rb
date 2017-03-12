require 'openssl'

# This might only be necessary for dev/test env
puts "FIXME -- this is a hack to get past SSL errors"
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
