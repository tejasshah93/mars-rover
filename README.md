# Mars Rover

A ruby program to solve the Mars Rover problem.

**INPUT AND OUTPUT**

The first line of input is the upper-right coordinates of the plateau, the
lower-left coordinates are assumed to be 0,0.  

The rest of the input is information pertaining to the rovers that have been
deployed. Each rover has two lines of input. The first line gives the rover's
position, and the second line is a series of instructions telling the rover how
to explore the plateau.  
Each rover will be finished sequentially, which means that the second rover
won't start to move until the first one has finished moving.  

**Test Input**:  
```
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
```

**Expected Output**:  
```
1 3 N
5 1 E
````

A `sample_input` file (with valid/invalid inputs) is included for
demonstration. For invalid inputs, a corresponding error message is displayed.  

To execute the ruby program, run the following command:  

`$ ruby solution.rb < sample_input`

OR

You can directly type in the inputs on terminal itself. Just run
`$ ruby solution.rb` and it will allow you to provide inputs accordingly.

## Testing

To install the required gems, run `$ bundle install`  in the repo directory.

For executing the specs (unit testing), execute the following command:  

`$ bundle exec rspec --format documentation --color`

On completion, the following output is obtained after successfully passing each
test:  

![rpsecs passing](https://dl.dropboxusercontent.com/u/91231499/Hosting/MarsRover-Test-Screenshot.png)
