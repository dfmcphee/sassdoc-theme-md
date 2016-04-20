{% if item.description %}
{{ "Description"|subsubsection_heading }}

{{ item.description|safe }}

{% endif %}