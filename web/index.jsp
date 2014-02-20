
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="img/mobile.png" rel="shortcut icon" type="image/x-icon" />
        <title>เข้าสู่ระบบ</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.css" rel="stylesheet" media="screen">
        <link href="css/style.css" rel="stylesheet" media="screen">
        <link href="css/bootstrap-responsive.css" rel="stylesheet" media="screen">
        <script type="text/javascript" src="jquery/js/jquery.js"></script>
        <script type="text/javascript">
            $(function() {
                $("#username").keyup(function() {
                    var username = $(this).val();
                    if (isFinite(username)) {
                        $("#error").css("color", "red").text("กรุณากรอกชื่อผู้ใช้งานและรหัสผ่านให้ถูกต้อง");
                    }

                });
                $("#cmdLogin").click(function() {
                    //เอาค่าในปุ่มtextมาเก็บไว้ในตัวเเปร
                    var input_username = $("#username").val();
                    var input_password = $("#password").val();
                    //ส่งตัวแปรทั้ง2ไปservletชื่อUserServlet.javaเเละไปยังmethodชื่อcheckLogin
                    $.ajax({
                        url: "controller.UserServlet?checkLogin",
                        //ระบุข้อมูลที่จะส่งไปยังservlet ข้อมูลที่ส่งไปก็คือตัวแปรนั่นเเหละ
                        data: {
                            username: input_username,
                            password: input_password
                        },
                        //เมื่อservletประมวลผลเสร็จเเล้วมันresponseอะไรกลับมามันจะทำตรงนี้
                        success: function(data) {
                            if (data == "pass") {
                                location.href = "home.jsp";
                            }
                            else {
                                $("#error").css("color", "red").text("กรุณากรอกชื่อผู้ใช้งานและรหัสผ่านให้ถูกต้อง");
                            }
                        }
                    });
                });
            });
        </script>
    </head>
    <body style="background-color:whitesmoke" >  
        <div class="container-fluid" style="margin-top: 100px" b>
            <div class="row span4" >
                <div class="span4 offset4 well" style="background-color: snow">
                    <legend style="font-size: medium ; text-align: center; color: black"><i class="icon-user"></i> กรุณาล็อกอินเพื่อเข้าสู่ระบบ</legend>
                    <div class="alert alert-info" id="error">
                        <a class="close" data-dismiss="alert" href="#">×</a><font style="color:#00bce1"> <i class="icon-pencil"></i> กรอกข้อมูลเพื่อเข้าสู่ระบบ</font>
                    </div>
                    <br>
                    <input type="text" id="username" class=" span4 text-info"  name="username" placeholder="ชื่อผู้ใช้งาน">
                    <input type="password" id="password" class="span4 text-info" name="password" placeholder="รหัสผ่าน">
                    <div align="center">
                        <button type="submit" name="submit" class="btn btn-success btn-medium" id="cmdLogin" style="height: 40px  ;width: 110px;"><i class="icon-hand-up"></i> เข้าสู่ระบบ</button>
                        <button type="reset" name="cancel" class="btn btn-warning btn-medium"  id="cmdLogin" style="height: 40px ;width: 110px;"><i class="icon-thumbs-down"></i> ยกเลิก</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>