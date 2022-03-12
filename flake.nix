{
  description = ''gyaric is a module to encode/decode text to unreadable gyaru's text.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."gyaric-master".url = "path:./master";
  inputs."gyaric-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."gyaric-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."gyaric-v1_0_0".url = "path:./v1_0_0";
  inputs."gyaric-v1_0_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."gyaric-v1_0_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."gyaric-v1_0_1".url = "path:./v1_0_1";
  inputs."gyaric-v1_0_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."gyaric-v1_0_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."gyaric-v1_0_2".url = "path:./v1_0_2";
  inputs."gyaric-v1_0_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."gyaric-v1_0_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}