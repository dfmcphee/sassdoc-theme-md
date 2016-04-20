{% if item.since.length > 1 %}
{{ "Changelog"|subsubsection_heading }}

{% for since in item.since %}
* {{ since.version }}{% if since.description %} — {{ since.description|safe }}{% endif %}
{% endfor %}

{% endif %}