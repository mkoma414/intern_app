## 概要
- このアプリケーションはRuby on Railsのスキル向上を目的として、既存のマッチングアプリを模して作成するものです。
- 外見や実際に操作した時の動作を元にコーディングを行なっておりますので、RailsやHTMLのコードは独自のものとなっています。

### 実装する機能と順序

下記の順序で、ビューごとに作成していきます。

1. 募集案件一覧画面
    - トップ画像のスライド機能
    - ローディングアイコン
    - いいね機能
    - 検索機能
    - ログイン機能（一般ユーザー、企業）

  `・画像のアップロードをする必要があるため、企業側のユーザー及び案件登録画面を仮で作成する`
  `・検索に独自のフォームを利用しているため極力似ているものを作成する`
  
2. トップ画面
    - Facebook認証
    - 背景で全画面動画の表示
  
  
3. プロフィール編集
  - プロフィール編集機能
  - つながり機能（申請・承認）
  
4. 募集案件詳細画面
  - 見られた数の表示
  - 「話を聞きに行きたい」ボタン
  - 「応援する」機能
  - 地図
  
  `地図は可能であればGoogle APIを利用して実装。時間的に難しければ画像ファイルで代替する`
  
5. 募集案件の登録機能

  `企業のアカウントでログインしてから詳細な仕様を決める`



## DBの構成

#### Usersテーブル
Deviseで作成するモデル。通常の利用者と、案件を募集する側でテーブルは区別せず利用する。各ユーザーはプロフィールを持つが、項目数が多いため別テーブルで管理する。

| カラム名 | 型 | index | 外部制約|その他 |
| :---------------: |:---------------:| :----------: | :----------: | :-------:|
| name | string | true |-|  null false |




 - Association

  1. has_many :company_users
  2. has_many :companies, through: :company_users, source: :company
  3. has_many :good_projects 
  4. has_one :profile
  5. has_many :goods, through: :good_projects, source: :projects
  6. has_many :to_friendship, class_name: 'Relation', foreign_key: 'from_id'
  7. has_many :to_friends, through: :to_friendship, source: 'to'
  8. has_many :from_friendship, class_name: 'Relation', foreign_key: 'to_id
  9. has_many :from_friends, through: :from_friendship, source: 'from'

#### profilesテーブル  
ユーザーのプロフィールを管理するテーブル

| カラム名 | 型 | index  | 外部制約|その他 |
| :---------------: |:---------------:| :----------: | :----------: | :-------:|
| introduction | text | - |-| null false |
| want_to_do | text | - |-|  |
| history | text |- |-|  |
| skill | text |- |-|  |
| educational_background | text |- |-|  |
| zeminar | text |- |-|  |
| circle | text |- |-|  |
| language | text |- |-|  |
| qualification | text |- |-|  |
| awards | text |- |-|  |
| writing | text |- |-|  |
| portfolio | text |- |-|  |
| portfolio_image | text |- |-|  |
| link | text |- |-|  |
| topic | text |- |-|  |
| basic | text |- |-|  |
| user_id | text |- |true| null false |

当初は、ポートフォリオは１つだけ登録できるよう実装する。

 - Association
    1. belongs_to :user


#### good_projectsテーブル

ユーザーが募集案件を「いいね」した数を管理する。usersとprojectsの中間テーブル。

| カラム名 | 型 | index 制約 | 外部制約|その他 |
| :---------------: |:---------------:| :----------: | :----------: | :-------:|
| user_id |int|-|true|-|
| project_id |int|-|true|-|


- Association
  1. belongs_to :user
  2. belongs_to :project

#### relationsテーブル
ユーザー間の「つながり」を管理するための中間テーブル。usersテーブルは、このrelationsテーブルを経由して自己結合させる。  

| カラム名 | 型 | index 制約 | 外部制約|その他 |
| :---------------: |:---------------:| :----------: | :----------: | :-------:|
|from_id|int|-|true|-|
| to_id |int|-|true|-|

- Association
  1. belongs_to :to, class_name: 'User'
  2. belongs_to :from, class_name: 'User'

#### company_usersテーブル
企業とユーザーの中間テーブル。

| カラム名 | 型 | index 制約 | 外部制約|その他 |
| :---------------: |:---------------:| :----------: | :----------: | :-------:|
|company_id|int|-|true|-|
| user_id |int|-|true|-|

- Association
  1. belongs_to :company
  2. belongs_to :user

#### projectsテーブル
企業からの求人を管理するテーブル。  

| カラム名 | 型 | index 制約 | 外部制約|その他 |
| :---------------: |:---------------:| :----------: | :----------: | :-------:|
|title|string|-|-|null: false|
| content |text|-|-|null :false|
|finding_person|text|-|-|-|
| recruitment_style |text|-|-|-|
| recruiting_feature |text|-|-|-|


- Association
  1. belongs_to company
  2. has_many :good_projects

#### companiesテーブル
企業の情報を管理するテーブル。Deviseで作成する。  

| カラム名 | 型 | index 制約 | 外部制約|その他 |
| :---------------: |:---------------:| :----------: | :----------: | :-------:|
|name|string|-|-|null: false|


- Association
  1. has_many :company_users
  2. has_many :users, through: :company_users, source: :user