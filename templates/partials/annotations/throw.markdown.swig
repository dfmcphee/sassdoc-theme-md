{% if item.throw.length > 0 %}
{{ "Throws"|subsubsection_heading }}

{% for _throw in item.throw %}
* {{ _throw|safe }}
{% endfor %}

{% endif %}