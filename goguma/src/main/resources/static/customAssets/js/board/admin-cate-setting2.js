const addMainCateBtn = document.querySelector(".add-cate-btn");
const addSubCateBtn = document.querySelector(".add-sub-cate-btn");
const deleteCateBtn = document.querySelector(".delete-cate-btn");
const switchCateBtn = document.querySelector(".switch-cate-btn");
const cateInput = document.querySelector(".cate-input");
const finalSaveBtn = document.querySelector(".save-cate-btn");

const modifyBtn = document.querySelector(".cate-modify-btn");
const deleteBtn = document.querySelector(".cate-delete-btn");

const innerBody = document.querySelector(".cate-box");

load();
function load(){
	$.ajax({
		type : "get",
		url : "/board/api/list",
		success : function(data){
			if(data != ""){
				innerFun(data);
			}
		},
		error : function(){
			alert("에러");
		}
	});
}

function innerFun(data){
	let innr = "";
	for(let i = 0; i < data.length; i++){
		innr += `
			<div class="cate-main-box" id="${data[i].index}">
			    <div class="cate-main-title">
			        <span class="main-title-text">${data[i].name}</span>
			    </div>
			    <div class="cate-sub-box"></div>
			</div>
		`;
	}
	innerBody.innerHTML = innr;
	const subInnerBoxs = document.querySelectorAll(".cate-sub-box");
	subInnerFun(subInnerBoxs, data);
	mainClickEvent();
	subClickEvent();
}

function subInnerFun(boxs, data){
	for(let i = 0; i < data.length; i++){
		let innr = "";
		for(let k = 0; k < data[i].subList.length; k++){
			innr += `
				<div class="cate-sub-title" id="${data[i].subList[k].mainIndex}">
			        <span class="sub-title-text" id="${data[i].subList[k].index}">${data[i].subList[k].name}</span>
			    </div>
			`;
		}
		boxs[i].innerHTML = innr;
	}
}

function mainClickEvent(){
	const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
	const mainTitleTexts = document.querySelectorAll(".main-title-text");
	for(let i = 0; i < mainTitleBoxs.length; i++){
		mainTitleBoxs[i].onclick = () => {
			borderBlack(mainTitleBoxs);
			mainTitleBoxs[i].style.border = "1px solid red";
			cateInput.value = mainTitleTexts[i].textContent;
			titleChangeEvent(mainTitleBoxs[i], mainTitleTexts[i]);
		}
	}
}

function subClickEvent(){
	const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
	const subTitleBoxs = document.querySelectorAll(".cate-sub-title");
	const subTitleTexts = document.querySelectorAll(".sub-title-text");
	for(let i = 0; i < subTitleBoxs.length; i++){
		subTitleBoxs[i].onclick = () => {
			borderBlack(mainTitleBoxs);
			borderBlack(subTitleBoxs);
			subTitleBoxs[i].style.border = "1px solid red";
			let mainTitleBox = subTitleBoxs[i].parentElement.parentElement.querySelector(".cate-main-title");
			console.log(mainTitleBox);
			mainTitleBox.style.border = "1px solid red";
			
			cateInput.value = subTitleTexts[i].textContent;
			titleChangeEvent(subTitleBoxs[i], subTitleTexts[i]);
		}
	}
}

function borderBlack(list){
	for(let i = 0; i < list.length; i++){
		list[i].style.border = "1px solid black";
	}
}

function titleChangeEvent(box, text){
	cateInput.onkeyup = () => {
		if(box.style.border == "1px solid red"){
			text.textContent = cateInput.value;
		}
	}
}

//=======================================================================================================================================================================
finalSaveBtn.onclick = () => {
	const mainTitles = document.querySelectorAll(".main-title-text");
	const subBoxs = document.querySelectorAll(".cate-sub-box");
	
	const finalMainArray = new Array();
	for(let i = 0; i < mainTitles.length; i++){
		let mainObj = {
			index : null,
			name : "",
			subList : null
		};
		mainObj.name = mainTitles[i].textContent;
		mainObj.index = i;
		const finalSubArray = new Array();
		if(subBoxs[i].innerHTML != ""){
			const subTitles = subBoxs[i].querySelectorAll(".sub-title-text");
		
			for(let k = 0; k < subTitles.length; k++){
				let subObj = {
					index : null,
					mainIndex : null,
					name : ""
				};
				subObj.name = subTitles[k].textContent;
				subObj.index = k;
				subObj.mainIndex = i;
				finalSubArray.push(subObj);
			}// for(let k
			mainObj.subList = finalSubArray;
			finalMainArray.push(mainObj);
		}else{
			finalMainArray.push(mainObj);
		}
	}// for(let i
	console.log("최종", finalMainArray);
	let formData = new FormData();
    formData.append("cateList", new Blob([JSON.stringify(finalMainArray)], {type: "application/json"}));
	$.ajax({
		type : "post",
		url : "/board/api/category/add",
		contentType : false,
		processData: false,
		data : formData,
		success : function(data){
			if(data == true){
				alert("등록완료!");
			}
		},
		error : function(){
			alert("에러");
		}
	});
}















