# Boris Bikes

#### Technologies: Ruby, Rspec

## Makers Academy - Week 1 Pair Programming Project

## Outline

Let's go back several years, to the days when there were no Boris Bikes. Imagine that you're a junior developer (that was easy). Transport for London, the body responsible for delivery of a new bike system, come to you with a plan: a network of docking stations and bikes that anyone can use. They want you to build a program that will emulate all the docking stations, bikes, and infrastructure (repair staff, and so on) required to make their dream a reality.

## The Challenge

I revisted this challenge and completed it again as a refresher. This time around, I am very happy to have been able to automate my feature tests - found in spec/feature_spec.rb. These tests output a story, whilst testing all the features of the code.

The code allows for:

1 - Creation of a bike
2 - Reporting a bike as broken
3 - Docking of bikes at a docking station, ensuring that they are actually bikes and separating them into working and broken bikes.
4 - Loading of broken bikes onto a van to be taken away for repair.
5 - Unloading of broken bikes at a garage.
6 - Repairing of bikes at the garage.
7 - Loading of working bikes onto a van to be taken back to a docking station.
8 - Unloading of working bikes at a docking station.
9 - The acceptance of storing of payment for hiring of bikes.

### User Stories
```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

As a person,
So that I can use a bike,
I'd like to get a bike from a docking station.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station

As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked

As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.

As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.

As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.

As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary.

As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to collect working bikes from garages and distribute them to docking stations.

As a maintainer of the system,
So that I can take payment for hiring bikes to the public,
I'd like docking stations to accept and store payment.
```
