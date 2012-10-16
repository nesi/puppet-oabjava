# oabjava

The oabjava puppet module uses the oab-java script to create a local apt repository for Oracle Java 6 and Oracle Java 7 that complies with Oracles licensing.

Oracle Java 6 is the latest distribution of Sun Java 6.

*NOTE:* This module MUST only be used if the Oracle license is agreed to: http://www.oracle.com/technetwork/java/javase/terms/license/

# Dependencies

This Puppet module is dependent on the NeSI Git puppet module:

* https://github.com/nesi/puppet-git

# To install into puppet

Clone into your puppet configuration in your `puppet/modules` directory:

 git clone git://github.com/nesi/puppet-oabjava.git oabjava

Or if you're managing your Puppet configuration with git, in your `puppet` directory:

		git submodule add git://github.com/nesi/puppet-oabjava.git modules/oabjava --init --recursive
		cd modules/oabjava
		git checkout master
		git pull
		cd ../..
		git commit -m "added oabjava submodule from https://github.com/nesi/puppet-oabjava"

It might seem bit excessive, but it will make sure the submodule isn't headless...

# Usage

An example of minimal usage of this module:

```
include git
include javaoab

package{'sun-java6-jre':
	ensure 	=> installed,
	require => Class['oabjava'],
}
```

**NOTE:** the oabjava class does not install Java, it just creates the local debian packages.

# Parameters

* **java7** If set to true, oabjava will install Oracle Java 7, Oracle Java 6 installed by default
* **clean_old_pkgs** If set to true, oabjava cleans any existing Java packages from the apt cache. The default is 'false'.
* **skip_if_built** Skips building the deb packages if they already exist, the default is 'true'
* **gpg_key** Sets a specific GPG key for the local repository, if not set, a random GPG key will be generated and used.
* **update** If true puppet will check to see that the oab-java.sh script has been updated every time it runs, the default is 'false'

# Attribution

## Open Source Puppet

This module has been developed for the use with Open Source Puppet (Apache 2.0 license) for automating server & service deployment.

* http://puppetlabs.com/puppet/puppet-open-source/

## oab-java

This module installs and uses the features provided by the `oab-java` script developed by Martin Wimpress (http://flexion.org) under the MIT License.

* https://github.com/flexiondotorg/oab-java6

# Licencing

This module is openly licensed and can be freely copied and modified with attribution, but as it is used to install software covered by a restrictive and propriatary commercial license, this module CAN NOT be used unless the Oracle license has been read and agreed with.

* http://www.oracle.com/technetwork/java/javase/terms/license/