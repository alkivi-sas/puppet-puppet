class puppet::agent::install () {
  package { $puppet::agent::params::puppet_package_name:
    ensure => installed,
  }
}
