{% set title_displayed = false %}
{% for see in item.see %}

{% if (display.access.indexOf(see.access) != -1) %}
{% if not (not display.alias and see.alias) %}
{% if not title_displayed %}
{% set title_displayed = true %}
{{ "See"|subsubsection_heading }}
{% endif %}
{% endif %}

* [{{ see.context.type }}] `{{ see.context.name }}`
{% endif %}

{% endfor %}