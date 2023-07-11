# Welcome to My Api

The Volcano API is a RESTful API that provides information about volcanoes. It utilizes Redis for caching, Swagger for API documentation, and Google OAuth2 for authentication, and is deployed on AWS EC2 within Docker containers.

## DEPLOYMENT URL

- my-volcano-API URL:https://my-api-volcano.fly.dev/
- swagger documentation url:https://my-api-volcano.fly.dev/api-docs/index.html

## Task

Fetch volcano data from the Volcanoes API and provide a consistent and standardized interface for accessing volcano information.
Cache volcano data using Redis to improve performance and reduce the load on the Volcanoes API.
Secure endpoints using Google OAuth2 authentication to ensure only authorized users can access protected resources.
Comprehensive API documentation with Swagger to assist developers in understanding and utilizing the available endpoints.
Deployment on AWS EC2 within Docker containers for easy scalability and portability.

## Description

To access protected endpoints, users must authenticate using their Google accounts through the Google OAuth2 authentication process. The API verifies the user's identity and accordingly grants access to protected resources.

## Installation

Ruby version 3.2.2
Rails version 7.0.4.3
Redis
Docker
AWS EC2 instance

## Usage

git clone repo
bundle install
rails db:migrate
rails db:seed
rails server

* OR

* * https://my-api-volcano.fly.dev/
```
./my_project argument1 argument2
```

### The Core Team
Right Sophia Praise AKA Sophie.


<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px'></span>
