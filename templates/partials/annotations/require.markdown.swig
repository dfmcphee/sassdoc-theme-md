{% if item.require.length > 0 %}
{{ "Requires"|subsubsection_heading }}

{% for require in item.require %}
{% if (display.access.indexOf(require.item.access) != -1) and display.alias %}
{% if require.external %}
* `{{ require.name }}`
{% else %}
* `{{ require.item.context.name }}`
{% endif %}
{% endif %}
{% endfor %}

{% endif %}