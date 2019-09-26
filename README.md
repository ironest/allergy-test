# allergy-test

Github Repo: [github.com/ironest/allergy-test](https://github.com/ironest/allergy-test)

Contributors: Riccardo Carzania ([github.com/ironest](https://github.com/ironest))

### Prerequisites
Make sure you have installed following prerequisites on your machine:
* Git - [Download & Install Git](https://git-scm.com/downloads)
* Ruby - [Ruby Installation guide](https://www.ruby-lang.org/en/documentation/installation/) (this was built on Ruby version 2.6.3, but other versions should work fine)

### Getting started

1. Clone the **allergy-test** git repository locally:
   ```shell
   git clone https://github.com/ironest/allergy-test.git
   ```
2. Move into the repository folder:
   ```shell
   cd allergy-test
   ```
3. Start the app
   ```shell
   ruby index.rb
   ```
4. Enjoy!

### Purpose and Scope

An allergy test produces a single numeric score which contains the information about all the allergies the person has (that they were tested for). The list of items (and their value) that were tested are:
 * eggs (1)
 * peanuts (2)
 * shellfish (4)
 * strawberries (8)
 * tomatoes (16)
 * chocolate (32)
 * pollen (64)
 * cats (128)

So, if Tom is allergic to peanuts and chocolate, he gets a score of 34.
Write a program that, given a person’s score can tell them:
 * whether or not they’re allergic to a given item
 * the full list of allergies.
