race_controller = require '../../controllers/race'


get_race_list = (params, done) ->
  { id } = params
  if params.id?
    race_controller.get_by_id {id}, done
  else
    race_controller.get_all params, done


module.exports = {
  get_race_list
}
