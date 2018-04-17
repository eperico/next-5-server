# next-5-server
Server that provides API for Next 5 Web App, based on node, express and coffee-script


## How to setup and run the project
- git clone [next-5-server](git@github.com:eperico/next-5-server.git)
- cd `your_working_folder`
- Install node modules, node 8.10.0 is currently used:
`npm install`
- Install coffeescript globally to execute .coffee files anywhere:
`npm install --global coffeescript`
- run the API
```
coffee servers/api.coffee
```
- The server is running on port 3000:
http://localhost:3000


## Project structure
- config:      the configuration for the different platforms
- controllers: the business logic code
- models:      the schema definitions for the DB models
- presenters:  the code that formats the data for the client
- routers:     the URL definitions + the handlers that connect the route to the presenters
