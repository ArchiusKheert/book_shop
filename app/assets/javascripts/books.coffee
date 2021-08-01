$(document).ready 'turbolinks:load', ->
  content = $('p.lead.small.line-height-2').html()
  $('p.lead.small.line-height-2').each ->
    if content.length > 470
      shortContent = content.substr(0, 470) + "..."
      $(this).html shortContent + "<a class='in-gold-500 ml-10' id='read_more' href=''>Read More<a/>"

  $('#read_more').click ->
    $('p.lead.small.line-height-2').each ->
      $(this).html content
      $('#read_more').hide()
    false

