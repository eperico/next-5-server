logger  = require '../helpers/logger'

get_all = (params, done) ->
  logger.info "get all races"
  list = [
    { title: 'Race1', description: 'description race 1'}
    { title: 'Race2', description: 'description race 2'}
    { title: 'Race3', description: 'description race 3'}
  ]
  done null, list


get_by_id = ({ id }, done) ->
  logger.info "get race with id", id
  done null, { title: 'Race2', description: 'description race 2'}


module.exports = {
  get_all
  get_by_id
}
