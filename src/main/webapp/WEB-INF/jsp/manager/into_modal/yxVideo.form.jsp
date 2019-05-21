<iframe  NAME="content_frame" id="video" width=100% style="min-height:900px;border: 0"  marginwidth=0 marginheight=0  ></iframe>
<script src="im/js/util.js"></script>
<script src="im/js/md5.js"></script>
<script type="text/javascript">

    setCookie('uid', '13703452740');
    var password = MD5('13703452740');
    setCookie('sdktoken', password);

    // window.location.href = './main.html';
    window.onload=function(){
        function login(){
            //测试界面频繁刷新的原因是因为下面的没有注释
            /*window.deleteCookie();*/
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/yx/login.do",
                dataType: "json",
                success: function(res){
                    console.log("登陆接口返回->"+JSON.stringify(res));
                    if(res.success){
                    /*    setCookie('uid',res.data.auditAccid);
                        setCookie('sdktoken',res.data.auditToken);*/
                        setCookie('data_refresh',JSON.stringify(res.data));
                        $("#video").attr("src", "${pageContext.request.contextPath}/manager/im/main.html?time="+new Date().getTime());
                    }else{
                        alert(res.message);
                    }
                }
            });
        }
        login();
    }
</script>