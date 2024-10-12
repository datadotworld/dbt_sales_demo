# this can be used to run the dbt project in dbt core, locally

# to use:

# docker build -t dbt_sales_demo .
# docker run -it --rm -e DBT_SNOWFLAKE_ACCOUNT=[acct] -e DBT_SNOWFLAKE_USERNAME=[user] -e DBT_SNOWFLAKE_WAREHOUSE=[warehouse] -e DBT_SNOWFLAKE_DATABASE=[database] -e DBT_SNOWFLAKE_PASSWORD=[pwd]  dbt_sales_demo

FROM python:3.9.13

RUN pip install --upgrade pip && pip install pytz==2022.7.1 && pip install dbt-snowflake==1.8.0

RUN mkdir -p /root/.dbt
COPY profiles.yml /root/.dbt/

RUN mkdir -p /dbt_sales_demo

COPY dbt_project.yml /dbt_sales_demo
COPY models /dbt_sales_demo/models

WORKDIR /dbt_sales_demo
ENTRYPOINT [ "bash" ]

