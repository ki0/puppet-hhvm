define hhvm::module (
  $version       = 'present',
  $module_prefix = '',
  $absent        = '',
){
  include hhvm

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
      ensure  => $hhvm::manage_file,
      target  => $hhvm::config_file,
      content => template($hhvm::template_extensions),
      order   => 90,
      notify  => Service[hhvm]
    }
  }
}
