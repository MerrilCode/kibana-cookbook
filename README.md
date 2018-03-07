# Kibana cookbook

## Description
- This repository is a chef cookbook for configuring kibana as part of the ELK stack. 
- The VM OS is ubuntu 16.04

### Pre-requisites
To begin, download the following programs and install them:

[Virtual Box](https://www.virtualbox.org/wiki/Downloads)(5.2.6)

[Vagrant](https://www.vagrantup.com/downloads.html)

[ChefDK](https://downloads.chef.io/chefdk)(2.4.17)

Virtual Box is used to provide the vitual machine environment and vagrant will be used to get the functionality without the clutter.

### Testing
To test the cookbook in a test environment you can use the Kitchen environment provided by Chef. First clone the repository to obtain the necessary files. This can be done through the CLI by:

	git clone git@github.com:MerrilCode/kibana-cookbook.git
	cd kibana-cookbook

Then enter

	kitchen create

After the VM has been created enter
	
	kitchen converge

to provision the virtual machine machine.

When you want to remove the VM:

	kitchen destroy


Then in your browser visit `http://192.168.33.33:5601` to check that the Kibana UI is working.

The IP of the VM can be changed in the `.kitchen.yml` file.