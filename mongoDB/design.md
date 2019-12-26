# nosql

* ## database name: team_cooperation
* ## Collections:
  * session
  ```json
  {
    "_id":"a069d46e-cb24-4d6b-95c4-848137a8b02e",
    "__v":0,
    "data":{
      "username":"username",
      "permissions":{
        "organization":{
          "id":"organization_id",
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
      },
      "_expire":1577468762314,
      "_maxAge":86400000
    },
    "updatedAt":"2019-12-26T17:46:02.315Z"
  }
  ```
