config        = require 'config'
request       = require 'request'
generateName  = require 'sillyname'
logger        = require '../helpers/logger'

random_number = (min, max) => parseInt(Math.random() * (max - min) + min)

generate_runners = () =>
  # Each Race has at least 4 Competitors
  nbRunners = random_number(4, 10)
  runners = []
  runners.push { position: i+1, name: generateName() } for i in [0..nbRunners]
  return runners

get_all = (params, done) ->
  maxRaces = params.maxRaces || 10
  url = "#{config.web.api.fetch_races_url}&maxRaces=#{maxRaces}"
  request(url, (error, response, body) =>
    return done(error) if error?
    done null, body
  )

get_by_name = (name, done) ->
  logger.info "get race with name", name
  get_all {}, (err, res) =>
    return done(err) if err
    data = JSON.parse(res)
    race = data.races.find (r) => r.raceName == name
    return done new Error('Unable to find race') unless race
    race.runners = generate_runners()
    done null, { race }


module.exports = {
  get_all
  get_by_name
}
