# Class: cronic
# ===========================
#
class cronic (
) {
  file {
    '/usr/local/bin/cronic':
      ensure => present,
      source => 'puppet:///modules/cronic/cronic',
      mode   => '0755';
  }
}
