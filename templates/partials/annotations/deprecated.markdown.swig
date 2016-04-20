{% if 'deprecated'|in(item) %}
**Deprecated!** {{ item.deprecated|safe }}

{% endif %}