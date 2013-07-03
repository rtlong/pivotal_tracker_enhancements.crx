// Generated by CoffeeScript 1.6.3
var _this = this;

this.injectStylesheet = function(css) {
  var style;
  style = $('<style type="text/css"></style>');
  style.html(css);
  style.appendTo('head');
  return style;
};

this.toggleLabels = function() {
  var el;
  el = $('style#hideLabels');
  if (el.length > 0) {
    return el.remove();
  } else {
    el = _this.injectStylesheet('.story header .name .label { display: none; }');
    return el.attr('id', 'hideLabels');
  }
};

this.injectStylesheet('/* First, effectively hide all text node siblings of the story names (commas between tags and parentheses around initials) */\n.story header .name {\n  font-size: 0;\n  color: transparent;\n  line-height: 1.5;\n}\n/* then repair the colors and sizes, and put those characters back but using :before/:after so they can be hidden */\n.story header .name .story_name {\n  color: black;\n  font-size: 12px;\n  }\n.story header .name .owner {\n  font-size: 12px;\n  }\n.story header .name .owner:before { content: \' (\'; }\n.story header .name .owner:after { content: \')\'; }\n.story header .name .label:after { content: \', \'; }');

$(document).keypress(function(evt) {
  if (evt.which === 108) {
    return _this.toggleLabels();
  }
});
