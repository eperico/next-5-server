bf               = require '../helpers/barefoot'
router_helper    = require './helper'
race_presenter   = require '../presenters/api/race'

default_routes =
  get:
    "/":                (req, res) -> res.send "Running Node Server Starter API"

race_routes =
  get:
    "/races/:name?":    bf.webService race_presenter.get_race_list

route_definitions = [
  default_routes
  race_routes
]


module.exports = {
  applyTo: router_helper.applyTo(route_definitions)
}
