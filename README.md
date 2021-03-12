# README

# アプリケーション名

- RentSpace

# アプリケーション概要

- レンタルスペース、施設の貸し出しと利用予約

# URL

- [RentSpace](https://fitfac.herokuapp.com/)

# テスト用アカウント

- email: 666666@gmail.com
- password: password6

# 利用方法

ユーザー登録により自身の空きスペース・店舗を出店できる。
出店した店の予約枠も作成ができる。
また、登録したユーザーは他の店舗の予約もできる。
ユーザー登録にはクレジットカードが必要

# 目指した課題解決、制作背景

- 無人スペースの効率利用
- スペースを貸したい人への簡易的予約システム
- 無人店舗の増加促進による人件費の削減
- 増加するテレワークスペースの貸し出しにも対応
- 健康指向の高まりより、貸しジムスペースとしても利用可

# 実装機能

### 基本機能とDEMO
- 基本情報登録ページからクレジット情報登録ページへのウィザード形式の会員登録
情報登録ページからクレジット情報登録ページへ
https://gyazo.com/e8b4700cc0cc399e10a176f5c4098010.gif  
クレジット情報登録から登録完了ページへ
https://gyazo.com/4f38890deb7847d03a496f057a5cc322.gif  
ユーザーの情報登録を項目毎にわかりやすくする為、deviseコントローラーの変更で実装

- 出店機能          
ユーザーが店舗情報を入力し、店舗情報を出店する
https://gyazo.com/e09722a7de3f56ce524658af2ea04c9c.gif  
- 時間予約、購入機能                                   
店舗管理ユーザーが予約券発行
https://gyazo.com/286e3ae95ea3ff993ad7987634de8d38.gif  
他のユーザーが予約を購入できる
https://gyazo.com/e3664df1623a47f9b8a1087ecdbb64c5.gif  
購入前と購入後を色分けし、それぞれの店舗、ユーザーページそれぞれへ配置し、管理する

### カード変更と返金
- クレジットカードデータ変更機能                     
登録済のクレジットカードを変更できる    
https://gyazo.com/6b3f722546ad8881cc8ee855040a8bd5.gif  
カード情報のトークンを取得・削除をし、再度登録したトークンを登録する

- クレジット売り上げ返金機能
店舗側から予約済の枠を削除・返金できる                  
https://gyazo.com/2df0d3bf7d80f44204018f38fee5346d.gif  
売り上げ情報トークンを取得し、取消を行う

- ユーザーから予約キャンセル、返金処理
ユーザー側から予約済の枠を削除・返金できる            
https://gyazo.com/3643494ac3868eb95bd5011735313831.gif  
キャンセル可能は予約開始時間の1時間前まで、それを過ぎたら取消は表示されない

### 検索、ソート関連
- 店舗検索機能  
店舗に関するキーワードを入れるとワードに合う店舗が検索される             
https://gyazo.com/2ebed07c179ca1ea72e3219e98320fe2.gif  
postテーブル全体でのワード検索ができる

- 検索ページのページング機能
検索一覧にて複数のページにわたるページングができる                  
https://gyazo.com/c5e69a6a903619c3be2dc93121ed14b0.gif  
検索後はテストの為、4項目毎のページング

- 検索ページのソート機能
検索後のキーワードを引継ぎ、ソートができる            
https://gyazo.com/0c03b9b02f43342b4a9747478343616f.gif  
新しい順、古い順、いいねが多い順に並び替える

- 予約済み一覧のソート機能                         
過去分も含め予約済枠を一覧で確認でき、並び替えができる
https://gyazo.com/53b96f2b302be2aa50f249ab3467914c.gif  
新しい順、古い順に並び替える

### その他実装
- レスポンシブル対応    
スマホサイズでも崩れないように実装
https://gyazo.com/4540e40f97ee17d2cc29afeabf6afa00.gif  

- GoogleMap実装    
それぞれの店舗の場所がわかるようにGoogleMapのAPIを導入
https://gyazo.com/4c938195f8f091e512a75210e8507c93.gif
入力した住所からその場所にピンが刺さる仕様

- お気に入り、いいねの非同期実装   
ユーザーは店舗毎にお気に入りとして登録できる
https://gyazo.com/dd3d7648703bd0a60b9cbea953f99d4e.gif  
お気に入りに登録した店舗はマイページで確認できる

- Q&Aのモーダル、アコーディオン実装   
ヘッダー部分のQ&Aからアクセスできる
https://gyazo.com/c158de70bb7e93b9ca05e5ef0faa8376.gif  
ページ変遷なしで確認できる

- お問い合わせページから管理者へメール受信  
ヘッダーから疑問やご意見を管理者へ送信できる
https://gyazo.com/f52ce0c619fd04a51f74ba7a9bb81227.gif  
activemailerによる受信機能の実装

- 会員登録後、メール送信   
会員登録完了後、登録メールに登録メールが送られる
https://gyazo.com/f49bbf5690ac8c37269e033617950a34.gif  
activemailerによる送信機能の実装

- 施設画像の複数投稿  
店舗のサブ画像として複数登録可能

- slickによる画像スライド実装
画像のスライドができるよう実装

- ページ変遷Flash
ユーザーの操作が適切に行われているかわかるように実装

# 工夫したポイント
- クレジット変更、お問い合わせ送信など、ユーザーがひとつのサイトとして  
使用できる仕様になるように設計
- 検索に関して検索ワードを引き継いでソートできるように実装
- 予約済、未予約をわかりやすく実装
- 店舗詳細にyoutube_idやgoogleMapなど多くのツールで紹介できるように実装

# 今後実装したい機能
- 予約の定員制機能
- SNSのシェア機能

# 開発環境

## バックエンド
Ruby,Ruby on Rails

## フロントエンド
HTML,CSS,JavaScript,jQuery,Ajax

## データベース
MySQL

## インフラ
AWS(EC2),Capistrano

## 本番環境
Nginx

## ソース管理
GitHub,GitHubDesktop

## テスト
RSpec

## 使用API
PAY.JP
Maps JavaScript API
GeocodingAPI

## エディタ
VSCode

# テーブル設計

## users テーブル

| Column              | Type     | Options                   |               
| ------------------- | -------- | ------------------------- |
| nickname            | string   | null: false               |
| email               | string   | null: false, unique: true |
| encrypted_password  | string   | null: false               |
| birth_day           | datetime | null: false               |

### Association

- has_many :posts
- has_one :card
- has_many :books
- has_many :book_orders
- has_many :goods


## posts テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| postal_code       | string     | null: false                    |
| prefecture        | string     | null: false                    |
| city              | string     | null: false                    |
| address           | string     | null: false                    |
| building_name     | string     |                                |
| price             | text       | null: false                    |
| bus_hours         | text       | null: false                    |
| text              | text       | null: false                    |
| item              | text       | null: false                    |
| caution           | text       |                                |
| youtube_id        | text       |                                |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :books
- has_one_attached :image
- has_many_attached :images
- has_many :goods

## books テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| start_time | string     | null: false                    |
| end_time   | string     | null: false                    |
| price      | integer    | null: false                    |
| memo       | string     | null: false                    |
| capacity   | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |
| post       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post
- has_one :book_order

## cards テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| card_token        | string     | null: false                    |
| customer_token    | string     | null: false                    |
| customercard_token| string     | null: false                    |
| user              | references | null: false, foreign_key: true |


### Association

- belongs_to :user

## book_orders テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| billing_token     | string     | null: false                    |
| user              | references | null: false, foreign_key: true |
| book              | references | null: false, foreign_key: true |

### Association

- belongs_to :book
- belongs_to :user

## goods テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| post              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## contacts テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false, foreign_key: true |
| message           | text       | null: false, foreign_key: true |

