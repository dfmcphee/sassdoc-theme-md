{% if item.see.length > 0 %}
{% if (display.access.indexOf(see.access) != -1) and display.alias %}
{{ "See"|subsubsection_heading }}

{% for see in item.see %}
* [{{ see.context.type }}] `{{ see.context.name }}`
{% endfor %}

{% endif %}
{% endif %}