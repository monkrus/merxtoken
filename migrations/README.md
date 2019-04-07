## [MerxNet](https://merxnet.com/) ##

Custom implementation of basic ERC20 token using OpenZeppelin library

## Prerequisites ##

Check if Node.js and truffle are installed by typing  
`node -v` and  `truffle version`

## Steps ##

1. Initialize truffle (development environment) `truffle init`

2. Create package.json  `npm init`

3. Create .env file containing test private keys for testing purposes.
Keys can be exported from MetaMask.

4. Set up Truffle environment in `truffle-config.js`

5. Run `npm install --save-dev dotenv truffle-wallet-provider ethereumjs-wallet`

5. Import OpenZeppelin library `npm install openzeppelin-solidity`

:exclamation:  To avoid imports highlighted red in VSC, add to your user settings:
``` 
"solidity.packageDefaultDependenciesContractsDirectory": "",
"solidity.packageDefaultDependenciesDirectory": "src/node_modules" 
```
6. Run `truffle compile`



## Tests ##
