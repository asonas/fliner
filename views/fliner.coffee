$(".file-input").live "change", () ->
  console.log "aaa"
  return unless @files.length
  @file = @files[0]
  fileReader = new FileReader()
  fileReader.readAsDataURL(@file)
  console.log @file.name

  fileReader.onload = (event) =>
    console.log "b"
    $.ajax
      type: "POST"
      url: "/save"
      data:
        file: event.target.result
        title: @file.name
      success: ->
      error: (a, b, c) ->
        console.log a, b, c

