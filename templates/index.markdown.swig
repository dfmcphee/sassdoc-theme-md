{% filter parse_block %}
{{ data.currentGroupName|section_heading }}

{% for type, items in data.currentGroup %}
{% for item in items %}
{% include 'partials/item.markdown.swig' %}
{% endfor %}
{% endfor %}
{% endfilter %}