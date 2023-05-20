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
<div> <a id="heading" href="/"><h1>InFact</h1></a>
</div>
<#--<form action="/login" method="post">-->
<#--    Email: <input type="email" name="username"/> <br><br>-->
<#--    Password: <input type="password" name="password"/> <br><br>-->
<#--    <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--    <input type="submit" value="Вход"/>-->
<#--</form>-->

<div class="container">
    <h4 class="mt-5 mb-4">Авторизация</h4>
    <form action="/login" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" class="form-control" id="email" name="username" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password:</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" class="btn btn-primary" value="Вход"/>
    </form>
</div>
</body>
</html>