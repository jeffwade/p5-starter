# P5 Starter

p5.sh is a shell script that I use to quickly create and open local
[p5.js](https://p5js.org) projects.


## Usage

Clone this project into your local p5 sketchbook directory

Add the following to your .bash_profile or .zshrc file:

`export P5_SKETCHBOOK="/path/to/your/p5-sketchbook"`

`source $P5_SKETCHBOOK/starter/p5.sh`

Source your .bash_profile or .zshrc, (or restart terminal)

Now, you can run `p5`
- `p5` = open your p5 sketchbook and list your projects
- `p5 [project]` = open/create [project]
  - Prompts to initialize a git repo and edit files



## To do

- use getopts
- add check for P5_SKETCHBOOK environment variable so that it can be set when the script first runs
- add socket.io option
