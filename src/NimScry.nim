# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.
import os, json
import strutils
import scryfall

proc main() =
  if isMainModule :
    if paramCount() == 0 :
      system.programResult = 1
      echo "ファイルを指定してください"
      sleep(2000)
      return
      
  let listFilePath = $os.commandLineParams()[0]
  let listFile = open(listFilePath ,FileMode.fmRead)
  var result : string

  try:
    while not listFile.endOfFile:
      let taintedLine = listFile.readLine
      var line = taintedLine.string
      line.delete(0, 1)

      let card = getCard(line.replace(" ", "-"))
      sleep(100)

      let jpCard = getJPCard(card["set"].getStr, card["collector_number"].getStr)

      if jpCard["object"].getStr == "nil":
        downloadImage(card["image_uris"]["png"].getStr, card["name"].getStr & ".png")
        let msg = card["name"].getStr & " → " & "Downloaded. (en)"
        echo msg
        result = result.join(msg & "\n")
      else:
        downloadImage(jpCard["image_uris"]["png"].getStr, jpCard["printed_name"].getStr & ".png")
        let msg = jpCard["printed_name"].getStr & " → " & "Downloaded. (ja)"
        echo msg
        result = result & msg & "\n"

      sleep(100)
      
  finally:
    close(listFile)

  block:
    let resultFile = open("result.txt" ,FileMode.fmWrite)
    defer :
      close(resultFile)
    resultFile.write(result)
  
  echo "Download has completed. Please check result.txt"
  sleep(3000)

main()