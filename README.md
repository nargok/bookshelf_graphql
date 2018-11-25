# README
GraphQLの練習用プロジェクト

## Queryの例

```
{
  authors {
    id
    full_name
  }
}
```

## Mutationの例

```
mutation {
  createAuthorByEachField(first_name: "FirstName", last_name: "LastName", yob: 1587, is_alive:false) {
    id
    full_name
  }
}
```

```
mutation createAuthor($first_name:String, $last_name:String, $yob:Int, $is_alive:Boolean){
  createAuthorByEachField(first_name: $first_name, last_name: $last_name, yob: $yob, is_alive:$is_alive) {
    id
    full_name
  }
}

# variables
{
  "first_name": "FirstName",
  "last_name": "LastName",
  "yob": 1978,
  "is_alive": true
}
```

```
mutation createAuthor($author: AuthorInputType!) {
  createAuthor(author: $author) {
    id
    full_name
  }
}

# variable
{ "author": {
  "first_name": "FirstName",
  "last_name": "LastName",
  "yob": 1978,
  "is_alive": true
  }
}
```

```
mutation updateAuthor($author:AuthorInputType!) {
  updateAuthor(author:$author) 
}
```

```
mutation {
  deleteAuthor(id: 4)
}
```

```
mutation createAuthor($author: AuthorInputType!) {
  createAuthor(author: $author) {
    errors {
      field_name
      errors
    }
  }
}
```

## Login
```
{
  login(email: "a@b.c", password: "1")
}
```

## currentUser
HTTP HeaderにAuthorizationをつけて↓を実行
```
{
  currentUser {
    id
    email
    is_superadmin
  }
}
```
