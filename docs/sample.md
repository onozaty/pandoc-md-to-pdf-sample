---
title: Pandoc Markdown→PDF 変換サンプル
author: サンプル著者
date: 2026-06-20
---

# はじめに

このドキュメントは、Pandoc を使った Markdown → PDF 変換のサンプルです。
以下の要素が正しく変換されることを確認します。

- 見出し・本文
- リスト
- 表
- コードブロック
- Mermaid 図（フローチャート・シーケンス図）

# 基本的な Markdown 要素

## リスト

**番号なしリスト:**

- リンゴ
- バナナ
- オレンジ

**番号付きリスト:**

1. 第一ステップ
2. 第二ステップ
3. 第三ステップ

## 表

| 名前     | 役割           | 備考           |
|----------|----------------|----------------|
| Alice    | 開発者         | バックエンド担当 |
| Bob      | デザイナー     | UI/UX 担当     |
| Charlie  | プロジェクトマネージャー | 全体統括 |

## コードブロック

```python
def hello(name: str) -> str:
    return f"Hello, {name}!"

print(hello("World"))
```

# Mermaid 図

## フローチャート

システムの処理フローを示します。

```{.mermaid}
flowchart TD
    A[開始] --> B{入力ファイルは存在するか？}
    B -- Yes --> C[Markdownを読み込む]
    B -- No --> D[エラー終了]
    C --> E[Mermaid図を画像に変換]
    E --> F[pandocでPDF生成]
    F --> G[完了]
```

## シーケンス図

ユーザーとシステム間のやり取りを示します。

```{.mermaid}
sequenceDiagram
    actor User as ユーザー
    participant Script as convert.sh
    participant Pandoc as Pandoc
    participant mmdc as Mermaid CLI

    User->>Script: bash convert.sh を実行
    Script->>Pandoc: pandoc -d defaults.yaml sample.md
    Pandoc->>mmdc: Mermaid コードブロックを変換依頼
    mmdc-->>Pandoc: PNG 画像を返す
    Pandoc-->>Script: output/sample.pdf を生成
    Script-->>User: 完了メッセージ
```

# まとめ

上記の内容が PDF に正しく変換されていれば、Pandoc による Markdown → PDF 変換の基本的なセットアップは完了です。
