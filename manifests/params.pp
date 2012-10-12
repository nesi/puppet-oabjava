# Class: oabjava::params
#
# This module stores the common parameters for the classes in the oabjava Modules
# and the conditions unde which these parameters change 
#
# Parameters:
#
# Actions:
#
# Requires:
#		git				- Requires the nesi/git Puppet module
#
# Sample Usage:
# 		This module MUST NOT be used directly, instead use:
#
#		include oabjava
#
# This file is part of the oabjava Puppet module.
# [Remember: No empty lines between comments and class definition]
class oabjava::params{

	$install_dir	= '/opt'
	$bin_dir		= '/usr/sbin'
	$binary			= 'oab-java.sh'
	$install_bin	= "${install_dir}/${binary}"
	$exec_bin		= "${bin_dir}/${binary}"
	$git_source		= "git://github.com/flexiondotorg/oab-java6.git"

}