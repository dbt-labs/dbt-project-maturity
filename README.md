# Building a Mature dbt Project from Scratch

![image](https://user-images.githubusercontent.com/73915542/137219625-69b476b7-0db8-40ec-bae4-cd1fa1c9d498.png)


Hello! This is the companion repo to the 2021 Coalesce Talk - [Building a Mature dbt Porject from Scratch]
(https://coalesce.getdbt.com/talks/how-to-build-a-mature-dbt-project-from-scratch/)

# Purpose

The purpose of this repository is to give some insight in the use of different dbt features at different stages of project maturity. In all likelihood, you encountered dbt for the first time because you first heard about a super cool feature that dbt has (incremental model! macros!) or a neat workflow that dbt can support (PR checks!). But as with any new tool, you have to walk before you can run. Each of the subdirectories represents a rough approximation of what a project would look like as it starts to snowball into a fully mature, ready-for-primetime dbt project. 

Some caveats and assumptions:
  - There are real life use cases where some features get introduced into projects *not* in this order! That is very ok and often necessary!
  - There is no sense of timescale in this presentation! Some teams may mature there project in weeks rather than months, depending on a wide range of factors. It's more important to think about *how* features build upon themselves (and each other) rather than *how quickly* they do so.  
  - This presentation assumes familiary and comfortability with git and version control, and that all of the projects are already managed in a repository!


# Projects

Each project is built on a mock data set of patients, doctors, claims, and other billing data. It was generated via the [Mockaroo API](https://www.mockaroo.com/docs). Huge hat-tip to @krevitt for building a sweet G-sheet x Mockaroo integration! In the `0-raw-data` project, you can find the sample dataset this was built from, so you can load them into your warehouse and run each project to get a feel for how the functionality works!

## Newborn
Congratulations! It's (sorta!) a DAG!!

This project represents truly the bare minimum needed to have dbt do anything of use. It's really only *technically* a dbt project, but is going to need a lot of hand holding to do anything useful and keep it alive. 

### Features
  - [Models](https://docs.getdbt.com/docs/building-a-dbt-project/building-models)
  - [Commands](https://docs.getdbt.com/reference/dbt-commands)

### Relevant Commands
  - `dbt run`
### DAG

## Toddler
This project is just starting to play with its blocks, and see how the world fits together. It can now handle multiple models, and it's able to see the difference between raw and transformed data. 

### Features
  - [Models](https://docs.getdbt.com/reference/dbt-jinja-functions/ref)
    - adds `{{ ref() }}` functionality! Modularize your model!
  - [Sources](https://docs.getdbt.com/docs/building-a-dbt-project/using-sources)
    - uses `{{ source() }}` functionality, builds a layer of abstraction between source data and your transformations
  - [dbt Macros](https://docs.getdbt.com/reference/dbt-jinja-functions)
    - Start to understand some of the key built-in macros that make dbt work. 
  - [Docs](https://docs.getdbt.com/docs/building-a-dbt-project/documentation)
    - single model documentation for critical models
  - [Tests](https://docs.getdbt.com/docs/building-a-dbt-project/tests)
    - last-mile testing for final reporting objects

### Relevant Commands
  - `dbt compile`
  - `dbt run`
  - `dbt test`
  - `dbt build`
  - `dbt docs generate`
  - `dbt docs serve`

### DAG

## Elementary 
Now we're starting to let our project free into the world. Time to set some ground rules!
You wouldn't send your project to school without a list of allergies, so it's time to let people know how they should be interacting with your project

### Features
  - [Project Standards and Documentation](https://discourse.getdbt.com/t/how-we-structure-our-dbt-projects/355)
    - not *technically* a dbt feature per se, but critical to scaling!
    - README
    - Style Guide
    - Contribution Guide
    - PR Template
  - [Testing](https://docs.getdbt.com/docs/building-a-dbt-project/tests)
    - Standard minimum testing requirements 
  - Docs
    - Model-level descriptions for all models
    - Deployed and shared widely
  - [Materializations](https://docs.getdbt.com/docs/building-a-dbt-project/building-models/materializations)
    - `table`
  - [Deployment](https://docs.getdbt.com/docs/running-a-dbt-project/running-dbt-in-production) (after all of the above!)

### Relevant Commands
  - `dbt compile`
  - `dbt run`
  - `dbt test`
  - `dbt build`
  - `dbt docs generate`
  - `dbt docs serve`

### DAG
## High School
Look at your beautiful project, all grown up, about to go to prom. At this stage, your project is learning things fast, and is looking to figure out ways to work smarter not harder 
(so it can spend more time at 7/11 with their friends)

### Features
  - Sources 
    - [Freshness](https://docs.getdbt.com/reference/commands/source)
  - [Packages](https://docs.getdbt.com/docs/building-a-dbt-project/package-management)
  - Materializations 
    - [Incremental](https://docs.getdbt.com/docs/building-a-dbt-project/building-models/configuring-incremental-models)
    - [Ephemeral](https://docs.getdbt.com/docs/building-a-dbt-project/building-models/materializations#ephemeral)
  - Documentation
    - column-level docs for key metrics/critical columns (TODO)
  - [Macros](https://docs.getdbt.com/docs/building-a-dbt-project/jinja-macros#macros)
    - In-model SQL simplification
  - Custom Data Tests (TODO)
  - Custom Deployments (specific jobs)

### Relevant Commands
  - `dbt deps`
  - `dbt compile`
  - `dbt source freshness`
  - `dbt run`
  - `dbt test`
  - `dbt build`
  - `dbt docs generate`
  - `dbt docs serve`

### DAG
## College and Beyond

### Features
  - Macros 
    - [Operations](https://docs.getdbt.com/docs/building-a-dbt-project/hooks-operations#operations) for object management
  - [Selectors](https://docs.getdbt.com/reference/node-selection/yaml-selectors)/[Tags](https://docs.getdbt.com/reference/resource-configs/tags)
  - Custom [Schema](https://docs.getdbt.com/docs/building-a-dbt-project/building-models/using-custom-schemas)/[Database](https://docs.getdbt.com/docs/building-a-dbt-project/building-models/using-custom-databases) Behavior
  - [Custom Generalized Test](https://docs.getdbt.com/docs/building-a-dbt-project/tests#generic-tests)
  - [Hooks & Operations](https://docs.getdbt.com/docs/building-a-dbt-project/hooks-operations)
  - [Exposures](https://docs.getdbt.com/docs/building-a-dbt-project/exposures)
    - For dbt Cloud users: [unlocks status tiles](https://docs.getdbt.com/docs/dbt-cloud/using-dbt-cloud/cloud-dashboard-status-tiles)  
  
### Relevant Commands
  - `dbt deps`
  - `dbt compile`
  - `dbt source freshness`
  - `dbt run`
  - `dbt test`
  - `dbt build`
  - `dbt run-operation`
  - `dbt docs generate`
  - `dbt docs serve`

### DAG

## These things may be PhD level!
  - Introspective Analyses on dbt-produced artifacts
    - if Cloud: [Metadata API](https://docs.getdbt.com/docs/dbt-cloud/dbt-cloud-api/metadata/metadata-overview)
    - if Core: [dbt-artifacts package](https://www.google.com/search?q=dbt+artifacts&rlz=1C5CHFA_enUS926US926&oq=dbt+artifacts&aqs=chrome.0.0i512l2j69i57j69i61l2.1811j0j7&sourceid=chrome&ie=UTF-8)
    - Project Health Metrics
      - Test Coverage
      - Model Runtimes
## Omitted Features

Some features are not included in this project, not because they are unimportant, but because they generally are only used as-needed when the specifics of your data/project call for it. 

- Snapshots
- Seeds (although the raw data project has a good example!)
- Variables/Environment Variables
- Analyses
