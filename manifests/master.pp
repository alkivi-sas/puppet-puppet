class puppet::master(
  $allowed_customers,
) {

  File {
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  #package { 'puppetmaster-passenger':
  #  ensure  => installed, 
  #}

  file { '/etc/iptables.d/50-puppet.rules':
    source  => 'puppet:///modules/puppet/puppet.rules',
    notify  => Service["alkivi-iptables"],
  }

  sudo::conf { 'puppet-genpwd':
    priority => 30,
    content  => "puppet ALL=(ALL) NOPASSWD: /root/alkivi-scripts/genpwd\n", 
  }

  # handle conf
  file { '/etc/puppet/auth.conf':
    content => template('puppet/auth.conf.erb'),
  }

}
