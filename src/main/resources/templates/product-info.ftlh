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
<div class="container mt-4">
            <div>
                <a id="heading" href="/"><h1>InFact</h1></a>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <#if product.nameOfFile??>
                        <img src="/img/${product.nameOfFile}" class="img-fluid" alt="Изображение товара"/>
                    </#if>
                </div>
                <div class="col-md-8">
                    <p class="lead"><b>Название: </b> ${product.title}</p>
                    <p class="lead"><b>Описание: </b> ${product.description}</p>
                    <p class="lead"><b>Цена: </b> ${product.price} руб.</p>
                    <p class="lead"><b>Тип: </b> ${product.author}</p>
                    <hr>

<#--                    <form action="/product/delete/${product.id}" method="post">-->
<#--                        <button type="submit" class="btn btn-danger">Удалить</button>-->
<#--                    </form>-->

                </div>
            </div>
</div>
</body>
</html>