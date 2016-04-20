{% if item.property.length > 0 %}
{{ "Map Structure"|subsubsection_heading }}

{{ item.property|output_parameters }}

{% endif %}