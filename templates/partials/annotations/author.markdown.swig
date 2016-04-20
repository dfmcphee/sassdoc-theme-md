{% if item.author.length > 0 %}
{{ "Author"|subsubsection_heading }}

{% for author in item.author %}
* {{ author|safe }}
{% endfor %}

{% endif %}