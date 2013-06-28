#= require jquery
#= require mustache
landing_page_view = null
$("document").ready ->
  url = document.location.toString()
  key = "landing_page_id="
  pos = url.indexOf(key)
  length = url.length
  alert document.location
  if pos > 0
    page_id = url.substring(pos + key.length, length)
    
    $.ajax(
      url: "http://localhost:3000/landing_pages/#{page_id}"
      context: document.body
      dataType: "jsonp"
    ).done((data) ->
      console.log body = $("body").html()
      rendered_text = Mustache.render(body, data)
      $("body").html rendered_text
    ).fail (jqXHR, textStatus) ->
      alert "error #{textStatus}"

  else
    alert "No landing_page_id provided"
