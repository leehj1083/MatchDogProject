<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>

.filebox .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 80px;
    color: #999999;
}

.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    width: 55px;
    height: 10px;
    margin-left: 10px;
    font-size: small;
}

.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}


#imgtable {
border: 1px solid black;
}
#imgtable td,tr{
border: 1px solid black;
}
#imgtable td{
width: 300px;
height: 200px;
}

textarea style ="resize: both ;"> </textarea>.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 500px;
	height: 500px;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.7);
}

.modal-content {
	display: none;

}

.modal.active .modal-content {
	display: block;
	
}

.modal-content {
	background-color: #fff;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 70%;
}


.close {
	color: #888;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>



	<form action="profileSave.do" method="post" id="myForm">
	
         <input type="button" name="imgBtn" value="사진 선택">
       
         <div id="newModal" class="modal">
    <div class="modal-content">
        <span class="close" id="closeNewModal">&times;</span>
        <!-- 모달 내용 추가 -->
        <h3>사진 추가 팝업창 입니다.</h3>
        <table id = "imgtable">
        <tr>
        <td>
       <div id="imageContainer1"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file1">사진추가</label> 
    <input type="file" id="file1" name="photos">
</div>
        </td>
        <td>
       <div id="imageContainer2"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file2">사진추가</label> 
    <input type="file" id="file2" name="photos2">
</div>
        </td>
        <td>
       <div id="imageContainer3"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file3">사진추가</label> 
    <input type="file" id="file3" name="photos3">
</div>
        </td>
        </tr>        
        <tr>
        <td>
      <div id="imageContainer4"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file4">사진추가</label> 
    <input type="file" id="file4" name="photos4">
</div>
        </td>
        <td>
       <div id="imageContainer5"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file5">사진추가</label> 
    <input type="file" id="file5" name="photos5">
</div>
        </td>
        <td>
        <div id="imageContainer6"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file6">사진추가</label> 
    <input type="file" id="file6" name="photos6">
</div>
        </td>
        </tr>
        <tr>
        <td>
        <div id="imageContainer7"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file7">사진추가</label> 
    <input type="file" id="file7" name="photos7">
</div>
        </td>
        <td>
       <div id="imageContainer8"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file8">사진추가</label> 
    <input type="file" id="file8" name="photos8">
</div>
        </td>
        <td>
        <div id="imageContainer9"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file9">사진추가</label> 
    <input type="file" id="file9" name="photos9">
</div>
        </td>
        </tr>
        </table>
        <button type="button" id="selectComplete">선택 완료</button>
    </div>
</div>
         
		

					<button>등록 완료</button>
			

	</form>

</body>
<script>
document.addEventListener("DOMContentLoaded", function () {
   
    var imageInput = document.getElementById("imageInput");
    var newModal = document.getElementById("newModal");
    var openNewModalButton = document.getElementsByName("imgBtn")[0];
    var closeNewModalButton = document.getElementById("closeNewModal");
    
    
   
   openNewModalButton.addEventListener("click", function () {
	   document.getElementById("newModal").style.display = "block";
    
         });

    closeNewModalButton.addEventListener("click", function () {
    	 document.getElementById("newModal").style.display = "none";
    	 
    	 
         var imageContainers = document.querySelectorAll(".modal-content div[id^='imageContainer']");
         imageContainers.forEach(function (container) {
             container.innerHTML = "";
         });

         
         var imageInputs = document.querySelectorAll(".modal-content input[type='file']");
         imageInputs.forEach(function (input) {
             input.value = "";
         });
    	 
    		 var fileInputs = document.querySelectorAll('input[type="file"]');
         for (var i = 0; i < fileInputs.length; i++) {
             fileInputs[i].value = "";
         }
        
    	 
    });
    
    var selectCompleteButton = document.getElementById("selectComplete");
    selectCompleteButton.addEventListener("click", function () {
        document.getElementById("newModal").style.display = "none";
    });
    
    
    
    openNewModalButton.addEventListener("click", function () {
        document.getElementById("newModal").classList.add('active');
    });

    // 모달을 숨기려면 .modal 요소에서 'active' 클래스를 제거합니다.
    closeNewModalButton.addEventListener("click", function () {
        document.getElementById("newModal").classList.remove('active');
    });
    


    var imageInput1 = document.getElementById("file1");
    var imageContainer1 = document.getElementById("imageContainer1");

    imageInput1.addEventListener("change", function () {
        imageContainer1.innerHTML = ""; 

        var files = imageInput1.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageElement = document.createElement("img");
            imageElement.src = URL.createObjectURL(file);
            imageElement.style.maxWidth = "150px";
            imageElement.style.maxHeight = "150px";
            imageContainer1.appendChild(imageElement);
        }
    });
 
    var imageInput2 = document.getElementById("file2");
    var imageContainer2 = document.getElementById("imageContainer2");

    imageInput2.addEventListener("change", function () {
        imageContainer2.innerHTML = ""; 

        var files = imageInput2.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageElement = document.createElement("img");
            imageElement.src = URL.createObjectURL(file);
            imageElement.style.maxWidth = "150px";
            imageElement.style.maxHeight = "150px";
            imageContainer2.appendChild(imageElement);
        }
    });
    
    var imageInput3 = document.getElementById("file3");
    var imageContainer3 = document.getElementById("imageContainer3");

    imageInput3.addEventListener("change", function () {
        imageContainer3.innerHTML = ""; 

        var files = imageInput3.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageElement = document.createElement("img");
            imageElement.src = URL.createObjectURL(file);
            imageElement.style.maxWidth = "150px";
            imageElement.style.maxHeight = "150px";
            imageContainer3.appendChild(imageElement);
        }
    });
    var imageInput4 = document.getElementById("file4");
    var imageContainer4 = document.getElementById("imageContainer4");

    imageInput4.addEventListener("change", function () {
        imageContainer4.innerHTML = "";

        var files = imageInput4.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageElement = document.createElement("img");
            imageElement.src = URL.createObjectURL(file);
            imageElement.style.maxWidth = "150px";
            imageElement.style.maxHeight = "150px";
            imageContainer4.appendChild(imageElement);
        }
    });
    
    var imageInput5 = document.getElementById("file5");
    var imageContainer5 = document.getElementById("imageContainer5");

    imageInput5.addEventListener("change", function () {
        imageContainer5.innerHTML = ""; 

        var files = imageInput5.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageElement = document.createElement("img");
            imageElement.src = URL.createObjectURL(file);
            imageElement.style.maxWidth = "150px";
            imageElement.style.maxHeight = "150px";
            imageContainer5.appendChild(imageElement);
        }
    });
    
    var imageInput6 = document.getElementById("file6");
    var imageContainer6 = document.getElementById("imageContainer6");

    imageInput6.addEventListener("change", function () {
        imageContainer6.innerHTML = ""; 

        var files = imageInput6.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageElement = document.createElement("img");
            imageElement.src = URL.createObjectURL(file);
            imageElement.style.maxWidth = "150px";
            imageElement.style.maxHeight = "150px";
            imageContainer6.appendChild(imageElement);
        }
    });
    var imageInput7 = document.getElementById("file7");
    var imageContainer7 = document.getElementById("imageContainer7");

    imageInput7.addEventListener("change", function () {
        imageContainer7.innerHTML = ""; 

        var files = imageInput7.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageElement = document.createElement("img");
            imageElement.src = URL.createObjectURL(file);
            imageElement.style.maxWidth = "150px";
            imageElement.style.maxHeight = "150px";
            imageContainer7.appendChild(imageElement);
        }
        
    });
    
    var imageInput8 = document.getElementById("file8");
    var imageContainer8 = document.getElementById("imageContainer8");

    imageInput8.addEventListener("change", function () {
        imageContainer8.innerHTML = ""; 

        var files = imageInput8.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageElement = document.createElement("img");
            imageElement.src = URL.createObjectURL(file);
            imageElement.style.maxWidth = "150px";
            imageElement.style.maxHeight = "150px";
            imageContainer8.appendChild(imageElement);
        }
    });
    
    var imageInput9 = document.getElementById("file9");
    var imageContainer9 = document.getElementById("imageContainer9");

    imageInput9.addEventListener("change", function () {
        imageContainer9.innerHTML = ""; 

        var files = imageInput9.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageElement = document.createElement("img");
            imageElement.src = URL.createObjectURL(file);
            imageElement.style.maxWidth = "150px";
            imageElement.style.maxHeight = "150px";
            imageContainer9.appendChild(imageElement);
        }
    });
});
</script>
</html>