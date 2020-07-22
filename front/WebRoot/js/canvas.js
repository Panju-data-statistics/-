var tree = document.getElementById("tree");
        tree.width = window.innerWidth;
        tree.height = window.innerHeight ;
        var tCxt = tree.getContext("2d");
        var flower = document.getElementById("flower");
        flower.width = window.innerWidth;
        flower.height = window.innerHeight ;
        var cxt = flower.getContext("2d");
        
        var flowerList = [];//ӣ���б�
        var rootTop = 450 ;//�����
        var flowerColor = "rgba(255,192,203,.3)" ;//��ɫ
        var flowerColorDeep = "rgba(241,158,194,.6)" ;//��ɫ��
        var treeColor2 ="rgba(0,0,0,0)" ;//��֦��ɫ
        var treeColor = "rgba(0,0,0,0)" ;//������ɫ
        var fallList = [];//Ʈ��ӣ���б�
        var g = 0.01 ;//�������ٶ�
        var gWind = 0.001;//�������ٶ�
        var limitSpeedY = 1;//�ٶ�����
        var limitSpeedX = 0.5 ;//�ٶ�����
        
        cxt.shadowColor= "#FFF" ;
        cxt.shadowBlur = 10 ;
        
        function drawTree(x,y,deg,step,type){
            var deg1 = step%2 == 0 ? 0.1 : -0.1 ;
            var x1 = x + Math.cos(deg+deg1) * (step+4) * 0.8 ;//�Բ������ж�֦�ɳ��� x��ƫ�ƴ�һЩ
            var y1 = y + Math.sin(deg+deg1) * (step-1) * 0.8 ;//�Բ������ж�֦�ɳ��� Y��ѹ��һЩ
            tCxt.beginPath();
            tCxt.lineWidth = step/3;
            tCxt.moveTo(x,y);
            tCxt.lineTo(x1,y1);
            tCxt.strokeStyle = (step > 5 ) ? treeColor : treeColor2 ;//ϸֽ�������ɻ�����ɫ
            tCxt.stroke();
            if(step > 20){//�����ཻ��λ���м�϶����һ��Բ���
                tCxt.fillStyle = treeColor ;
                tCxt.arc(x,y,step/6,0,Math.PI*2);
                tCxt.fill();
            }
            if(step < 3 || (step < 23 && Math.random() > 0.1)){
                //ĩ��λ�� ������
                var color = [flowerColorDeep,flowerColor,flowerColor][Math.round(Math.random()+0.2)] ;
                var r = 3+Math.random()*2
                tCxt.fillStyle = "rgba(0,0,0,0)" ;
                tCxt.arc(x1+Math.random()*3,y1+Math.random()*3,r,0,Math.PI)
                tCxt.fill();
                flowerList.push({x:Math.random()*flower.width,y:0,sx:(Math.random()-0.5),sy:0,color:color,r:r,deg:deg});//�����»�ӣ����λ��
            }
            step -- ;
            if(step > 0){
                drawTree(x1,y1,deg,step,type);
                if(step%3 == 1 && step > 0 && step < 30)
                    drawTree(x1,y1,deg+0.2 + 0.3 * Math.random(),Math.round(step/1.13));//�ҷֲ�
                if(step%3 == 0 && step > 0 && step < 30)
                    drawTree(x1,y1,deg-0.2 - 0.3 * Math.random(),Math.round(step/1.13));//��ֲ�
            }
        }
        // flowerList.push({x:Math.random()*flower.width,y:0,sx:(Math.random()-0.5),sy:0,color:color,r:r,deg:deg});
        
        drawTree(tree.width/2,rootTop,-Math.PI/2,30,1);//ִ��
        
        var len = flowerList.length ;
        function step(){
            // flowerList.push({x:Math.random()*flower.width,y:0,sx:(Math.random()-0.5),sy:0,color:color,r:r,deg:deg});
            if(Math.random() > 0.3)    fallList.push(flowerList[Math.floor(Math.random()*len)]);//���ȡ��һ�������긴�Ƶ�Ʈ�仨����б���
        
            cxt.clearRect(0,0,flower.width,flower.height);
            for(var i = 0 ;i < fallList.length ; i ++){
                if(fallList[i].sy < limitSpeedY) fallList[i].sy += g ;
                fallList[i].sx += gWind ;
                fallList[i].x += fallList[i].sx ;
                fallList[i].y += fallList[i].sy ;
                if(fallList[i].y > flower.height){//Ʈ�������Ļ����Ƴ�
                    fallList.splice(i,1);
                    i -- ;
                    continue ;
                }
                cxt.beginPath();
                cxt.fillStyle = fallList[i].color ;
                fallList[i].deg += fallList[i].sx*0.05 ;//���ٶ���ص���ת����
                cxt.arc(fallList[i].x,fallList[i].y,fallList[i].r,fallList[i].deg,fallList[i].deg+Math.PI*1.3);
                cxt.fill();
            }
            requestAnimationFrame(step);
        }
        requestAnimationFrame(step);