const housecoin = artifacts.require("housecoin");

module.exports = function (deployer) {
  deployer.deploy(housecoin);
};