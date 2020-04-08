# README
＊2020/03/12 再修正済み（主にレイアウト）

# EVENT KEEPER
### Heroku:https://mighty-harbor-57988.herokuapp.com
### AWS:http://18.182.182.144 (googleログイン、sendgrid未実装)
##### ＊Herokuが最新です。


## 概要
シンプルにタイトルと記事内容を投稿することに特化したイベント管理運営サービス

## コンセプト
掲示板にポスターを貼るように、簡単にイベントを作成と告知できる。
デザインをできる限りシンプルにして、情報量を減らす事でユーザーが選択しやすい設計に仕上げた。

## バージョン
- Ruby 2.6.5
- Rails 5.2.4

## 機能一覧
- [ ] イベント機能
  - [ ] イベントCRUD機能（一覧、作成、詳細、更新、削除）
    - [ ] 主催者がイベントをキャンセル（削除）する（主催者のみの操作）
  - [ ] イベント参加者の表示機能
  - [ ] 確認画面機能（新規投稿のみ）
  - [ ] 主催イベントの一覧表示（プロフィールにて）
  - [ ] イベント終了表示機能（期限になるとコンテンツ部分に表示）

  - [ ] イベント参加機能（一覧、追加、削除）
    - [ ] 参加イベントの一覧表示機能
    - [ ] 参加イベントの編集機能（追加、削除）

  - [ ] イベントの’あとで見る’機能（一覧、追加、削除）
    - [ ] あとで見る機能の一覧表示機能
    - [ ] あとで見るリストの編集機能（追加、削除）

- [ ] ユーザ機能
  - [ ] ユーザ機能（作成、詳細、更新）

- [ ] フォロー機能とフォロワー機能
  - [ ] フォローとフォロワー機能（一覧表示、追加、削除）

- [ ] お問い合わせ機能（一般ユーザがイベント主催者へ）
  - [ ] お問い合わせ受信box機能（一覧表示、詳細）

- [ ] ユーザ管理機能（RailsAdmin）
  - [ ] ユーザのCURD機能（作成、詳細、更新、削除）
  - [ ] ユーザ削除機能
    - [ ] ユーザの編集と削除は作成したユーザと管理者のみ実行可能

- [ ] メール通知機能(Herokuとローカルのみ)
  - [ ] イベント主催者へのお問い合わせ通知メール（主催者へ）
  - [ ] イベントの詳細変更の通知メール（参加者へ）
  - [ ] イベントの中止の通知メール（参加者へ）

- [ ] ラベル機能
- [ ] 簡易版ゲストログイン機能
- [ ] イベント検索機能(Gem:Runsack)
- [ ] 画像アップロード機能(Gem:carrierwave)
- [ ] ページネーション機能(Gem:Kaminari)
- [ ] ログイン機能（Gem:Devise）



## カタログ設計
詳細は[こちら](https://docs.google.com/spreadsheets/d/1jzKGT_3a9xmagpc9RAHunR8BEhg3C-Pu0EhWB_1oJiw/edit?usp=sharing)をご覧ください。

## テーブル定義
詳細は[こちら](https://docs.google.com/spreadsheets/d/1ZxAl-qePMVRVjMSjJvvdCAtxFa8Lr9Chx3hgXIj9r2s/edit?usp=sharing)をご覧ください。

## ER図
<img src="https://raw.githubusercontent.com/KakeruYamamoto/graduation/master/erd.png" width="650px">

## 画面遷移図
<img src="https://lh3.googleusercontent.com/Ck8vK3M-SmQT3M9H20C9AlAk_WeHH8gfVrmRjgSBvlktjhjnh8eVC8wrZ5MAp530hLszk_YAC1QU4Hm_xP2SwHmxn60dsiIoxWq3Pq1LmvWqPn1osL0HN_4iJXGvfBX5ZaNBMUf0iEXantx5thm7d1YW7nf6Pkp-1T-cKPCJ9iD_SIb0n3VcuI9prKAC90jXa2RTqNHzEnIUH2UhzB3xLfdNmjK7aIUlofxq7uUX8A_hOqHFeHerj1vlMPNce2suBeDP8aUvv3Hq_dv_iIpi41RNCeSeYBxqfftnFgXZyJOVSSqVVivYhcwDECPFsxkR0la7hMI6bw-6lazF6J7Eiqb-zTPuz2ILcUgK6rJeOdbfvwTlPaqigpn8ia6uAwU2KtJDluTJMRwepwSYhBJ-mWYASroyOl6NXRPnZfCIcer8uKgc8CLGMVBGGe97GG37E9xtoMdiqSeo0djQj_uMMvtm02aY0XZQl9vY5nze52j-QSYHkboP3l9WBwhHzvhX_h_EleFAQsb1HHQcsizafs3DQH3eY84EuDDtkufvPVFHOUQLQYXKZN9MxdstjREj-syU3zFnrng1VF6R1l2JWo8p-ZQblxcDiaYbDihvITdxo9Q-xHfoVtlvxwOcLQGM98hdQS0APvjg-XWN8a81l51wdZ78M-Gmzdq3a_1FJVbbo-9KUXTwsyWjDes=w1211-h789-no" width="650px">

## 画面ワイヤーフレーム
<img src="https://lh3.googleusercontent.com/FmNOKsWeeqvYpZj2-QPUV-GXmtIrcfIRR889hfaMXj4qVGZpoLi7jYzLCBWn34HstGVjDquNvYG-003vkvEFCePdb8UCWe8rg5TM1sg0PIbaoBuG9NddrAhQYGxBgdKdMT8SrdD2DKgD0LY1w_JB0_7UtAqeDrFdoyHKd_XqGyTu5p5cVCJ4IR9_uOo-I-DOgchZ7vEsW8ztKzagFQNnqfjbKbuernpWVG6xpKtsswBfdxuRb092yCj30jGu7RTDjFqBMaBzEG-iAXV12cK83grEP3HmNJaJQkzbp6sCEJ_aKJWuasc6vLEOg_b3xB36AkXLvHCu9fYP0TJuWQdteFSFgE8AD_RTVbZnBgLSQKjGUrGFY1rpFSywH-U367Chf_VWJHfOJK6fqDpqY1m2Jy0ilS-HSR0gi4LIGywmuZridTuHvDWaUTD34WOWevtBERdH_NOOFa39mj0AuMKLZijnmkLkUux8AXDKheZdzLxIrGOYnVVPBW1QmOb8QGvGlxwD68VhtCQ4S-YjHz3Ty9SbKEWN5ObNnp5aQnHSF5WVckLnfEjGuCoGMhNnuZElDS9P1ZwqDJZm4xy6iEwC-lSF5xSyhx7s8P2l7_hH__q0oDAbSfHh4khnvEo5jF_2-cXIs-KoAJ4q9Ik3Y-9IuXvqNdbhYxMTOTjhmNpgpqs7yDDnySv-aYp9Ab4=w698-h789-no" width="650px">


# 使用技術
- ログイン機能
  - devise
  - omniauth
  - omniauth-google-oauth2（Herokuのみ）
- 管理者機能
  - rails_admin
- 権限管理
  - cancancan
- 画像編集機能
  - carrierwave
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
  - gimei
- デザイン
  - bootstrap
  - kaminari-bootstrap
- メール機能
  - SendGrid(Herokuのみ)
  - letter_opener_web(ローカル環境)

## How to Start

```
1. $ git clone https://github.com/KakeruYamamoto/graduation.git (クローン生成)
2. $ cd graduation (作成後、対象のディレクトリから抜けてしまうので、そのディレクトリ移動)
3. $ bundle install
4. $ yarn install
5. $ rails db:create (データベースの生成)
6. $ rails db:migrate （マイグレーションファイルの実行）
7.  #config/initializers/locale.rb内の"I18n"の二行をコメントアウト（8.のコマンド終了後、戻す）
8. $ rails db:seed (シードデータの生成)
9. $ bundle exec rspec （テストの実行。＊開発の兼ね合いで、修正が間に合っていない場合がございますので、ここでエラーが出ても、サーバは立ち上げられます。）
10.  rails s  
#通知メール機能は’http://localhost:3000/letter_opener’で確認できます。
```
