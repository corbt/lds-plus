class Scriptures
	constructor: ->
		@bar = $('.filed-under')
		chrome.runtime.sendMessage {file: "stylesheets/scriptures.css"}, (response) ->
			console.log response

		@bind()

	bind: ->
		@bind_shortcuts()

	bind_shortcuts: ->
		$('body').on "keypress", "input, textarea", (e) ->
			e.stopPropagation()

		$(document).keypress (e) =>
			e.preventDefault()
			switch e.keyCode
				when 47 then console.log "/" # "/"
				when 58 then @seek_verse() # ":"

	seek_verse: ->
		li = $('<li>').addClass('ldsp').addClass('verse')
		verse = $('<input>')
		@bar.append li.append(verse.focus())

$ ->
	if $('.filed-under').length > 0
		console.log "loaded"
		new Scriptures
