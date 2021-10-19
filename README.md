# Building a Mature dbt Project from Scratch

![image](https://user-images.githubusercontent.com/73915542/137219625-69b476b7-0db8-40ec-bae4-cd1fa1c9d498.png)

Hello! This is the companion repo to the 2021 Coalesce Talk - [Building a Mature dbt Project from Scratch](https://coalesce.getdbt.com/talks/how-to-build-a-mature-dbt-project-from-scratch/)

# Introduction

With the explosion in popularity of dbt, and the coinciding explosion in features and capabilities in the tool, it's natural for many of us to find ourselves unsure of where to start. Many people come across dbt through a recommendation of a particularly powerful feature that dbt can support, like complex macros or intricate incremental model logic, but it's both intimidating and unwise to dive directly into the deep end. Like with any tool, it's best to walk before you run, and learn how these features both complement and build on each other so you can be confident you've developed a strong, sustainable, and scalable dbt project.


### Purpose of this Repo

The goal of this repository is to show a single dbt project at different lifecycle stages, showing opinionated view of when to introduce certain dbt features into your project. Each stage has a particular theme/purpose, and the listed feature sets connect to that learning goal. This is intended to be both a resource for new dbt users to use as a jumping off point for starting a new project from scratch, and a rubric for existing dbt users to peg their own use of dbt features against this model to find opportunities for growth.

In each stage listed below (and in the accompanying talk), you'll see: 
1. A theme/purpose for the life stage
2. Features relevant to the stage (with links to the relevant dbt docs)
3. A picture of the DAG of the exmaple project in that stage
4. Links to slack channels on the [dbt Community Slack](https://www.getdbt.com/community/) that would be of interest! 

### Some caveats and assumptions:
- There are real life use cases where some features get introduced into projects out of the order described here, and that is perfectly reasonable. There are often very justifiable reasons to introduce more advanced dbt features earlier in the development cycle.
- There is no sense of timescale in this presentation! Some teams may mature their project in weeks rather than months, depending on a wide range of factors. It's more important to think about **how** features build upon themselves (and each other) rather than **how quickly** they do so.
- This presentation assumes familiary and comfortability with git and version control, and that all of the projects are already managed in a repository


# Projects

Each project is built on a mock data set of patients, doctors, claims, and other billing data. It was generated via the [Mockaroo API](https://www.mockaroo.com/docs). Huge hat-tip to @krevitt for building a sweet G-sheet x Mockaroo integration! In the `0-raw-data` project, you can find the sample dataset this was built from, so you can load them into your warehouse and run each project to get a feel for how the functionality works!

## Infancy
Congratulations! It's (sorta!) a DAG!!

This project represents truly the bare minimum needed to have dbt do anything of use. It's really only *technically* a dbt project, but is going to need a lot of hand holding to do anything useful and keep it alive. 

### Theme: :baby_bottle: Bare Necessities :safety_pin:

### Features
  - [Models](https://docs.getdbt.com/docs/building-a-dbt-project/building-models)
  - [Commands](https://docs.getdbt.com/reference/dbt-commands)

### Relevant Commands
  - `dbt seed`
  - `dbt run`
### DAG
![image](https://user-images.githubusercontent.com/73915542/137508312-c2ca44ff-ed72-4195-a27e-b60aad0917ec.png)

### Relevant Community Slack Channels
- `#advice-dbt-for-beginners`

## Toddlerhood
This project is just starting to play with its blocks, and see how the world fits together. It can now handle multiple models, and it's able to see the difference between raw and transformed data. 

### Theme: :green_square: Building Blocks :blue_square:

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
  - `dbt seed`
  - `dbt run`
  - `dbt test`
  - `dbt docs generate`
  - `dbt docs serve`

### DAG
![image](https://user-images.githubusercontent.com/73915542/137508486-c2bf7a8d-3380-4971-b536-3e6e12bdc17e.png)

### Relevant Community Slack Channels
- `#advice-dbt-for-beginners`
- `#advice-data-testing`
## Childhood 
Now we're starting to let our project free into the world. Time to set some ground rules!
You wouldn't send your project to school without a list of allergies, so it's time to let people know how they should be interacting with your project

### Theme: :building_construction: Structure and Rules :straight_ruler:

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
  - `dbt seed`
  - `dbt run`
  - `dbt test`
  - `dbt build`
  - `dbt docs generate`
  - `dbt docs serve`

### Relevant Community Slack Channels
- `#advice-dbt-for-beginners`
- `#advice-data-testing`
- `#advice-data-modeling`

### DAG
![image](https://user-images.githubusercontent.com/73915542/137508810-c3c1aa19-4e8a-417a-8c04-67b048878d15.png)


## Adolescence
Look at your beautiful project, all grown up, about to go to prom. At this stage, your project is learning things fast, and is looking to figure out ways to work smarter not harder 
(so it can spend more time at 7/11 with their friends)

### Theme: :weightlifter: Growth and Optimization :rocket:

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
  - `dbt seed`
  - `dbt run`
  - `dbt test`
  - `dbt build`
  - `dbt docs generate`
  - `dbt docs serve`

### DAG
![image](https://user-images.githubusercontent.com/73915542/137508810-c3c1aa19-4e8a-417a-8c04-67b048878d15.png)

### Relevant Community Slack Channels
- `#advice-dbt-for-beginners`
- `#advice-data-testing`
- `#advice-data-modeling`
- `#advice-dbt-for-power-users`
- Relevant tool specific channels (i.e. `#tools-looker`, `#tools-meltano`)

## Adulthood
By the time your project reaches adulthood, the basics of dbt should be humming along just fine, and that should buy it time to think back on its life, look inward, and fingure out how it fits into the world. How has your project grown and changed? How does it relate to the world around it?  

### Theme: :notebook: Self Reflection :microscope:
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
  - `dbt seed`
  - `dbt run`
  - `dbt test`
  - `dbt build`
  - `dbt run-operation`
  - `dbt docs generate`
  - `dbt docs serve`

### DAG
![image](https://user-images.githubusercontent.com/73915542/137510268-dd2f042d-c31a-41cd-83a3-254a8a04dccc.png)

### Relevant Community Slack Channels
- `#advice-dbt-for-beginners`
- `#advice-data-testing`
- `#advice-data-modeling`
- `#advice-dbt-for-power-users`
- Relevant tool specific channels (i.e. `#tools-looker`, `#tools-meltano`, `#db-snowflake`)
- `#towards-analytics-engineering`
- `#metadata`


## These things are advanced level (middle aged?)!
  - Introspective Analyses on dbt-produced artifacts
    - if Cloud: [Metadata API](https://docs.getdbt.com/docs/dbt-cloud/dbt-cloud-api/metadata/metadata-overview)
    - if Core: [dbt-artifacts package](https://www.google.com/search?q=dbt+artifacts&rlz=1C5CHFA_enUS926US926&oq=dbt+artifacts&aqs=chrome.0.0i512l2j69i57j69i61l2.1811j0j7&sourceid=chrome&ie=UTF-8)
    - Project Health Metrics
      - Test Coverage
      - Model Runtimes
## Omitted Features

Some features are not included in this project, not because they are unimportant, but because they generally are only used as-needed when the specifics of your data/project call for it. 

- [Snapshots](https://docs.getdbt.com/docs/building-a-dbt-project/snapshots)
- [Seeds](https://docs.getdbt.com/docs/building-a-dbt-project/seeds) (although the raw data project has a good example!)
- [Variables](https://docs.getdbt.com/docs/building-a-dbt-project/building-models/using-variables)/[Environment Variables](https://docs.getdbt.com/docs/dbt-cloud/using-dbt-cloud/cloud-environment-variables)
- [Analyses](https://docs.getdbt.com/docs/building-a-dbt-project/analyses)
