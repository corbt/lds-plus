// Generated by CoffeeScript 1.6.2
(function() {
  chrome.runtime.onMessage.addListener(function(request, sender, sendResponse) {
    return chrome.tabs.insertCSS(sender.tab.id, request);
  });

}).call(this);
