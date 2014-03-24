scripts = ['scripture_shortcuts']

for script in scripts
  s = document.createElement('script')
  s.src = chrome.extension.getURL('javascripts/'+script+'.js')
  (document.head||document.documentElement).appendChild(s)
  s.onload = ->
      s.parentNode.removeChild(s)
