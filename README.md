# pandoc-md-to-pdf-sample

Markdownファイルを日本語対応のPDFに変換するサンプルプロジェクトです。
[pandoc-mermaid-ja](https://github.com/onozaty/pandoc-mermaid-ja) を使用しており、Mermaid図の描画と日本語フォントに対応しています。

## 変換対象

`docs/` フォルダ内のMarkdownファイルを変換します。

| ファイル | 内容 |
|---|---|
| `docs/basic-design.md` | 基本設計書 |
| `docs/er-design.md` | ER設計書 |
| `docs/api-spec.md` | API仕様書 |

## 使い方

### 前提条件

- Docker がインストールされていること

### 変換実行

```bash
./convert.sh
```

`docs/*.md` を順番に変換し、`output/` フォルダにPDFを出力します。

```
output/
├── basic-design.pdf
├── er-design.pdf
└── api-spec.pdf
```

### 単体変換

特定のファイルだけ変換したい場合は直接 `docker run` を実行します。

```bash
docker run --rm -v "$PWD":/data ghcr.io/onozaty/pandoc-mermaid-ja docs/basic-design.md -o output/basic-design.pdf
```
