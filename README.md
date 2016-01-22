# Itamae Recipes for Rails with Vagrant

## OS

CentOS 6.6 (Vagrant)


## Environment

* Ruby (rbenv)
  * 2.3.0 (default): it can be added and modified by `nodes/node.json`.
* Postgresql
  * 9.4-2


## How To

####Clone this repo.

Place it in the same directory as Vagrantfile.

####Install vagrant-itamae plugin.

```
$ vagrant plugin install vagrant-itamae
```

####Add config in Vagrantfile

```
config.vm.provision :itamae do |config|
  config.sudo = true
  config.shell = '/bin/sh'
  config.recipes = './itamae/recipes/base.rb'
  config.json = './itamae/nodes/node.json'
end
```

####Provisioning

```
$ vagrant up
$ vagrant provision
```


##TODO

- Vagrant installation doc
- Add imagemagick
