 $(function(){

    //1. 简单写法：
    $("#form1").validation();
   
    //.注册
    $("#submit1").on('click',function(event){
      // 2.最后要调用 valid()方法。
      //  valide(object,msg),提示信息显示，object位置后面增加提示信息。如不填object 则自动找最后一个button submit.
      //  valide(msg)
      if ($("#form1").valid(this,'填写信息不完整。')==false){
        return false;
      }
    })

    $("#form2").validation();
    //.注册
    $("#submit2").on('click',function(event){
      // 2.最后要调用 valid()方法。
      if ($("#form2").valid()==false){
        alert('填写信息不完整。');
        return false;
      }
    });


    $("#form3").validation();
    //.注册
    $("#submit3").on('click',function(event){
      // 2.最后要调用 valid()方法。
      if ($("#form3").valid('填写信息不完整。')==false){
        //alert('填写信息不完整。');
        return false;
      }
    });

  })