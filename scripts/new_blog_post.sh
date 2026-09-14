#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 3 ]]; then
  echo "用法: $0 <英文短链接> <中文标题> <英文标题>"
  echo "示例: $0 medical-imaging-notes '医学影像学习笔记' 'Notes on Medical Imaging'"
  exit 1
fi

slug="$1"
zh_title="$2"
en_title="$3"

if [[ ! "$slug" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
  echo "错误：英文短链接只能包含小写字母、数字和连字符。" >&2
  exit 1
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
post_dir="$repo_root/_posts"
post_date="$(date +%Y-%m-%d)"
zh_file="$post_dir/$post_date-$slug.md"
en_file="$post_dir/$post_date-$slug-en.md"

if [[ -e "$zh_file" || -e "$en_file" ]]; then
  echo "错误：同名文章文件已经存在。" >&2
  exit 1
fi

mkdir -p "$post_dir"

cat > "$zh_file" <<EOF
---
title: "$zh_title"
date: $post_date 09:00:00 +0800
lang: zh-CN
permalink: /blog/$slug/
lang_switch_url: /en/blog/$slug/
lang_switch_label: English
pinned: false
excerpt: "请填写中文摘要。"
comments: false
---

请在这里撰写中文正文。
EOF

cat > "$en_file" <<EOF
---
title: "$en_title"
date: $post_date 09:00:00 +0800
lang: en
permalink: /en/blog/$slug/
lang_switch_url: /blog/$slug/
lang_switch_label: 中文
pinned: false
excerpt: "Add a short English summary."
comments: false
---

Write the English post here.
EOF

echo "已创建："
echo "  $zh_file"
echo "  $en_file"
echo "编辑正文和摘要后提交；需要置顶时，将对应文件中的 pinned 改为 true。"
