class Scriptures
	constructor: ->
		@bars = $('.filed-under')
		@static_bar = $(@bars[1])
		@dynamic_bar = $(@bars[0])
		@bind()
		$('.studyNoteMarker').hide()

	bind: ->
		@bind_shortcuts()
		@bind_updates()

	bind_shortcuts: ->
		$('body').on "keypress", "input, textarea, [contenteditable]", (e) ->
			e.stopPropagation()

		$(document).keypress (e) =>
			e.preventDefault()
			console.log e.keyCode
			switch e.keyCode
				when 47 then console.log "/" # "/"
				when 58 then @seek_verse() # ":"
				when 107
					window.location=$('li.prev').children().first().attr("href")
				when 106
					window.location=$('li.next').children().first().attr("href")
				when 48
					console.log "hiding"
					$('#toggle-study-tools-bar,#toggle-context-bar').click()

	bind_updates: ->
		@static_bar.on "keyup", (e) =>
			@dynamic_bar.html @static_bar.children().clone()

		@dynamic_bar.on "keyup", (e) =>
			@static_bar.html @dynamic_bar.children().clone()

	seek_verse: ->
		li = $('<li>').addClass('ldsp').addClass('verse')
		verse = $('<div>')
		verse.attr "contenteditable", "true"
		verse.addClass "bar_input"
		#verse.on "keyup", (e) =>
		#	@auto_size $(e.target)
		@bars.append li.append(verse)
		verse.focus()

	auto_size: (target) ->
		console.log "changed"
		target.css 'width', target.val().length*7+20

$ ->
	if $('.filed-under').length > 0
		new Scriptures
