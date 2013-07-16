#= require mustache
#= require jquery


page_id = null
template = null
last_update = {}
apply_template = (data) ->
    template ||= $("body").html()
    rendered_text = Mustache.render(template, data)
    $("body").html rendered_text

fetch_json = ->
  url = "http://landingpagejs.herokuapp.com/landing_pages/#{page_id}.json"
  # url = "http://localhost:3000/landing_pages/#{page_id}.json"
  $.ajax(
    url: url
    context: document.body
    dataType: "jsonp"
  ).done((data) ->
    change = JSON.stringify( data ) !=  JSON.stringify(last_update)
    
    if( change )
      apply_template data
    
    setTimeout fetch_json, 2000
    last_update = data
  ).fail((jqXHR, textStatus) ->
    alert "error #{textStatus}"
  )

main = ->
  landing_page_view = null
  url = document.location.toString()
  key = "landing_page_id="
  pos = url.indexOf(key)
  length = url.length
  if pos > 0
    page_id = url.substring(pos + key.length, length)
      
    fetch_json()

  else
    page_id = "default"
    fetch_json()

jQuery ->
	main()