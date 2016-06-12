{{ "Source"|subsubsection_heading }}

```scss
{% filter parse_code %}
{% if item.context.type == "placeholder" %}
{{ item.context.code }}
{% elseif item.context.type == "variable" %}
${{ item.context.name }}: {{ item.context.value }}
{% else %}
@{{ item.context.type }} {{ item.context.name }}({{ item|output_arg }}) { {{ item.context.code | safe }}}
{% endif %}
{% endfilter %}
```
