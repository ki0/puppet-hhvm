class hhvm::iniconcat {
  include hhvm

  concat { $hhvm::config_php_ini_file:
    mode    => $hhvm::config_file_mode,
    owner   => $hhvm::config_file_owner,
    group   => $hhvm::config_file_group,
    require => Package[hhvm]
  }

  concat::fragment { 'hhvm_php_ini_header':
    target  => $hhvm::config_php_ini_file,
    content => template($hhvm::template_ini_header),
    order   => '01',
    notify  => Service[hhvm]
  }

  concat::fragment { 'hhvm_php_ini_footer':
    target  => $hhvm::config_php_ini_file,
    content => template($hhvm::template_ini_footer),
    order   => '90',
    notify  => Service[hhvm]
  }
}


