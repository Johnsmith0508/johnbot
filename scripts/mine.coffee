data = uName = msg = outmsg  = null
errState = false
	
module.exports = (robot) ->
	robot.router.post '/hubot/web/sendMsg', (req, res) ->
		robot.send "hai"
		data   = if req.body.payload? then JSON.parse req.body.payload else req.body
		msg = data.message
		name = data.name
		robot.send "#{name}: #{msg}"
		res.send "#{name} : #{msg}"
		
	robot.router.get '/hubot/web/(.*)', (req, res) ->
		robot.send req.match[1]
		res.send req.match[1]
	
	robot.hear /(.*)/i  , (msg) ->
		outmsg = JSON.stringify({
			'message' : "#{msg.match[1]}"
			})
		robot.http("http://logan.waldman.ro/webBot.php")
		.post(outmsg) (err, res, body) ->
			if err and not errState
				msg.send "could not send message #{err}"
				errState = true
				return
	
	robot.respond /(who do i | who to)? blame/i
		