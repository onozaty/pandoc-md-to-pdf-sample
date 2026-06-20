# pandoc-md-to-pdf-sample

Pandoc を使って Markdown を PDF に変換するサンプルリポジトリです。
[pandoc-ext/diagram](https://github.com/pandoc-ext/diagram) の Lua フィルタを利用し、Mermaid 図のレンダリングに対応しています。

## 必要なツール

devcontainer を使うと以下が自動的にセットアップされます。

- [Pandoc](https://pandoc.org/)
- XeLaTeX（texlive-xetex）
- 日本語フォント（Noto CJK）
- [Mermaid CLI（mmdc）](https://github.com/mermaid-js/mermaid-cli)

## 使い方

```bash
bash scripts/convert.sh
```

`output/sample.pdf` が生成されます。

## ファイル構成

```
├── docs/
│   └── sample.md          # 変換対象の Markdown（Mermaid 図入り）
├── filters/
│   └── diagram.lua        # pandoc-ext/diagram フィルタ
├── pandoc/
│   ├── defaults.yaml      # Pandoc 設定
│   ├── mermaid-config.json # Mermaid フォント設定
│   └── puppeteer-config.json # Puppeteer Chrome 起動オプション
├── scripts/
│   ├── convert.sh         # 変換スクリプト
│   └── mmdc-wrapper.sh    # mmdc ラッパー（puppeteer 設定を付与）
└── output/                # PDF 出力先（.gitignore 対象）
```

## Chromeサンドボックスに関する注意事項

Ubuntu 23.10 以降では AppArmor により unprivileged user namespaces がデフォルト無効になっており、
Chrome のサンドボックス機能が使えないため `--no-sandbox` フラグが必要です。
`pandoc/puppeteer-config.json` でこのフラグを設定し、`scripts/mmdc-wrapper.sh` 経由で mmdc に渡しています。

- 参考 issue: https://github.com/mermaid-js/mermaid-cli/issues/730

## Mermaid 図の書き方

Markdown 内でコードブロックのクラスを `.mermaid` にすると図として変換されます。

````markdown
```{.mermaid}
flowchart TD
    A[開始] --> B[処理] --> C[完了]
```
````
