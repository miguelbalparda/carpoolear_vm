
# Carpoolear dev environment
Vagrant based development environment for carpoolear.com.ar

To start the vm, run `vagrant up`
Once provisioned, login to the vm using `vagrant ssh` and run `sh install.sh` from /var/www/ 
When the installation finishes the entire app (frontend & backend) will be available at http://carpoolear22.test and http://carpoolear22.test/app

Vagrant plugins needed: - hostmanager (`vagrant plugin install vagrant-hostmanager`)

Important files:
- puphpet/config.yaml: vm configs, software versions and credentials
- install.sh: install process

Notes: no emails will be sent (i.e for registration), everything will be saved into logs inside html/carpoolear_backend/storage/logs/

## Software versions

Ubuntu: 16.04

PHP: 7.2

Apache: 2.4

MySql: 5.7

Node.js: 7

Cordoba: 8
