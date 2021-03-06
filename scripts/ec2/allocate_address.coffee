# Description:
#   Create a new elastic IP
#
# Commands:
#   hubot ec2 allocate address

module.exports = (robot) ->
  robot.respond /ec2 allocate address$/i, (msg) ->
    aws = require('../../aws').aws()
    ec2 = new aws.EC2()
    ec2.allocateAddress {}, (err, response) ->
      if err
        msg.send err
      else
        keys = Object.keys(response)
        row = ""
        for key in keys
          row += response[key] + " | "

        msg.send keys.join(" | ")
        msg.send row
