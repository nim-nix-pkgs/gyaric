{
  description = ''gyaric is a module to encode/decode text to unreadable gyaru's text.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-gyaric-v1_0_2.flake = false;
  inputs.src-gyaric-v1_0_2.owner = "jiro4989";
  inputs.src-gyaric-v1_0_2.ref   = "refs/tags/v1.0.2";
  inputs.src-gyaric-v1_0_2.repo  = "gyaric";
  inputs.src-gyaric-v1_0_2.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-gyaric-v1_0_2"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-gyaric-v1_0_2";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}