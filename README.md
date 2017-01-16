# テーブル設計

## Users

|column    |type      |null      |
|----------|----------|----------|
|name      |string    |false     |
|email     |string    |false     |
|password  |string    |false     |

### index
- email

### association
- has_many :messages
- has_many :chat_group_users
- has_many :chat_groups, through: :chat_group_users


## Messages

|column    | type     |null      |
|----------|----------|----------|
|body      |text      |          |
|chat_group_id|integer|     false|
|user_id   |integer   |false     |
|image     |string    |          |

### index
- chat_group_id
- user_id

### association
- belongs_to :user
- belongs_to :chat_group


## ChatGroups

|column    |type      |null      |
|----------|----------|----------|
|name      |string    |false     |

### association
- has_many :users, through: :chat_group_users
- has_many :messages

## ChatGroupsUsers

|column    |type       |null      |
|----------|-----------|----------|
|user_id   |integer    |false     |
|chat_group_id|integer |false     |

### index
- chat_group_id
- user_id

### association
- belongs_to :user
- belongs_to :chat_group
