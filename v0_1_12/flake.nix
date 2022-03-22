{
  description = ''Build Postgres extensions in Nim.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-pgxcrown-v0_1_12.flake = false;
  inputs.src-pgxcrown-v0_1_12.ref   = "refs/tags/v0.1.12";
  inputs.src-pgxcrown-v0_1_12.owner = "luisacosta828";
  inputs.src-pgxcrown-v0_1_12.repo  = "pgxcrown";
  inputs.src-pgxcrown-v0_1_12.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-pgxcrown-v0_1_12"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-pgxcrown-v0_1_12";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}