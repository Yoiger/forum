
     var topic=[
     ["C","C++","JAVA","Android"],
     ["求问","答疑"],
     ["新人","杂谈","搬砖","愤青","吐槽"]
     ];
 
     function getTopic(){
         //获得Section下拉框的对象
         var sltSection = document.form.sectionname;
         //获得Topic下拉框的对象
         var sltTopic= document.form.topic;
         
         var SC = topic[sltSection.selectedIndex - 1];
 
         //清空topic下拉框，仅留提示选项
         sltTopic.length=1;
 
         //将topic数组中的值填充到topic下拉框中
         for(var i=0;i<SC.length;i++){
             sltTopic[i+1]=new Option(SC[i], SC[i]);
         }     }