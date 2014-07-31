class puppet::agent (
  $certname,
  $environment = 'production',
  $server      = 'puppet.alkivi.fr',
  $parser      = 'future',
  $pluginsync  = 'true',
) {

  # declare all parameterized classes
  class { 'puppet::agent::params': }
  class { 'puppet::agent::install': }
  class { 'puppet::agent::config': }
  class { 'puppet::agent::service': }

  # declare relationships
  Class['puppet::agent::params'] ->
  Class['puppet::agent::install'] ->
  Class['puppet::agent::config'] ->
  Class['puppet::agent::service']
}

