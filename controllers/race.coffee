logger  = require '../helpers/logger'
request = require 'request'
config = require 'config'


get_all = (params, done) ->
  maxRaces = params.maxRaces || 10
  url = "#{config.web.api.fetch_races_url}&maxRaces=#{maxRaces}"
  request(url, (error, response, body) =>
    return done(error) if error?
    done null, body
  )

get_by_id = ({ id }, done) ->
  logger.info "get race with id", id
  done null, { title: 'Race2', description: 'description race 2'}


module.exports = {
  get_all
  get_by_id
}
