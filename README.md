#A-Maze-ing

##Sinatra app that solves mazes breath or depth first
###Process
1. Loads text file and turns it into a multidimensional array of empty spaces and walls
2. Makes a second multidimensional array and leaves "breadcrumbs" in each empty space of it's prior coordinates
3. Traces the coordinates from second step backwards and saves process in a third, final multidimensional array
