# Building a Mature dbt Project from Scratch

Hello! This is the companion repo to the 2021 Coalesce Talk - Building a Mature dbt Porject from Scratch
(TODO: add link)

## Purpose

The purpose of this repository is to give some insight in the use of different dbt features at different stages of maturity.

In all likelihood, you encountered dbt for the first time because 


## Structure

In this repository, you'll see (( 5 or 6 TODO)) different dbt projects, labelled by their maturity. These projects are meant to represent *one* project
at different points in it's lifecyle.

## Projects

Here's a brief description of the feature sets in each project 
### Newborn
This project represents truly the bare minimum needed to have dbt do anything of use. It's really only *technically* a dbt project :)

Features:
  - Models
  - Commands

### Toddler
This project is just starting to walk. It can now handle multiple models, and it's able to see the difference between raw and transformed data. 

Features:
  - Models
    - adds `{{ ref() }}` functionality! Modularize your model!
  - Sources
    - uses `{{ source() }}` functionality, builds a layer of abstraction between source data and your transformations
  - Macros
    - as above, start to understand some of the key built-in macros that make dbt work. 
  - Docs
    - single model documentation for critical models

### Elementary 
Now we're starting to let our project free into the world. Time to set some ground rules!
You wouldn't send your project to school without a list of allergies, so it's time to let people know how they should be interacting with your project

Features:
  - Standards
    - not *technically* a dbt feature per se, but critical to scaling!
    - README
    - Style Guide
    - Contribution Guide
  - Testing
  - Docs
    - deployed and shared widely!
  - Basic Materializations
  - Deployment (after all of the above)


### High School
Look at your beautiful project, all grown up, about to go to prom. At this stage, your project is learning things fast, and is looking to figure out ways to work smarter not harder 
(so it spend more time at 7/11 with their friends)

  - Packages
  - Incremental Materializations 
  - Custom Macros (SQL)
  - Custom Data Test
  - Custom Deployments (specific jobs)

### College and Beyond

  - Custom Macros (Scripting)
  - Selectors/Tagging
  - Custom Schema and Database Behavior
  - Custom Generalized Test
  - Custom Materializations
### PhD

  - Introspective Analyses
    - Metadata API/dbt artifacts for runtime analyses
    - Project Health Metrics
      - test coverage!
  
  
