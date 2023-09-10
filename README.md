# プロジェクト名

プロジェクトの簡潔な説明をここに記述します。

## 概要

プロジェクトの詳細な説明や背景情報を提供します。

## 特徴

プロジェクトの特徴やハイライトをここに挙げます。

## スクリーンショット（任意）

プロジェクトのスクリーンショットやデモ画像をここに表示できます。

## インストール方法

プロジェクトをクローンして実行する手順を説明します。

```bash
git clone https://github.com/your-username/your-project.git
cd your-project
flutter pub get
flutter run
```

## 使用法

プロジェクトの使い方やコマンド例を示します。

```bash
flutter run  # プロジェクトの実行
```

## 実装のTodoリスト

- [ ] タイマーの実装
  - [ ] タイマーの残り時間に応じてゲージを減少させる機能の作成
  - [x] ゲージ動かない パーセンテージが変更されてない？
    - 動いているけどパーセンテージの減少が少なすぎて目で見たときに減りがわからなかったのが原因
    - 画面に反映はされているけど、描画がボタンを押下したタイミングのみになってしまう
    - 画面にtimerModelで管理している残り時間を出すようにしたら変更が画面に描画されるようになった(なぜ...)
  - [] ゲージの減少をなめらかにしたい
  - [] リセットした時のゲージの増加をなめらかにしたい
- [ ] ログイン機能の実装
  - [x] UI作成
  - [ ] 認証機能の実装
- [ ] タスク3 の説明
  - [ ] サブタスク3.1 の説明
  - [ ] サブタスク3.2 の説明
- [ ] タスク4 の説明

## 貢献方法

プロジェクトへの貢献方法やガイドラインを記載します。

## ライセンス

このプロジェクトは [ライセンス名] のもとで公開されています。詳細は [LICENSEファイル](LICENSE) をご覧ください。
