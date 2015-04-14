# Description
#   寿司を握ってくれるスクリプト, たまに自分で食べちゃう
#
# Configuration:
#   None
#
# Commands:
#   nyankobot 寿司
#
# Author:
#   saxsir <saxsir.256@gmail.com>

module.exports = (robot) ->
  robot.respond /マグロ/, (msg) ->
    msg.reply "あいよ っ :sushi:"
