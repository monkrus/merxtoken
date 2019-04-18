const MerxToken = artifacts.require("./MerxToken.sol");

module.exports = function(deployer) {
  deployer.deploy(MerxToken, 1000000); 
};
