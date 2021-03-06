define hhvm::module (
  $version       = 'present',
  $module_prefix = '',
  $absent        = '',
){
  include iniconcat

  if $absent {
    $real_version = 'absent'
  } else {
    $real_version = $version
  }

  $real_module_prefix = $module_prefix ? {
    ''      => 'hhvm-',
    default => $module_prefix
  }

  $real_install_package = "${real_module_prefix}${name}"

  if defined(Package[$real_install_package]) == false {
    package { "HHVMModule_${name}":
      ensure  => $real_version,
      name    => $real_install_package,
      require => Package[hhvm]
    }
    concat::fragment { "HHVMModuleIni_${name}":
      ensure  => $real_version,
      target  => $hhvm::config_php_ini_file,
      content => template($hhvm::template_extensions),
      order   => '80',
      notify  => Service[hhvm]
    }
  }
}
