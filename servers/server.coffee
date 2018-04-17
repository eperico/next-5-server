bodyParser    = require 'body-parser'
config        = require 'config'
cookieParser  = require 'cookie-parser'
express       = require 'express'
moment        = require 'moment-timezone'
logger        = require '../helpers/logger'


process.env.TZ = 'Australia/Sydney'
moment.tz.setDefault process.env.TZ


init = ({ root, root_path }) ->
  global.__root_path = root_path

  app  = express()

  # Log correctly uncaught exception
  process.on 'uncaughtException', (er) ->
    if er?.stack?
      logger.error(moment().format("DD/MM/YYYY - HH:MM:SS"))
      logger.error(er.stack)
    else if er?
      logger.error(moment().format("DD/MM/YYYY - HH:MM:SS"))
      logger.error(er)

  process.on 'SIGINT', -> process.exit()

  app.use cookieParser()
  app.use bodyParser.urlencoded({ limit: '500mb', extended: true })
  app.use bodyParser.json()

  app.locals.config        = require 'config'
  app.locals.moment        = require 'moment'
  app.locals._             = require 'underscore'

  # enable CORS
  app.all '*', (req, res, next) ->
    origins = if config?.api?.allowed_domain? then config.api.allowed_domain else "*"
    # logger.info "allow-origin", origins
    res.header "Access-Control-Allow-Origin", origins
    res.header "Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, PATCH, DELETE, OPTIONS"
    res.header "Access-Control-Allow-Headers", "X-Requested-With,content-type,Authorization"
    res.header "Access-Control-Allow-Credentials", true

    res.locals.sessionID = req.sessionID
    if req.method is 'OPTIONS' then return res.sendStatus 200
    next()

  app = (require "#{root_path}/../routers/#{root}").applyTo app

  port = config.web[root].port
  app.listen port
  logger.info "Server fork started on port #{port}, #{new Date()}"
  app

module.exports = {
  init
}
