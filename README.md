# DAppnodePackage-raiden
[![DAppNodeStore Available](https://img.shields.io/badge/DAppNodeStore-Available-brightgreen.svg)](http://my.admin.dnp.dappnode.eth/#/installer/raiden.dnp.dappnode.eth)

This is a package to deploy a [Raiden node](https://raiden.network/) in a DAppNode.

The Raiden Network is an off-chain scaling solution, enabling near-instant, low-fee and scalable payments. It’s complementary to the Ethereum blockchain and works with any ERC20 compatible token.

See the [documentation](https://raiden-network.readthedocs.io/en/stable/index.html) for more information.

# Build prerequisites

- git

   Install [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) commandline tool.

- docker

   Install [docker](https://docs.docker.com/engine/installation). The community edition (docker-ce) will work. In Linux make sure you grant permissions to the current user to use docker by adding current user to docker group, `sudo usermod -aG docker $USER`. Once you update the users group, exit from the current terminal and open a new one to make effect.

- docker-compose

   Install [docker-compose](https://docs.docker.com/compose/install)
   
**Note**: Make sure you can run `git`, `docker ps`, `docker-compose` without any issue and without sudo command.


## Building

`docker-compose build`

## Running


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Note

This is early stage software

# Raiden mainet keystore uploading doc 


Raiden is available in DAppNode in mainet and the different testnets, but in mainet you have to upload your own keystore. 

## Running Raiden in mainet

In mainet you will have to install the mainet package and  take into account that your Ethereum node should be running with the same flags as in testnet.

 ```--rpcapi eth,net,web3,txpool```  and the flag ```--no-ancient-blocks``` should not be activated. 
 
 ![](https://i.imgur.com/X1bJCJF.png)

If you do not have a keystore file, you can create a new wallet in My Ether Wallet or MyCrypto, and then fund it with a bit of ETH / WETH (only token supported in mainet at the moment). 

Please be aware that the online creation of wallets via a keystore file is not such a good security practice. This can be mitigated if you download the MyCrypto local app and create the wallet offline. 

Do not leave significant value in wallets created through this method.


## Keystore uploading

Go to packages and enter the Raiden  package 

![](https://i.imgur.com/p0IVsPn.png)


* In the "File manager" field upload your keystore file  (please note that in  the current version, WETH is the only token supported)

No need to select any path in this case, you can leave this field as it is, and the keystore file will be uploaded in the correct path once you hit the "Upload" button.

* In "Environment Variables", fill the options with:

    * The password of the uploaded keystore
    * Its address


Here you have an example screenshot!

![](https://i.imgur.com/DPbu66n.png)


If all the steps have been performed correctly you will see these logs within the Raiden package (at the bottom of the screen)

![](https://i.imgur.com/2SQ802h.png)


Now you can access the [Raiden UI](http://raiden.dappnode)  and start doing instant payments.

## Backup of your account

When you install the Raiden mainet package the keystoore is stored in your DAppNNode.

If you want to have a backup of that account follow these steps.

* Enter the Raiden Package in the packages tab and scroll down to File Manager
* Write "keystore" in the "Download from DNP" field 
* Hit download

![](https://i.imgur.com/PoALyud.png)


A compressed file called "keystore" will be dowloaded containing both the keystore file and the password (the latter as a hidden file)

## Using Raiden with different accounts

If you have different keystores with WETH and you want to switch the account, you can do so by uploading your keystore file to the Raiden DAppNode Package (DNP) and by writing the address and password of your keystore in the environment variables field.

* Go to File manager
* Hit browse and select your keystore file
* Click upload without need to write anything in the path field

![](https://i.imgur.com/2NK4EV2.png)


Your keystore is now uploaded. Now we need to tell the package that you want to use that keystore

* Go to Environment Variables
* Type the password of your newly uploaded keystore (address is not needed, it will be automatically detected)
* Hit update environment variables

![](https://i.imgur.com/sjKiw1s.png)


You are done!

When you go to the [Raiden ADMIN UI](http://raiden.dappnode) you will see your custom account. 

As long as you have the keystore uploaded to the package you can use any account just by typing its password in  the Environment variables field of the package and hitting Update, just the password, you do not need to write the address, the account will be  recognized and you will be using that account when accessing the UI.

Now you are ready to enjoy fast, cheap, and scalable token transfers for Ethereum. 




