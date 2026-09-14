# Blog 发布指南

Blog 使用 Jekyll 的 `_posts` 目录管理。每篇内容由一份中文 Markdown 和一份英文 Markdown 组成，列表会自动区分语言，并按“置顶优先、日期倒序”排列。

## 新建文章

在仓库根目录运行：

```bash
./scripts/new_blog_post.sh <英文短链接> "<中文标题>" "<英文标题>"
```

例如：

```bash
./scripts/new_blog_post.sh medical-imaging-notes "医学影像学习笔记" "Notes on Medical Imaging"
```

脚本会在 `_posts` 中创建当天的中英文文章骨架。编辑两个文件里的 `excerpt` 和正文，然后正常提交并推送即可发布。

## 置顶文章

文章头部默认包含：

```yaml
pinned: false
```

把它改为 `pinned: true` 即可置顶。中文和英文文章分别控制；如果两种语言都要置顶，需要同时修改两份文件。

可以置顶多篇文章。多篇置顶文章之间仍按日期从新到旧排列。

## 文章地址与双语切换

脚本会自动生成独立链接，并配置中英文互相切换：

- 中文：`/blog/<英文短链接>/`
- 英文：`/en/blog/<英文短链接>/`

不要让两篇不同文章使用同一个英文短链接。
