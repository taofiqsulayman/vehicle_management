# Vehicle Management Application

## Prerequisites

Make sure you have the following software installed on your machine:

- Ruby (version X.X.X)
- Ruby on Rails (version X.X.X)
- Bundler
- PostgreSQL
- NodeJS

## Project setup
Clone this repo to your local machine

cd into project directory and check your ruby version:

```
ruby -v
```

### Install the required gems using Bundler:
Using Bundle

``` bundle install ```


### Set up the PostgreSQL database:

```
rails db:create
rails db:migrate
```

### Start the Rails server:

```
rails server
```

### start the react project

```
cd vehicle_management_frontend
```

### install the dependencies and start the application

```
npm install && npm start
```

access your react app at http://localhost:3001

### Additional Configuration

Modify the database configuration in config/database.yml to match your PostgreSQL credentials.

### Customize configuration
See [Configuration Reference](https://guides.rubyonrails.org/).

## Credits
- Taofiq Sulayman [Sulaymantaofiq@gmail.com](mailto:sulaymantaofiq@gmail.com)
