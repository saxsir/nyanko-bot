# Description
#   引数からランダムに1つ選んでくれるスクリプト
#
# Configuration:
#   None
#
# Commands:
#   nyankobot 選んで <item1> <item2> <item3> - choose at random
#
# Author:
#   saxsir <saxsir.256@gmail.com>

module.exports = (robot) ->
  robot.respond /選んで (.*)/, (msg) ->
    items = msg.match[1].split(/\s/)
    item = msg.random items
    msg.reply "#{item} を選んでやったぞ"
