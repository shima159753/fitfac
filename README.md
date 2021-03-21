# README

# アプリケーション名

- RentSpace

# アプリケーション概要

- レンタルスペース、施設の貸し出しと利用予約

# URL

- [RentSpace](http://13.112.31.51/)

# テスト用アカウント

- email: 666666@gmail.com
- password: password6

# 利用方法

ユーザー登録により自身の空きスペース・店舗を出店できる。
出店した店の予約枠も作成ができる。
また、登録したユーザーは他の店舗の予約と購入もできる。
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
  - 情報登録ページからクレジット情報登録ページへ 
![e8b4700cc0cc399e10a176f5c4098010](https://user-images.githubusercontent.com/74998207/111865046-ffdab880-89a7-11eb-8bcc-38f8c4b534df.gif)  

  - クレジット情報登録から登録完了ページへ  
 ![2](https://user-images.githubusercontent.com/74998207/111865202-ec7c1d00-89a8-11eb-9d0d-ef84ab2fb148.gif)   
  ユーザーの情報登録を項目毎にわかりやすくする為、deviseコントローラーの変更で実装

- 出店機能          
ユーザーが店舗情報を入力し、店舗情報を出店する  
![3](https://user-images.githubusercontent.com/74998207/111866728-df642b80-89b2-11eb-8723-d43abb9ebfa4.gif)  

- 時間予約、購入機能                                   
  - 店舗管理ユーザーが予約券発行  
  ![4](https://user-images.githubusercontent.com/74998207/111866883-eb042200-89b3-11eb-8675-e0d843007662.gif)  
   
  - 他のユーザーが予約を購入できる  
  ![5](https://user-images.githubusercontent.com/74998207/111866943-38808f00-89b4-11eb-9e57-ffe88c86fa88.gif)   
  購入前と購入後を色分けし、それぞれの店舗、ユーザーページそれぞれへ配置し、管理する

### カード変更と返金
- クレジットカードデータ変更機能                     
登録済のクレジットカードを変更できる    
![6](https://user-images.githubusercontent.com/74998207/111887777-b6778100-8a1a-11eb-839d-58a6dc0b8034.gif)  
カード情報のトークンを取得・削除をし、再度登録したトークンを登録する

- クレジット売り上げ返金機能
店舗側から予約済の枠を削除・返金できる                  
![7](https://user-images.githubusercontent.com/74998207/111887840-0fdfb000-8a1b-11eb-9946-e1ab6a565379.gif)   
売り上げ情報トークンを取得し、取消を行う

- ユーザーから予約キャンセル、返金処理
ユーザー側から予約済の枠を削除・返金できる            
![8](https://user-images.githubusercontent.com/74998207/111887882-57fed280-8a1b-11eb-806d-f726f1d999d4.gif)  
キャンセル可能は予約開始時間の1時間前まで、それを過ぎたら取消は表示されない

### 検索、ソート関連
- 店舗検索機能  
店舗に関するキーワードを入れるとワードに合う店舗が検索される             
![9](https://user-images.githubusercontent.com/74998207/111887923-a7dd9980-8a1b-11eb-8bad-cb5f028a8554.gif)  
postテーブル全体でのワード検索ができる

- 検索ページのページング機能
検索一覧にて複数のページにわたるページングができる                  
![10](https://user-images.githubusercontent.com/74998207/111888003-20dcf100-8a1c-11eb-83c9-68508c4085c5.gif)  
検索後はテストの為、4項目毎のページング

- 検索ページのソート機能
検索後のキーワードを引継ぎ、ソートができる            
![11](https://user-images.githubusercontent.com/74998207/111898265-4db6f580-8a68-11eb-99a6-3a15352c687b.gif)  
新しい順、古い順、いいねが多い順に並び替える

- 予約済み一覧のソート機能                         
過去分も含め予約済枠を一覧で確認でき、並び替えができる
![12](https://user-images.githubusercontent.com/74998207/111898353-c6b64d00-8a68-11eb-89b3-ec70c21f2101.gif)  
新しい順、古い順に並び替える

### その他実装
- レスポンシブル対応    
スマホサイズでも崩れないように実装  
![13(3)](https://user-images.githubusercontent.com/74998207/111898573-44c72380-8a6a-11eb-859c-d6a6ec49eef9.gif)  

- GoogleMap実装    
それぞれの店舗の場所がわかるようにGoogleMapのAPIを導入  
![14](https://user-images.githubusercontent.com/74998207/111898648-c61eb600-8a6a-11eb-9827-3c584cb0de15.gif)  
入力した住所からその場所にピンが刺さる仕様

- お気に入り、いいねの非同期実装   
ユーザーは店舗毎にお気に入りとして登録できる  
![15](https://user-images.githubusercontent.com/74998207/111898734-2f9ec480-8a6b-11eb-8ee9-e97393ed7bea.gif)  
お気に入りに登録した店舗はマイページで確認できる

- Q&Aのモーダル、アコーディオン実装   
ヘッダー部分のQ&Aからアクセスできる  
![16](https://user-images.githubusercontent.com/74998207/111898823-a340d180-8a6b-11eb-9175-2a9bb3736a7d.gif)  
ページ変遷なしで確認できる

- お問い合わせページから管理者へメール受信  
ヘッダーから疑問やご意見を管理者へ送信できる  
![17](https://user-images.githubusercontent.com/74998207/111898869-05013b80-8a6c-11eb-9158-27241d748deb.gif)  
activemailerによる受信機能の実装

- 会員登録後、メール送信   
会員登録完了後、登録メールに登録メールが送られる
![18](https://user-images.githubusercontent.com/74998207/111898958-9d97bb80-8a6c-11eb-8016-ae6ecbe4a57e.gif)  
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

# E-R図
![ER](https://user-images.githubusercontent.com/74998207/111899304-16981280-8a6f-11eb-8bff-a5300126153a.png)

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

