# Description:
#   enter and leave replies
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot commands - see hubot help



module.exports = (robot) ->
	robot.enter (msg) ->
		msg.send msg.random enterReplies

	enterReplies = ['Hi', 'Target Acquired', 'Firing', 'Hello friend.', 'Gotcha', 'I see you']
	leaveReplies = ['Are you still there?', 'Target lost', 'Searching']
	
	robot.leave (msg) ->
		msg.send msg.random leaveReplies
	robot.respond /commands/i (msg) ->
		msg.reply "did you mean help?"
