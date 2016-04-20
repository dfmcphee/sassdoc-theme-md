{% set title_displayed = false %}
{% for usedBy in item.usedBy %}
{% if (display.access.indexOf(usedBy.access) != -1) %}
{% if not (not display.alias and usedBy.alias) %}
{% if not title_displayed %}
{% set title_displayed = true %}

{{ "Used By"|subsubsection_heading }}

{% endif %}
* [{{ usedBy.context.type }}] `{{ usedBy.context.name }}`
{% endif %}
{% endif %}
{% endfor %}