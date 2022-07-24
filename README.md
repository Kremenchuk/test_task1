# Slow requests

The goal of this task is to implement a solution to the real life issue with performance in Ruby on Rails application.

## Prerequisites
You are given a simple Article application. The request to create an article (ArticleController#create) has started to take longer than expected.

## Goal
Solve the performance issue so that the request is executed (the article is created), and the user can continue working with the application. The response time from ArticleController#create should take less than 1s.

## Rules
1. Method in the ExternalCall module should still be executed;
2. Modifications of code in the ExternalCall module are not allowed;
3. Ruby/Rails version doesn't matter;
4. Gems are allowed.
