# README

# イベント管理ツール

## 概要
シンプルにタイトルと記事内容を投稿することに特化したイベント管理サービス

## コンセプト
主催するor参加するイベントを可視化する事でイベントの運用・管理などを簡単にする

## バージョン
- Ruby 2.6.5
- Rails 5.2.4

## 機能一覧
- [ ] イベント機能
  - [ ] イベント一覧表示機能
  - [ ] イベント投稿機能
    - [ ] タイトルと記事内容は必須
  - [ ] イベント詳細機能
  - [ ] イベント編集機能
  - [ ] イベント削除機能
    - [ ] イベント編集とイベント削除は主催者のみ実行可能
  - [ ] イベント参加機能
  - [ ] イベントキャンセル機能（参加・主催するイベントのキャンセル）
    - [ ] 参加者がイベント申し込みをキャンセルする
    - [ ] 主催者がイベントをキャンセルする
  - [ ] イベント検索機能
- [ ] ユーザ機能
  - [ ] ユーザ作成機能
    - [ ] 名前・アドレス・パスワードは必須
  - [ ] ユーザ詳細機能（マイページ）
  - [ ] 権限移譲機能（イベント主催者から一般ユーザへ）
    - [ ] イベントのオーナ権利の移譲
- [ ] ユーザ管理機能
  - [ ] ユーザ編集機能
  - [ ] ユーザ削除機能
    - [ ] ユーザ編集とユーザ削除は作成したユーザと管理者のみ実行可能
- [ ] メール機能（告知・お問い合わせ）
- [ ] ページネーション機能
- [ ] ログイン機能



## カタログ設計
https://docs.google.com/spreadsheets/d/1jzKGT_3a9xmagpc9RAHunR8BEhg3C-Pu0EhWB_1oJiw/edit?usp=sharing
## テーブル定義
https://docs.google.com/spreadsheets/d/1ZxAl-qePMVRVjMSjJvvdCAtxFa8Lr9Chx3hgXIj9r2s/edit?usp=sharing
# ER図
https://cacoo.com/diagrams/mr2Oc0nDjwrl8qKF/D0F91

## 画面遷移図
https://cacoo.com/diagrams/y5Szk1GeOvPKQRcD/9E3BF
## 画面ワイヤーフレーム
https://cacoo.com/diagrams/51O1AnZuSgtrGNYT/B6EB3

# 使用予定Gem
- ログイン機能
  - devise
- 管理者機能
  - rails_admin
- 権限管理
  - cancancan
- 画像編集機能
  - carrierwave
  - mini_magick
- 検索機能
  - ransack
- ページネーション
  - kamminari
- デバッグ
  - better_errors
  - binding_of_caller
  - pry-rails
- テスト
  - rspec-rails
  - spring
  - spring-commands-rspec
  - factory_bot_rails
  - capybara
  - selenium-webdriver
  - database_cleaner
  - launchy
  - faker
- デザイン
  - bootstrap
  - kaminari-bootstrap
- 辞書機能
  - i18n

# デプロイ予定
- AWS
