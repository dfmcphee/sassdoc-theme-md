{% if item.todo.length > 0 %}
{{ "TODOs"|subsubsection_heading }}

{% for todo in item.todo %}
* {{ todo|safe }}
{% endfor %}

{% endif %}