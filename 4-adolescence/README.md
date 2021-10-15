Welcome to the Claim to Fame dbt project!

### Setting up your computer

[Here's a link to setting up dbt on the command line!](https://docs.getdbt.com/dbt-cli/installation)

### Set up your development profile

```yml
claim-to-fame:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: thebestdataaccount
      user: <your snowflake username>
      role: TRANSFORMER
      authenticator: externalbrowser
      database: ANALYTICS
      warehouse: TRANSFORMING
      schema: <your dev schema>
      threads: 8
      client_session_keep_alive: False
```

### Running dbt for the first time:
1. run `dbt deps` to build package dependencies
1. run `dbt seed` to build seeds as tables in dev schema
1. run `dbt run` to build models as tables and views in your dev schema

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices