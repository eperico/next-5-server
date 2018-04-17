logger  = require '../helpers/logger'
request = require 'request'
config  = require 'config'


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
    done null, race


module.exports = {
  get_all
  get_by_name
}
