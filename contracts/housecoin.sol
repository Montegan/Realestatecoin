// SPDX-License-Identifier: MIT
pragma solidity >=0.8.10;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
 
abstract contract housecoin  is ERC20 {

    string public _name ;
    string public _symbol;
    uint256 public _totalSupply; 
    mapping (address=>uint256) balances;

    constructor(){
        _name="house";
        _symbol="HSE";
        _totalSupply=100;
        balances[msg.sender]=_totalSupply;
    }

      function name() public view virtual override returns (string memory) {
        return _name;
    }
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }
    
     function totalSupply() public view virtual override returns (uint256) {
        return  _totalSupply ;
    }

    function balanceOf(address memeber) public view virtual override returns (uint256) {
        return balances[memeber];
    }

    function _mint(address seller, uint256 amount) internal virtual override {
        require(seller != address(0), "ERC20: mint to the zero address");
        _totalSupply += amount;
        balances[seller] += amount;
        emit Transfer(address(0), seller, amount);     
    }

}

 abstract contract realestae is housecoin {
     string hse_name;
     string size;
     address buyer;
     address seller;
    
     constructor(){
         seller=msg.sender;
     }

      event listedhouse(string hse_name, address seller);

      function listhouse(string memory _hse_name, string memory _size) public {
          require(msg.sender==seller, "You are not authorised to list a house");
          hse_name=_hse_name;
          size=_size;
         _mint(seller,100);
 }

 function buyhouse(uint256 amount)public payable {
          require (msg.sender!=seller);
        
 }

 





}