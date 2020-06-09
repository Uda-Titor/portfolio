# README

# ここ危険です

## 概要<br>
修繕して欲しい箇所の位置、写真、修繕内容について連絡ができるサービス

## コンセプト<br>
住民からの道路の修繕箇所の要望について、グーグルマップを用いた位置図、写真、コメントを添付することができるサービス。

## バージョン<br>
Ruby 2.6.5p114 rails5.2.4.3

## 機能一覧
- ログイン
- ユーザー登録機能<br>
 ※メールアドレス、名前、パスワードは必須
- パスワード再設定機能
- 案件一覧表示
 - いいね数表示
 - 案件に関するグラフ２つ
 - お知らせ（タイトルのみ）
- 案件投稿機能
 - 必須事項：案件タイトル、案件内容、案件の住所 or googlemapにマッピング、緊急性、備考　
 - 追加事項：案件のファイル（複数写真など）
- 案件編集機能（新規投稿で記入した事項を編集できます）
 - 管理者事項：実施予定日、完了予定日、案件の進捗具合（管理者のみ可能）
- 案件いいね機能
 - 案件へのいいねは１つの案件に対して1人１回しかできない
 - 自身の案件にはいいねできない
- コメント投稿機能
　- コメント編集機能とコメント削除はコメントした本人のみ可能
- お知らせ掲示板機能（管理者がお知らせを書くことができます）
- コメント機能といいね機能はページ遷移なしで実行可能

## カタログ設計<br>
https://docs.google.com/spreadsheets/d/1SCTHp8nXC_ieGuNbFEBg1TDstzUigWyWO77LK7MQDDg/edit#gid=0

## 画面遷移図<br>
https://docs.google.com/spreadsheets/d/18N2iG-viN3q7usR3FhspYlFYF2ObiG7418x0PUsB9Ys/edit#gid=0

## 画面ワイヤーフレーム<br>
https://docs.google.com/spreadsheets/d/1i6w_WKBIz_PW9PrWvviHsScHt6MfP3jJl5EMSp1-7rg/edit#gid=0

## データテーブル　ER図<br>
https://docs.google.com/spreadsheets/d/1mrwzfg59_YZ_7o_6FQ5d5z4Qe7je0MNfFt-0vSVqpak/edit#gid=0


## 使用予定gem<br>
carrierwave<br>
・mini_magik<br>
・device<br>
・ransack<br>
・Geocoder<br>

## 使用予定API<br>
・Google Maps API
