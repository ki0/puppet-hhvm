define hhvm::ini (
  $content,
  $ensure = 'present',
  $order  = '50',
){

  include hhvm::iniconcat

  concat::fragment { "ini_fragment_${name}":
    ensure  => $ensure,
    target  => $hhvm::config_php_ini_file,
    content => $content,
    order   => $order,
    notify  => Service[hhvm]
  }
}
