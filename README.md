# Gilded Rose Project

This challenge involved being given some legacy code which used a whole bunch of nested if statements, and required refactoring any way I saw fit.

## Design Choices
Looking at the objects used in the project, I could see that we had a few different types of items, and that the base Item class would not be enough to manage them all, and as part of the challenge, we were not to touch the Item class file at all, else face the wrath of the goblin.

I chose to use this supplied Item class as the base class for a new set of sub-classes:

* GenericItem
* Sulfruas
* AgedBrie
* BackstagePass

Each class has its own set of overridden and custom methods to handle their own tasks in their own way.

## Tests
Tests were written in RSpec and are currently at 100% coverage, all passing.