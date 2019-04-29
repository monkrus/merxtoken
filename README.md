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

9. Type `geth --rinkeby account new`. Copy the address of the created account.
Request ETH from the faucet if needed.

10. Run `geth attach http://localhost:8545` again and check your accounts by typing `eth.accounts`. To specify the account, type `eth.accounts[0]` and to check balance, type `eth.getBalance(eth.accounts[0])`

11. Add rinkeby configuration to `truffle-config.js`

12. Run Ganache 

13. Run `eth.getBalance(eth.accounts[0])` and type`personal.unlockAccount(eth.accounts[0], null, 1200)`
//null is the password, 1200 is amount of time to unlock the account

14. Type `truffle migrate --reset --compile-all --network rinkeby`

15. Deploy the contract on the Rinkeby network.
Run `geth attach http://localhost:8545`.
In the console, type 
`var admin=eth.accounts[0]`,
`admin`,  
`var tokensAvailable = 75000`,
`tokensAvailable`.

16. Describe the token to web3 - ABI file. Copy `MerxToken.js` ABI (can minify it as well, or use Prettier JSON plugin) and paste it in `var abi ="........."` 

17. Tell web3 the token address.  `var tokenAddress =`......` (copy from MerxToken.json)` Don`t confuse it with tokenSaleAddress!

18. `var TokenContract = web3.eth.contract(abi)` (we got web3 object)

19. `var tokenInstance = TokenContract.at(tokenAddress)` (we got token instance )

20. Type `tokenInstance.name()` (we should receive "MerxToken"as a result, meaning we deployed our contract succesfully)

21. `tokenInstance.balanceOf(admin)` // 1000000
    `tokenInstance.balanceOf(tokenSaleAddress)` // 750000
and 
`tokenInstance.transfer(tokenSaleAddress, tokensAvailable, {from:admin})`
//asynchronous call, wait for the transaction to finish

22.  Type `~/AppData/Roaming/Ethereum` (for Win10), select `keystore` to see
json file associated with each account. Upload json file to MetaMask.

23. Run `npm run dev`

24. Create `deployfrontend.sh` and `docs`folder. 
Make `deployfrontend.sh` executable and deploy it.
All of our file appear in the docs folder.

25. In your GitHub repo, go to `settings`-->`source`-->select `master branch/docs folder`

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

