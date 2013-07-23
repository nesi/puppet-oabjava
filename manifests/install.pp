# Class: oabjava::install
#
# This module installs the oab-java.sh script from the GitHub repository and
# creates a link to it in the super-user's path
#
# Parameters:
#
# Actions:
#
# Requires:
#       git - Requires the nesi/git Puppet module
#
# Sample Usage:
# This module MUST NOT be used directly, instead use:
#
#   include oabjava
#
# This file is part of the oabjava Puppet module.
# [Remember: No empty lines between comments and class definition]
class oabjava::install(
    $update
)
{
    include oabjava::params

    package{'libsane': ensure => installed}
    package{['ia32-libs','ia32-libs-multiarch']:
        ensure  => installed,
        require => Package['libsane'],
    }

    git::repo{'oab-java':
        path    => $oabjava::params::install_dir,
        source  => $oabjava::params::git_source,
        update  => $update,
    }

    vcsrepo{$oabjava::params::install_dir:
        ensure      => present,
        provider    => git,
        source      => $oabjava::params::git_source,
    }

    file{$oabjava::params::exec_bin:
        ensure  => link,
        target  => $oabjava::params::install_bin,
        mode    => '0744',
        require => Vcsrepo[$oabjava::params::install_dir],
    }
}