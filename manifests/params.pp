class puppet::params () {
  case $operatingsystem {
    /(Ubuntu|Debian)/: {
      $puppet_package_name   = 'puppet'
    }
    default: {
      fail("Module ${module_name} is not supported on ${operatingsystem}")
    }
  }

  apt::source { 'puppetlabs':
    location   => 'http://apt.puppetlabs.com',
    repos      => 'main dependencies',
    key        => '4BD6EC30',
    key_server => 'pgp.mit.edu',
    release    => 'wheezy',
  }
}

