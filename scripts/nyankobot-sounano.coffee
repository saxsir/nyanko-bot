# Description:
#   nyanko-botのセリフを書いたスクリプト
#
# Commands:
#   特定の単語に反応して何か言う, かもしれない
#
module.exports = (robot) ->
  robot.hear /(にゃんこ)|(ニャンコ)/, (msg) ->
    msg.send "私は#{msg.message}ではない！"

  robot.hear /(いい話)|(良い話)|(いいはなし)|(良いはなし)/, (msg) ->
    key = "e-talk"
    count = robot.brain.get(key) ? 0
    count += 1
    robot.brain.set(key, count)
    if count % 10 == 0
      msg.send "全世界のいい話が#{count}件を突破したにゃ！"
