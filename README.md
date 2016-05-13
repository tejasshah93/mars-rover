# Mars Rover

A ruby program to solve the Mars Rover problem.

INPUT AND OUTPUT

Test Input:  
```
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
```

Expected Output:  
```
1 3 N
5 1 E
````

A `sample_input` file (with valid/invalid inputs) is included for
demonstration. For invalid inputs, a corresponding error message is displayed.  

To execute the ruby program, run the following command:  

`$ ruby solution.rb < sample_input`


## Testing

To install the required gems, run `$ bundle install`  in the repo directory.

For executing the specs (unit testing), execute the following command:  

`$ bundle exec rspec --format documentation --color`

On completion, the following output is obtained after successfully passing each
test:  

![rpsecs passing](https://dl.dropboxusercontent.com/u/91231499/Hosting/MarsRover-Test-Screenshot.png)
