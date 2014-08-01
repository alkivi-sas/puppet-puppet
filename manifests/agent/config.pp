class puppet::agent::config (
  $parser       = $puppet::agent::parser,
  $pluginsync   = $puppet::agent::pluginsync,
  $environment  = $puppet::agent::environment,
  $local_server = $puppet::agent::local_server,
  $certname     = $puppet::agent::certname,
  $server       = $puppet::agent::server,

) {
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
