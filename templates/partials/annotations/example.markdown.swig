{% if item.example.length > 0 %}
{{ "Example"|subsubsection_heading }}

{% for example in item.example %}
{% if example.description %}
{{ example.description|safe }}

{% endif %}
```scss
{% filter parse_code %}
{{ example.code|escape|safe }}
{% endfilter %}
```
{% endfor %}
{% endif %}