# React Docker Template

This template helps you create new React apps using Docker.

## Create the app with Vite in the current directory

``` bash
docker-compose --profile create up
```

## Start development environment (Vite with Hot Module Replacement)

``` bash
docker-compose --profile dev up --build
```

## Start production environment (build and Nginx)

``` bash
docker-compose --profile build up --build
```

## Environment

You should create a `.env` file to configure this app and its creation process. There is an `.example-env` file to help you understand what you need.
