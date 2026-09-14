---
layout: archive
title: "网站地图 / Sitemap"
permalink: /sitemap/
author_profile: true
---

{% include base_path %}

这里列出了本站的所有页面和文章；程序也可以读取 [XML 版本]({{ base_path }}/sitemap.xml)。

This page lists all pages and posts on the site. An [XML version]({{ base_path }}/sitemap.xml) is also available for automated tools.

<h2>页面 / Pages</h2>
{% for post in site.pages %}
  {% include archive-single.html %}
{% endfor %}

<h2>文章 / Posts</h2>
{% for post in site.posts %}
  {% include archive-single.html %}
{% endfor %}

{% capture written_label %}'None'{% endcapture %}

{% for collection in site.collections %}
{% unless collection.output == false or collection.label == "posts" %}
  {% capture label %}{{ collection.label }}{% endcapture %}
  {% if label != written_label %}
  <h2>{{ label }}</h2>
  {% capture written_label %}{{ label }}{% endcapture %}
  {% endif %}
{% endunless %}
{% for post in collection.docs %}
  {% unless collection.output == false or collection.label == "posts" %}
  {% include archive-single.html %}
  {% endunless %}
{% endfor %}
{% endfor %}
