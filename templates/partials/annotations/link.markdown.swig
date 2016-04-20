{% if item.link.length > 0 %}
{{ "Links"|subsubsection_heading }}

{% for link in item.link %}
{% if link.caption %}
[{{ link.caption }}]({{ link.url }}>)
{% else %}
[{{ link.url }}]({{ link.url }}>)
{% endif %}

{% endfor %}
{% endif %}