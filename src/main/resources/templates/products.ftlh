<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
          crossorigin="anonymous">
    <title> InFact </title>
    <style>
        #heading {
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body>
<#--    <h1>InFact</h1><hr>
<div> <a id="heading" href="/"><h1>InFact</h1></a>

<#if user.email??>
    <h3>Имя админа: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Выйти"/>
    </form>
<#else>
    <a href="/login"><button type="button" class="btn btn-outline-light">Войти как администратор</button></a>
</#if>
</div>-->
<div class="d-flex justify-content-between align-items-center">
    <a id="heading" href="/">
        <h1>InFact</h1>
    </a>
    <div>
        <#if user.email??>
            <div class="d-flex align-items-center justify-content-between">
                <h5 class="me-3">Имя админа: <i>${user.name}</i></h5>
                <div class="d-flex align-items-center">
                    <div class="container">
                        <a href="/registration" class="btn btn-primary">Добавить админа</a>
                    </div>
                    <form action="/logout" method="post" class="ms-3">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" value="Выйти" class="btn btn-outline-secondary">
                    </form>
                </div>
            </div>

        <#else>
            <a href="/login"><button type="button" class="btn btn-light">Войти как администратор</button></a>
        </#if>
    </div>
</div>
<hr>
<h3>Напитки и закуски</h3>
<#--    <form action="/" method="get">-->
<#--        Поиск по названию: <input type="text" name="title"/> <br><br>-->
<#--        <input type="submit" value="Поиск"/>-->
<#--    </form>-->
<nav class="navbar navbar-light bg-light">
    <div class="container-fluid">
        <form action="/" method="get" class="d-flex">
            <input class="form-control me-2" type="search" placeholder="Поиск" aria-label="Поиск" name="title">
            <button class="btn btn-outline-success" type="submit">Поиск</button>
        </form>
    </div>
</nav>
<hr>
<div class="row row-cols-1 row-cols-md-3 g-4">
    <#list products as product>
        <div class="col">
            <div class="card card-body h-100" style="max-width: 18rem;">
                <#if product.nameOfFile??>
                    <div class="ratio ratio-1x1">
                        <img src="/img/${product.nameOfFile}" class="card-img-top img-fluid" alt="Изображение товара" style="max-height: 200px; object-fit: cover;">
                    </div>
                </#if>
                <div class="card-body">
                    <h5 class="card-title">${product.title}</h5>
                    <p class="card-text">${product.price} руб.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="/product/${product.id}" class="btn btn-primary">Подробнее</a>
                        <#if user.email??>
                            <form action="/product/delete/${product.id}" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <button type="submit" class="btn btn-danger">Удалить</button>
                            </form>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    <#else>
        <h3>Товаров нет(</h3>
    </#list>
</div>
<#--     user.getRoles() == "ROLE_ADMIN"-->
<#if user.email??>
    <hr>
    <div class="container">
        <h3 class="mt-5 mb-4">Создать новый товар</h3>
        <form action="/product/create" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="productTitle" class="form-label">Название продукта:</label>
                <input type="text" class="form-control" id="productTitle" name="title" required>
            </div>
            <div class="mb-3">
                <label for="productDescription" class="form-label">Описание продукта:</label>
                <input type="text" class="form-control" id="productDescription" name="description" required>
            </div>
            <div class="mb-3">
                <label for="productPrice" class="form-label">Цена:</label>
                <input type="number" class="form-control" id="productPrice" name="price" required>
            </div>
            <div class="mb-3">
                <label for="productAuthor" class="form-label">Тип:</label>
                <input type="text" class="form-control" id="productAuthor" name="author" required>
            </div>
            <div class="mb-3">
                <label for="productPhoto1" class="form-label">Первая фотография:</label>
                <input type="file" class="form-control" id="productPhoto1" name="file1" required>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" class="btn btn-primary" value="Сохранить"/>
        </form>
    </div>
</#if>
</body>
</html>