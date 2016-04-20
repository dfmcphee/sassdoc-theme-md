{% if item.return %}
{{ "Returns"|subsubsection_heading }}

{% if item.return.type == '*' %}
Any type{% if item.return.description %} — {{ item.return.description|safe }}{% endif %}
{% else %}
`{{ item.return.type }}`{% if item.return.description %} — {{ item.return.description|safe }}{% endif %}
{% endif %}

{% endif %}