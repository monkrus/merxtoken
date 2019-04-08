var MerxToken = artifacts.require("MerxToken");

module.exports = function(deployer) {
  // Deploy the MerxToken contract as our only task
  deployer.deploy(MerxToken);
};
