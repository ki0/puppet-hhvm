# Class: hhvm::prerequisites
#
# This class installs hhvm prerequisites
#
# == Variables
#
# Refer to hhvm class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by hhvm if the parameter
# use_hhvm_repo is set to true
# Note: This class may contain resources available on the
# Example42 modules set
#
class hhvm::prerequisites {

  if $hhvm::bool_use_hhvm_repo {
    case $::operatingsystem {
      redhat,centos,scientific,oraclelinux : {
      }
      ubuntu,debian : {
        require apt::repo::hhvm
      }
      default: { }
    }
  }
}
