{% set title_displayed = false %}
{% for require in item.require %}

{% if (display.access.indexOf(require.item.access) != -1) %}
{% if not (not display.alias and require.item.alias) or require.external %}

{% if not title_displayed %}
{% set title_displayed = true %}
{{ "Requires"|subsubsection_heading }}
{% endif %}

{% if require.external %}
{% if require.url %}
* [external] `[{{ require.name }}]({{ require.url }})` {{ require.description }}
{% else %}
* `{{ require.name }}` {{ require.description }}
{% endif %}
{% else %}
* [{{ require.item.context.type }}] `{{ require.item.context.name }}` {{ require.description }}
{% endif %}
{% endif %}
{% endif %}

{% endfor %}