# README

# アプリケーション名

- RentSpace

# アプリケーション概要

- レンタルスペース、施設の貸し出しと利用予約

# URL

- [RentSpace](URL)

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
https://gyazo.com/e8b4700cc0cc399e10a176f5c4098010

クレジット情報登録から登録完了ページへ
https://gyazo.com/4f38890deb7847d03a496f057a5cc322

ユーザーの情報登録を項目毎にわかりやすくする為、deviseコントローラーの変更で実装

- 出店機能          
ユーザーが店舗情報を入力し、店舗情報を出店する
https://gyazo.com/e09722a7de3f56ce524658af2ea04c9c

- 時間予約、購入機能                                   
店舗管理ユーザーが予約券発行
https://gyazo.com/286e3ae95ea3ff993ad7987634de8d38

他のユーザーが予約を購入できる
https://gyazo.com/e3664df1623a47f9b8a1087ecdbb64c5

購入前と購入後を色分けし、それぞれの店舗、ユーザーページそれぞれへ配置し、管理する

### カード変更と返金
- クレジットカードデータ変更機能                         
https://gyazo.com/6b3f722546ad8881cc8ee855040a8bd5
- クレジット売り上げ返金機能                     
https://gyazo.com/2df0d3bf7d80f44204018f38fee5346d
- ユーザーから予約キャンセル、返金処理            
https://gyazo.com/3643494ac3868eb95bd5011735313831

### 検索、ソート関連
- 店舗検索機能                                     
https://gyazo.com/2ebed07c179ca1ea72e3219e98320fe2
- 検索ページのページング機能                          
https://gyazo.com/c5e69a6a903619c3be2dc93121ed14b0
- 検索ページのソート機能                            
https://gyazo.com/0c03b9b02f43342b4a9747478343616f
- 予約済み一覧のソート機能                         
https://gyazo.com/53b96f2b302be2aa50f249ab3467914c

### その他実装
- レスポンシブル対応                          
https://gyazo.com/4540e40f97ee17d2cc29afeabf6afa00
- お気に入り、いいねの非同期実装                      
https://gyazo.com/dd3d7648703bd0a60b9cbea953f99d4e
- Q&Aのモーダル、アコーディオン実装                   
https://gyazo.com/c158de70bb7e93b9ca05e5ef0faa8376
- お問い合わせページから管理者へメール受信              
https://gyazo.com/f52ce0c619fd04a51f74ba7a9bb81227
- 会員登録後、メール送信                            
https://gyazo.com/f49bbf5690ac8c37269e033617950a34

- 施設画像の複数投稿
- slickによる画像スライド実装
- ページ変遷Flash

# 実装した機能についてのGIFと説明

実装した機能について、それぞれどのような特徴があるのか列挙しましょう。
GIFを添えることで、イメージがしやすくなります。

# 実装予定の機能

洗い出した要件の中から、今後実装予定のものがあれば記述しましょう。

# 実装予定の機能

洗い出した要件の中から、今後実装予定のものがあれば記述しましょう。

# テーブル設計

# users テーブル

| Column              | Type     | Options                   |               
| ------------------- | -------- | ------------------------- |
| nickname            | string   | null: false               |
| email               | string   | null: false, unique: true |
| encrypted_password  | string   | null: false               |
| birth_day           | datetime | null: false               |

### Association

- has_many :posts
- has_one :cards
- has_many :books
- has_many :book_orders


## posts テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| postal_code       | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| city              | string     | null: false                    |
| address           | string     | null: false                    |
| building_name     | string     |                                |
| price             | text       | null: false                    |
| bus_hours         | text       | null: false                    |
| text              | text       | null: false                    |
| item              | text       | null: false                    |
| caution           | text       |                                |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :books
- has_one_attached :image

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
- has_one :book_order

## card_orders テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| book              | references | null: false, foreign_key: true |

### Association

- belongs_to :book
- belongs_to :user


# ローカルでの動作方法

- ruby 2.6.5
- rails 6.0.3.5
- mysql 5.6.51

git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。