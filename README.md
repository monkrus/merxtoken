## [MerxNet](https://merxnet.com/) ##

Custom implementation of basic ERC20 token using OpenZeppelin library

## Prerequisites ##

Check if Node.js and truffle are installed by typing  
`node -v` and  `truffle version`

## Steps ##

1. Initialize truffle (development environment) `truffle init`

2. Set up Truffle environment in `truffle-config.js`

3. Set up the migration script in `2-deploy_migration.js` to deploy the contract

4. Deploy MerxToken by  running `truffle migrate`

5. Run `truffle compile` to compile the token code

5. Run  Test 1 (`truffle test`, see Tests)

6. Create MerxToken.js and run Test 2 (`truffle test`, see Tests)















## Tests ##

1. Test 1.
`truffle console`
`MerxToken.deployed().then(function(i) {token=i;})`
`token.address`
//result
'0x113317147297363C39928CAbD1dFDc986ce9030c'


2. Test 2.
Please see `MerxToken.js`

