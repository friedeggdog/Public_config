<html>
<head>
<title>LOGIN</title>
<style>
    body {
      background-color: #1e2124;
    }
    
    h1 {
      color: rgb(187, 187, 187);
      text-align: center;
    }

    #form {
        border: solid #424549 1px;  
        margin: 0;
        position: absolute;
        top: 50%;
        left: 50%;
        -ms-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        width: 20%;
        border-radius: 5px; 
        background: #36393e; 
        padding: 50px;
    }

    form  { display: table;      }
    p     { display: table-row;  }
    label { display: table-cell;
            color: rgb(187, 187, 187);
            padding:3px }
    #pass,#user { display: table-cell;
            border-radius: 3;
            background-color: #424549;
            border: none;
            color: rgb(187, 187, 187);}
    #btn{
        margin: auto;
        border-radius: 3px;
        background-color: #7289da;
        width: 75px;
        height: 30px;
        padding: 10px;
        border:none;
        color: rgb(187, 187, 187) ;
        font-size: 15px;
        font-weight: bold;
        line-height: 6px;
        box-sizing: border-box
    }

    input:focus, textarea {
        outline: none;
    }

</style>
</head>
<body>
    <div id="wrapper">
    <div id = "form">
        <h1>Login</h1>
        <form name="form1" action = "" onsubmit = "return required()" method = "POST">
            <p>
                <label class="cen"> Roll: </label>
                <input class="cen" type = "text" id = "user" name = "user" />
            </p>
            <p>
                <label class="cen"> Mess: </label>
                <input class="cen" type = "text" id = "roll" name = "roll" />
            </p>
        </form>
    </div>
    </div>
    <script>
            function required()
            {
                if(document.form1.user.value.length==0 || document.form1.roll.value.length==0) {
                    alert("Fields Empty");
                    return false;
                }
            }
    </script>
</body>
</html>