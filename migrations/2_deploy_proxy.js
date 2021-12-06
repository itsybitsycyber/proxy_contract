//migration file to deploy and debug 

const Dogs = artifacts.require("Dogs");
const DogsUpdated = artifacts.require("DogsUpdated");
const Proxy = artifacts.require("Proxy");

module.exports = async function (deployer, network, account) {
  // deploy 
  const dogs = await Dogs.new();
  const proxy = await Proxy.new(dogs.address);

  var proxyDog = await Dogs.at(proxy.address); 
  
  await proxyDog.setNumberOfDogs(10);

  var nrOfDogs = await proxyDog.getNumberOfDogs();
  console.log(nrOfDogs.toNumber());

  // update proxy to forward to new contract 
  const dogsUpdated = await DogsUpdated.new();
  proxy.upgrade(dogsUpdated.address);
  proxyDog = await DogsUpdated.at(proxy.address);
  proxyDog.init(account[0]);

  // check storage in proxy (stays the same)
  nrOfDogs = await proxyDog.getNumberOfDogs();

  //new update
  await proxyDog.setNumberOfDogs(30);
  nrOfDogs = await proxyDog.getNumberOfDogs();
  console.log("After updated contract: " + nrOfDogs.toNumber());


};
