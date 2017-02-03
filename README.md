# BASE_URL

```
ciclo-pack.herokuapp.com
```

# login

```javascript
rota: /auth/login  POST
-----------------------
parametros: {
              email: string
              password: string (8..30)
            }
```
#### resposta exemplo

```javascript
{
    "email": "box_mo@hotmail.com",
    "id": 1,
    "name": "User 2",
    "reviews": [
        {
            "body": "Muito ruim, nota 10",
            "created_at": "2017-02-03T03:42:55.333Z",
            "id": 1,
            "rate": 10
        },
        {
            "body": "just wrong",
            "created_at": "2017-02-03T05:14:27.757Z",
            "id": 2,
            "rate": 5
        }
    ]
}
```

# Criar usuário

```javascript
rota: /auth/sign_up   POST
-----------------------
parametros: {
              name: string
              email: string
              password: string (8..30)
            }
```
#### resposta exemplo

```javascript
{
    "email": "mztbrum@gmail.com",
    "id": 2,
    "name": "boxmo",
    "reviews": []
}

```

# Produtos

### Buscar por codigo de barras

```javascript
rota: /products/{barcode} GET
-----------------------
parametros: { barcode: na url}
```
#### resposta exemplo
```javascript
{
    "avg_rate": 7.17,
    "id": 4,
    "logistics_rate": 6,
    "name": "Produto 1",
    "org": {
        "id": 1,
        "name": "Empresa teste"
    },
    "recycle_rate": 8,
    "reviews": [
        {
            "body": "Muito ruim, nota 10",
            "created_at": "2017-02-03T03:42:55.333Z",
            "id": 1,
            "rate": 10
        },
        {
            "body": "just wrong",
            "created_at": "2017-02-03T05:14:27.757Z",
            "id": 2,
            "rate": 5
        }
    ],
    "sku": "123465798"
}

obs: avg_rate é a nota média das três notas (reviews, recycle_rate e logistics_rate)

```

### Cadastrar produto

```javascript
rota: /products  POST
-----------------------
parametros: {
              name: string
              image: string (url da imagem)
              sku: string (barcode)
              recycle_rate: integer
              logistics_rate: integer
              org_id: integer (id da empresa)
            }
```
#### resposta exemplo

```javascript
{
    "avg_rate": 2.33,
    "id": 7,
    "logistics_rate": 5,
    "name": "Produto 2",
    "image": "http://google.com/logo.png",
    "org": {
        "id": 1,
        "name": "Empresa teste"
    },
    "recycle_rate": 2,
    "reviews": [],
    "sku": "987456123"
}
```

### deletar produto

```javascript
rota: /products/{barcode} DELETE
-----------------------
parametros { barcode: na url }
```
#### resposta exemplo

```javascript
{
    "message": "product is gone forever and never."
}
```

### REVIEWS

#### cadastrar review
```javascript
rota: /reviews POST
------------------
parametros: {
        user_id: integer (id do user)
        product_id: integer (id do produto)
        body: text
        rate: integer (nota do usuario para o produto)
      }
```
#### reposta exemplo
```javascript
{
    "body": "Produto reponsavel, reciclagem na veio",
    "created_at": "2017-02-03T10:34:30.003Z",
    "id": 3,
    "product": {
        "avg_rate": 7.33,
        "id": 4,
        "logistics_rate": 6,
        "name": "Produto 1",
        "recycle_rate": 8,
        "image": "http://google.com/logo.png",
        "sku": "123465798"
    },
    "rate": 9,
    "user": {
        "email": "box_mo@hotmail.com",
        "id": 1,
        "name": "User 2"
    }
}

```

### ORGS

#### cadastrar org

```javascript
rota: /orgs POST
---------------
parametros: {
  name: string,
  bio: text
}
```
#### resposta exemplo

```javascript
{
    "bio": "Empresa massa pra caramba. lugar de gente alegre",
    "id": 5,
    "name": "Fake org",
    "products": []
}

```
