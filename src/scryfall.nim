import httpClient, json

let client = newHttpClient()
client.headers = newHttpHeaders({ "Content-Type": "application/json" })

proc getScryfall*(url: string): JsonNode =
  var response: string
  try:
    response = client.getContent(url)
  except HttpRequestError:
    response = """{"object": "nil"}"""

  return response.parseJson

proc getCard*(name: string): JsonNode =
  let url = "https://api.scryfall.com/cards/named?exact=" & name
  return getScryfall(url)

proc getJPCard*(code: string, number: string): JsonNode =
  let url = "https://api.scryfall.com/cards/" & code & "/" & number & "/ja"
  return getScryfall(url)

proc downloadImage*(url: string, fileName: string): void =
  client.downloadFile(url, fileName)