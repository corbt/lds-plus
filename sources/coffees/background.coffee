chrome.runtime.onMessage.addListener (request, sender, sendResponse) ->
	chrome.tabs.insertCSS sender.tab.id, request