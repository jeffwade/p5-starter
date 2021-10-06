# P5 Starter

p5.sh is a shell script that I use to quickly create and open local
[p5.js](https://p5js.org) projects.

## Usage

Clone this project into your local p5 sketchbook directory

Add the following to your .bash_profile or .zshrc file:
`export P5_SKETCHBOOK="[the path to your p5 sketchbook]"`
`source $P5_SKETCHBOOK/starter/p5.sh`

Source your .bash_profile or .zshrc, (or restart terminal)

Now, you can run `p5`
- `p5` = open your p5 sketchbook and list your projects
- `p5 [project]` = open/create [project]

## TO-DO

[ ] use getopts

[ ] add check for P5_SKETCHBOOK environment variable
-- Right now it requires the p5 sketchbook to be set in an environment variable
called `P5_SKETCHBOOK`, but I'll eventually add a check for this so that it can
be set the first time you run the script.

[ ] add socket.io option
