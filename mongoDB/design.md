# nosql

* ## database name: team_cooperation
* ## Collections:
  * session
  ```json
  {
    "_id":"id",
    "__v":0,
    "data":{
      "user_id": "user_id",
      "username":"username ",
      "email": "email",
      "organization":{
        "id": "organization_id",
        "name": "organization_name",
        "email": "domain email",
        "role": "user_role_name",
        "permissions":["permission_name"]
      },
      "team":[
        {
          "id":"team_id",
          "permissions":["permission_name"]
        }
      ],
      "board":[
        {
          "id":"board_id",
          "permissions":["permission_name"]
        }
      ]
      "_expire":1577468762314,
      "_maxAge":86400000
    },
    "updatedAt":"2019-12-26T17:46:02.315Z"
  }
  ```
  * verification_code
  ```json
  {
    "_id":"id",
    "__v":0,
    "user_id":"user_id",
    "verification_code": "verification_code",     
    "updatedAt":"time"
  }
  ```