race_controller = require '../../controllers/race'


get_race_list = (params, done) ->
  { name } = params
  if params.name?
    race_controller.get_by_name name, done
  else
    race_controller.get_all params, done


module.exports = {
  get_race_list
}
