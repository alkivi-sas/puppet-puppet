class puppet::agent::config () {
  File {
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file { '/etc/puppet/puppet.conf':
    content => template('puppet/puppet.conf.erb'),
  }

}
