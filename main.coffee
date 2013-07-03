
@injectStylesheet = (css) ->
  style = $ '<style type="text/css"></style>'
  style.html(css)
  style.appendTo 'head'
  return style

@toggleLabels = =>
  el = $('style#hideLabels')
  if el.length > 0
    el.remove()
  else
    el = @injectStylesheet '.story header .name .label { display: none; }'
    el.attr('id', 'hideLabels')


@injectStylesheet '''
      /* First, effectively hide all text node siblings of the story names (commas between tags and parentheses around initials) */
      .story header .name {
        font-size: 0;
        color: transparent;
        line-height: 1.5;
      }
      /* then repair the colors and sizes, and put those characters back but using :before/:after so they can be hidden */
      .story header .name .story_name {
        color: black;
        font-size: 12px;
        }
      .story header .name .owner {
        font-size: 12px;
        }
      .story header .name .owner:before { content: ' ('; }
      .story header .name .owner:after { content: ')'; }
      .story header .name .label:after { content: ', '; }
      '''

$(document).keypress (evt) =>
  @toggleLabels() if evt.which is 108 # 'l'

