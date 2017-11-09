Deploy Jenkins server via vagrant
===

This repository contains vagranfile configuration and bash script for building jenkins server with nginx using that base box.

To use the contents of this repo you will need the following installed

 1. VirtualBox - http://www.virtualbox.org/
 2. Vagrant - http://www.vagrantup.com/


The vagrant configuration consists of three parts:
 
1. The `vagrantfile` file used instruct the vagrant installer
2. Install `provision.sh`script  which installs and configure our pre-provisioned packages


##Creating a VM

Launch the vagrant configuration by invoking this command from inside the `vagrant` folder of this repo.

```
	vagrant up
```

Vagrant will automatically import the box generated by virtualbox under the name `jenkins`. (Note that if you rebuild the image after launching this vagrant config,
you will need to remove the "jenkins" box from vagrant before you'll get the new build.) 

After the VM is booted it will provision the configuration files using the `provision.sh` file.  
This is a plain bash script that simply install and copies various config files from the current folder.

The VM is now running in Virtualbox. You can ssh into it (no password required)
as follows: 

```
  vagrant ssh # ssh in to the VM
```

Once the VM boots, you can visit http://jenkins/ to confirm that Nginx and jenkins server is running (it should display the jenkins startup page without port).

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
| [<img src="https://avatars.githubusercontent.com/u/15673522?v=3" width="100px;"/><br /><sub>Arseni Dudko</sub>](https://github.com/ArseniD)<br />💁 [📖](https://github.com/ArseniD) 👀 📢 | [<img src="https://avatars.githubusercontent.com/u/32544150?v=4" width="100px;"/><br /><sub>Andrey Bandarovich</sub>](https://github.com/ven-ven9l)<br />[📖](https://github.com/ven-ven9l) 👀 | [<img src="https://avatars.githubusercontent.com/u/32546999?v=4" width="100px;"/><br /><sub>Dzmitry Tarasevich</sub>](https://github.com/dzmitrytarasevich)<br />[📖](https://github.com/dzmitrytarasevich) 👀 | [<img src="https://avatars.githubusercontent.com/u/153481?v=3" width="100px;"/><br /><sub>F. Hemberger</sub>](https://github.com/fhemberger)<br />[📖](https://github.com/kentcdodds/all-contributors/commits?author=fhemberger) |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| [<img src="https://avatars.githubusercontent.com/u/3982200?v=3" width="100px;"/><br /><sub>Daniel Kraft</sub>](https://github.com/frigginglorious)<br />[📖](https://github.com/kentcdodds/all-contributors/commits?author=frigginglorious) | [<img src="https://avatars.githubusercontent.com/u/8503331?v=3" width="100px;"/><br /><sub>Mayank Badola</sub>](https://github.com/mbad0la)<br />[📖](https://github.com/kentcdodds/all-contributors/commits?author=mbad0la) 🔧 | [<img src="https://avatars.githubusercontent.com/u/5244986?v=3" width="100px;"/><br /><sub>Marco Biedermann</sub>](https://www.marcobiedermann.com)<br />🎨 | [<img src="https://avatars.githubusercontent.com/u/22768990?v=3" width="100px;"/><br /><sub>Itai Steinherz</sub>](https://github.com/itaisteinherz)<br />[📖](https://github.com/kentcdodds/all-contributors/commits?author=itaisteinherz) | [<img src="https://avatars1.githubusercontent.com/u/305339?v=3" width="100px;"/><br /><sub>Patrick Connolly</sub>](http://nodescription.net)<br />[📖](https://github.com/kentcdodds/all-contributors/commits?author=patcon) | [<img src="https://avatars2.githubusercontent.com/u/3028124?v=4" width="100px;"/><br /><sub>Nikola Đuza</sub>](http://nikolalsvk.github.io/)<br />[📖](https://github.com/kentcdodds/all-contributors/commits?author=nikolalsvk) |
<!-- ALL-CONTRIBUTORS-LIST:END -->
