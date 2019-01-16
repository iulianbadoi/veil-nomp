### Install
```
wget -qO- https://raw.githubusercontent.com/mrmetech/veil-nomp/master/install-pool.sh | bash -s -- -N
```

-------

### Donations

Donate Mrmetech some veil

* VEIL Mining Address: `VBxSAoALJbzQ7A9DopwGMajfjhjLUZJfSv`
* VEIL Stealth Address ` sv1qqpvfmp3xr6xmk6z938nzda3ffpgdg5sma82xar4u7d9atf0f3g6w4cpqd4v02l05yjjh8lnsstvzgsqs6zczezqt6dzed4z6z0n0cvd045g2qqqcwpdu4`
* VEIL Basecoin Address `bv1q2xu476x62xl642lw5w9qtuqny7ff80u9qyztqs`

---------

### Node Open Mining Portal consists from 3 main modules:
* Main module - https://github.com/foxer666/node-open-mining-portal
* Stratum Pool - https://github.com/foxer666/node-stratum-pool
* Node Multihashing libraries https://github.com/foxer666/node-multi-hashing

Stratum Pool can be replaced with node-merged-pool (it's made in UNOMP)
Adding new algos threw Node Multihashing libraries.

Current version: v1.0.11

-------
### Install
```
git clone https://github.com/foxer666/node-open-mining-portal.git pool
cd pool
npm install
node init.js
```
-------
### Requirements
* Node 8.x.x or higher
* Coin daemon
* Redis Server

### Run in Docker

1) Correct configs appropriately to your environment in docker directory
2) ```cd docker```
3) ```docker build -t nomp .```
4) ```docker run -d --name nomp -v $(pwd)/config:/opt/config nomp ```

You will need to expose some ports to make it accessible from outside. You can achieve this by adding option -p HOST_PORT:CONTAINER_PORT in 4th step

You can see the logs of the server with ```docker logs -f nomp```, or jump into container with ```docker exec -it nomp```.

-------
### License
Released under the GNU General Public License v2
http://www.gnu.org/licenses/gpl-2.0.html
