# Advent of Code 2023 - Ruby

Designed for using the Run and Debug functionality in VSCode.  VSCode debugging works for all launch options including unit tests

## Launch options

**Run current day** To find the current day it looks for `DayXX` classes and executes the `solve` method in the latest one  
**Rspec current day** Run rspec tests with a `class_name` attribute matching the current day's class name  
**Run older day** Prompts for parameters, type in the day number to run  
**Rspec all days** Run all rspec tests  
**Scaffold next day** Set up the next day, create both test and full files for input, solution class and rspec class based on templates (todo: pull full input file directly from AOC at this time)  