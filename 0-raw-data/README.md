## Stage Description

This project contains some mock data used in these projects! Technically the very first step of any dbt project is loading raw data into your warehouse. 

## Usage

Point your profile at a raw database in your warehouse, and run `dbt seed` to load them in as tables. The seed configurations in the `dbt_project.yml` file will point them to the schemas that match the source configurations in the subsequent projects, but you'll need to make sure the source database configurations match the database you use to materialize these seeds! 