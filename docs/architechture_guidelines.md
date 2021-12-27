# Project guidelines for architecture and coding conventions

## State management

* qubit (someone please add guidelines)

* Widgets should be stateless

## Routing

* We should use routers consistently throughout the project

## Code structure

* `part` files shouldn't be used

* Don't split files too often. Only split them if we see that it would make work easier and 
  make code more readable, clear or navigable

## Stability and errors handling

* Take care of exceptions. If there is something that can go wrong, make sure to catch that and
show a user friendly and accurate message (for example if the request fails we can't just give a message "bad data", 
  we need to make sure that it was actually bad data and not, for example, network issues.)
  
## Commenting

* In cases where you think that it might be not clear what you were doing and would like ot explain to others, what you were doing, and, most importantly, why.

## Consistency

* Try using the same architectural patterns throughout the project if that's possible. If in doubt about something, discuss with the team.


When in doubt, listen to your guts :) 

Happy coding :) 
