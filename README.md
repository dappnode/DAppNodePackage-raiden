# DAppnodePackage-raiden
[![DAppNodeStore Available](https://img.shields.io/badge/DAppNodeStore-Available-brightgreen.svg)](http://my.admin.dnp.dappnode.eth/#/installer/raiden.dnp.dappnode.eth)

This is a package to deploy a [Raiden node](https://raiden.network/) in a DAppNode.

The Raiden Network is an off-chain scaling solution, enabling near-instant, low-fee and scalable payments. It’s complementary to the Ethereum blockchain and works with any ERC20 compatible token.

See the [documentation](https://raiden-network.readthedocs.io/en/stable/index.html) for more information.

# How to use this package

    TODO

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
