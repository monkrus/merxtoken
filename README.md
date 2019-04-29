## [MerxNet](https://merxnet.com/) ##

Custom implementation of basic ERC20 token using OpenZeppelin library

## Prerequisites ##

Check if Node.js and truffle are installed by typing  
`node -v` and  `truffle version`

## Steps ##

#BACKEND#

1. Initialize truffle (development environment) `truffle init`

2. Set up Truffle environment in `truffle-config.js`

3. Set up the migration script in `2-deploy_migration.js` to deploy the contract

4. Deploy MerxToken by  running `truffle migrate`

5. Run `truffle compile` to compile the token code

5. Run  Test 1 (`truffle test`, see Tests)

6. Create MerxToken.js and run Test 2 (`truffle test`, see Tests)

7. Reason for`AssertionError: error message must contain revert` :
Ganache has implemented a workaround to forward the reason of a failed 
`require` but other clients will fail with a regular exception.

This is good for ganache because truffle is able to show the **exact cause** of an `require` failure. But the feature is not portable because other clients didn't implement a similar feature.


#FRONTEND#

1. Run `npm init` to create a `package.json` file

2. Run `npm install`, add lite-server dependencies

4. Run `npm run dev` (lite-server)

3. Create `bs-config.json` file for lite-server

4. Create css folder for css, js and index.html files.
/minified css, js, bootstrap and jquery/

5. Import `web3`, `truffle-contract` libraries and create `app.js`
Web3 allows our app to communicate with  blockchain. 
MetaMask injects into HHTPprovider that allows our browser to talk to the blockchain.

6. Setup MetaMask.Choose import account->select type `private key` and paste private key from one of Ganache addresses. It will look like 
`(://localhost:7545)`

7. Install GETH, full ETH node on our machine.(for Win10)
Type `geth account new`, press `enter`, create a password. Start it by typing `geth --rpc`
To check the GETH version, type `geth version`

8. We are using `Rinkeby` test network.To start Geth on Rinkeby, type  `geth --rinkeby --rpc --rpcapi="personal,eth,network,web3, net" --ipcpath ~/AppData/Roaming/Ethereum` (for Win10)
In a separate window, type `geth attach http://localhost:8545`. Once you get a greeting message 
("Welcome to the Geth JS console!") , type `eth.syncing` to see the progress.

9. 
















## Tests ##

1. Test 1.
`truffle console`
`MerxToken.deployed().then(function(i) {token=i;})`
`token.address`
//result
'0x113317147297363C39928CAbD1dFDc986ce9030c'


2. Test 2.
Please see `MerxToken.js` and `MerxTokenSale.js`
Run `truffle test` to test.

