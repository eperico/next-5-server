# next-5-server

Server that provides an API for the Next 5 Web App, based on node, express and coffee-script.

The API provides an endpoint to get the next 5 races opened for betting.
It fetches the data from [Tabcorp API](https://studio.tab.com.au/intro).


## How to setup and run the project
- git clone [next-5-server](git@github.com:eperico/next-5-server.git)
- cd `your_working_folder`
- Install node modules, node v8.10.0 and npm v5.8.0 are currently used:
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
- presenters:  the code that formats the data for the client
- routers:     the URL definitions + the handlers that connect the route to the presenters

## Endpoints

`/races`

Returns the next races opened for betting.
- optional parameter: 
maxRaces (default is 10): define the number of races to return for each type (eg: /races?maxRaces=5)

`/races/:raceName`

Returns the information about a race.
The runners for a race are generated randomly on the server.
- Example: /races/DM%20PLUMBING%20PACE%20MS
