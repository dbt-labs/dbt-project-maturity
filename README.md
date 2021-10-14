# Building a Mature dbt Project from Scratch

![image](https://user-images.githubusercontent.com/73915542/137219625-69b476b7-0db8-40ec-bae4-cd1fa1c9d498.png)


Hello! This is the companion repo to the 2021 Coalesce Talk - [Building a Mature dbt Porject from Scratch]
(https://coalesce.getdbt.com/talks/how-to-build-a-mature-dbt-project-from-scratch/)

## Purpose

The purpose of this repository is to give some insight in the use of different dbt features at different stages of project maturity. In all likelihood, you encountered dbt for the first time because you first heard about a super cool feature that dbt has (incremental model! macros!) or a neat workflow that dbt can support (PR checks!). But as with any new tool, you have to walk before you can run. Each of the subdirectories represents a rough approximation of what a project would look like as it starts to snowball into a fully mature, ready for primetime dbt project. 

Some caveats and assumptions:
  - There are real life use cases where some features get introduced into projects *not* in this order! That is ok and sometimes that is necessary.
  - There is no sense of timescale in this display! Some teams may mature there project in weeks rather than months, depending on a wide range of factors It's more important to think about *how* features build upon themselves (and each other) rather than *how quickly* they do so.  


## Projects

### Newborn
Congratulations! It's a DAG!!

This project represents truly the bare minimum needed to have dbt do anything of use. It's really only *technically* a dbt project, but is going to need a lot of hand holding to do anything useful and keep it alive. 

Features:
  - Models
  - Commands
    - `dbt run`

### Toddler
This project is just starting to play with its blocks, and see how the world fits together. It can now handle multiple models, and it's able to see the difference between raw and transformed data. 

Features:
  - Models
    - adds `{{ ref() }}` functionality! Modularize your model!
  - Sources
    - uses `{{ source() }}` functionality, builds a layer of abstraction between source data and your transformations
  - dbt Macros
    - Start to understand some of the key built-in macros that make dbt work. 
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
    - `table`
  - Deployment (after all of the above!)


### High School
Look at your beautiful project, all grown up, about to go to prom. At this stage, your project is learning things fast, and is looking to figure out ways to work smarter not harder 
(so it can spend more time at 7/11 with their friends)

  - Sources 
    - Freshness
  - Packages
  - Incremental Materializations 
  - Documentation
    - column-level docs for key metrics/critical columns (TODO)
  - Custom Macros (SQL)
  - Custom Data Tests
  - Custom Deployments (specific jobs)

### College and Beyond

  - Custom Macros (Scripting)
  - Selectors/Tagging
  - Custom Schema/Database Behavior
  - Custom Generalized Test
  - Hooks & Operations
  - Exposures
    - For dbt Cloud users: [unlocks status tiles](https://docs.getdbt.com/docs/dbt-cloud/using-dbt-cloud/cloud-dashboard-status-tiles)  

### These things may be PhD level!
  - Introspective Analyses
    - Metadata API/dbt artifacts for runtime analyses
    - Project Health Metrics
      - Test Coverage!
### Omitted Features

Some features are not included in this project, not because they are unimportant, but because they generally are only used as-needed when the specifics of your data/project call for it. 

- Snapshots
- Seeds (although the raw data project has a good example!)
- Variables/Environment Variables
- Analyses
