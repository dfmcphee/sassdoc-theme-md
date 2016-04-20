{% include 'annotations/name.markdown.swig' %}
{% include 'annotations/since.markdown.swig' %}
{% include 'annotations/access.markdown.swig' %}
{% include 'annotations/deprecated.markdown.swig' %}
{% include 'annotations/preview.markdown.swig' %}
{% if not item.alias %}
{% for annotation in display.annotations[item.context.type] %}
{% set path = 'annotations/' + annotation + '.markdown.swig' %}{% include path %}
{% endfor %}
{% include 'annotations/changelog.markdown.swig' %}
{% endif %}
---