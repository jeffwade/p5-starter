#!/bin/sh

# Open or create a p5js sketch
# check to see if the P5_SKETCHBOOK env variable is set
# if [ -d $P5_SKETCHBOOK ]; then
# echo "Where is your p5.js sketchbok located?"
# read P5SB
# echo "export P5_SKETCHBOOK="$P5SB"" >> $HOME/.zshrc
# export P5_SKETCHBOOK="$P5SB"
# fi

# if arguments are passed
function p5 () {
  local TOEDIT PROJECT_NAME PROJECT_PATH CRATEPROJ INIT_GIT EDITING 

  TOEDIT=false
  if test $# -gt 0; then
    while test $# -gt 0; do
      case "$1" in
        -e|--edit|e|edit)
          TOEDIT=true
          shift
        ;;
        -h|--help|h|help)
          echo "This help needs help"
          echo "\nusage: p5 [-hs] [<project-name>]"
          echo "\nPassing no parameters will change directory to the \$P5_SKETCHBOOK ($P5_SKETCHBOOK)"
          echo "\nProviding a project name with no options will open the specified project, if it exists.\n\nIf no project with that name exists, it will ask if you want to create one.\n\nIt will then ask if you want to initialize a git repo for the project. \n\nFinally, it will ofer to open the project in vim to start editing immediately."
          echo "\n\nThe options are as follows:"
          echo "\n\n-h help : show this info"
          echo "\n\n"
          shift
        ;;

        -s|--socket)
          echo "this should create a new p5 sketch with socket.io enabled"
          echo "but right now it's not going to do anything"
          shift
        ;;

        *)
          PROJECT_NAME="$1"
          PROJECT_PATH="$P5_SKETCHBOOK/$PROJECT_NAME/"
          shift

          # Check to see if a project of that name exists
          if [ -d "$PROJECT_PATH" ]; then
            echo "Opening $PROJECT_NAME..."
            cd "$PROJECT_PATH"

          else
            # if not, create a new directory for the project
            read -q "CRATEPROJ?There is no project named \"$PROJECT_NAME\" in your p5 sketchbook ($P5_SKETCHBOOK).\nWould you like to create one now? (y/n)"
            case $CRATEPROJ in
              y|Y)
              echo "\nCreating $PROJECT_NAME..."
              mkdir -p "$PROJECT_PATH"
              echo "Copying starter files..."
              cd "$PROJECT_PATH"
              cp -nR "$P5_SKETCHBOOK/starter/project_files/" "$PROJECT_PATH"

              # ask if you want to initialize a git repo
              read -q "INIT_GIT?Do you want to initialize a git repo for $PROJECT_NAME? (y/n):"
              case "$INIT_GIT" in
                # initialize repo
                y)
                  git init
                  echo "# $PROJECT_NAME" >> README.md
                  git add .
                  git commit -m "first commit"
                ;;
                *)
                  echo "\nA'ight. no git."
                ;;
              esac
            ;;
            *)
              echo "\nOkay. I'ma leave then. Have a nice day!"
              return 0;
            ;;
          esac
          fi

          if $TOEDIT; then
            nvim "$PROJECT_PATH"
            echo "\nI hope that was productive :)"
            echo "\nProject files:"
            ls -F

          else
            # Ask if user wants to edit the project
            echo "\nProject files:"
            ls -F
            echo
            read -q "EDITING?Do you want to edit $PROJECT_NAME now? (y/n):"
            case "$EDITING" in
              y)
                echo "\nediting $PROJECT_NAME..."
                nvim "$PROJECT_PATH"
                echo "\nI hope that was productive :)"
                ;;
              *)
                echo "\nnot now? s'cool. maybe later."
                ;;
            esac
          fi
        # end of * top-level arg
        ;;
      # end of switch on p5 args
      esac
    #end of while loop
    done

  else
    # if no arguments
    echo "\np5.js sketchbook:"
    cd $P5_SKETCHBOOK
    ls -F
  fi
}
