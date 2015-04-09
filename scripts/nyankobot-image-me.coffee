# Description:
#   画像検索用スクリプト for nyanko-bot
#
# Commands:
#   jpi <query> - Google Imagesから <query> で検索して返ってきた結果から, ランダムに1つURLを返す
#
# cf:
#   hubot-google-images

module.exports = (robot) ->
  robot.hear /^(jpi)? (.*)/i, (msg) ->
    imageMe msg, msg.match[2], (url) ->
      msg.send url

imageMe = (msg, query, callback) ->
  q = v: '1.0', rez: '8', q: query, safe: 'active'
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
        image = msg.random images
        callback ensureImageExtension image.unescapedUrl

ensureImageExtension = (url) ->
  ext = url.split('.').pop()
  if /(png|jpe?g|gif)/i.test(ext)
    url
  else
    "#{url}#.png"
