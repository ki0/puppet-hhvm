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
    file_line { "HHVMModuleIni_${name}":
      ensure => present,
      after  => 'hhvm.dynamic_extension_path*',
      line   => "hhvm.dynamic_extensions[${name}] = ${name}.so",
    }
  }
}
