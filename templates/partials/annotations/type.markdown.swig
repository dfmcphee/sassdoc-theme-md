{% if item.type %}
{{ "Type"|subsubsection_heading }}

{% if item.type == "*" %}
Any
{% else %}
`{{ item.type }}`
{% endif %}

{% endif %}