const addMainCateBtn = document.querySelector(".add-cate-btn");
const addSubCateBtn = document.querySelector(".add-sub-cate-btn");
const deleteCateBtn = document.querySelector(".delete-cate-btn");
const switchCateBtn = document.querySelector(".switch-cate-btn");
const cateInput = document.querySelector(".cate-input");
const finalSaveBtn = document.querySelector(".save-cate-btn");

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
	if(data != ""){
		for(let i = 0; i < data.length; i++){
		innr += `
			<div class="cate-main-box">
			    <div class="cate-main-title" id="${data[i].index}">
			        <span class="main-title-text">${data[i].name}</span>
			    </div>
			    <div class="cate-sub-box"></div>
			</div>
		`;
		}
		innerBody.innerHTML = innr;
		const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
		const subInnerBoxs = document.querySelectorAll(".cate-sub-box");
		subInnerFun(subInnerBoxs, data);
		mainClickEvent();
		subClickEvent();
		addSubCateBtnClick(mainTitleBoxs, subInnerBoxs);
	}
	addMainCateBtnClick(innerBody);
}

function subInnerFun(boxs, data){
	for(let i = 0; i < data.length; i++){
		let innr = "";
		if(data[i].subList != null){
			for(let k = 0; k < data[i].subList.length; k++){
				innr += `
					<div class="cate-sub-title" id="${data[i].subList[k].mainIndex}">
				        <span class="sub-title-text" id="${data[i].subList[k].index}">${data[i].subList[k].name}</span>
				    </div>
				`;
			}
			boxs[i].innerHTML = innr;
			const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
			const subTitleBoxs = document.querySelectorAll(".cate-sub-title");
			switchCateBtnClick(boxs[i], mainTitleBoxs, subTitleBoxs);
		}
	}
}

function switchCateBtnClick(innerBox, mainBoxs, subBoxs){
	switchCateBtn.onclick = () => {
		cateInput.value = "";
		if(innerBox.innerHTML != ""){
			borderBlack(mainBoxs);
			if(subBoxs != ""){
				borderBlack(subBoxs);
			}
		}
	}
}

function mainClickEvent(){
	const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
	const mainTitleTexts = document.querySelectorAll(".main-title-text");
	const subInnerBoxs = document.querySelectorAll(".cate-sub-box");
	for(let i = 0; i < mainTitleBoxs.length; i++){
		mainTitleBoxs[i].onclick = () => {
			borderBlack(mainTitleBoxs);
			mainTitleBoxs[i].style.border = "1px solid red";
			//서브 카테고리 있는지 체크하고 있으면 black
			let flag = 0;
			for(let k = 0; k < subInnerBoxs.length; k++){
				if(subInnerBoxs[k].innerHTML != ""){
					flag++;
				}
			}
			if(flag != 0){
				const subTitleBoxs = document.querySelectorAll(".cate-sub-title");
				borderBlack(subTitleBoxs);
			}
			
			cateInput.value = mainTitleTexts[i].textContent;
			titleChangeEvent(mainTitleBoxs[i], mainTitleTexts[i]);
			deleteCateBtnClick(innerBody, mainTitleBoxs, "");
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
			mainTitleBox.style.border = "1px solid red";
			
			cateInput.value = subTitleTexts[i].textContent;
			titleChangeEvent(subTitleBoxs[i], subTitleTexts[i]);
			let deleteCheck = 999;
			for(let k = 0; k < mainTitleBoxs.length; k++){
				if(mainTitleBoxs[k].style.border == "1px solid red"){
					deleteCheck = k;
				}
			}
			if(deleteCheck != 999){
				deleteCateBtnClick(innerBody, mainTitleBoxs, subTitleBoxs[i]);
			}
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

function addMainCateBtnClick(innerBody){
	addMainCateBtn.onclick = () => {
		addMainCategory(innerBody);
		const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
		const subInnerBoxs = document.querySelectorAll(".cate-sub-box");
		addSubCateBtnClick(mainTitleBoxs, subInnerBoxs);
		switchCateBtnClick(innerBody, mainTitleBoxs, "");
		//deleteCateBtnClick(innerBody, mainTitleBoxs, "");
	}
}

function addSubCateBtnClick(mainTitleBoxs, subInnerBoxs){
	addSubCateBtn.onclick = () => {
		let mainClickCheck = 999;
		for(let i = 0; i < mainTitleBoxs.length; i++){
			if(mainTitleBoxs[i].style.border == "1px solid red"){
				mainClickCheck = i;
			}
		}
		if(mainClickCheck == 999){
			alert("메인 카테고리를 선택해주세요!");
			return;
		}else{
			addSubCategory(subInnerBoxs[mainClickCheck]);
		}
	}
}

function addMainCategory(innerBody){
	let innr = innerBody.innerHTML;
	innr += `
		<div class="cate-main-box">
		    <div class="cate-main-title" id="999">
		        <span class="main-title-text">메인 카테고리</span>
		    </div>
		    <div class="cate-sub-box"></div>
		</div>
	`;
	innerBody.innerHTML = innr;
	mainClickEvent();
	const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
	newBorderRed(mainTitleBoxs);
}

function addSubCategory(innerBody, mainId){
	let innr = innerBody.innerHTML;
	innr += `
		<div class="cate-sub-title" id="${mainId}">
	        <span class="sub-title-text" id="999">서브 카테고리</span>
	    </div>
	`;
	innerBody.innerHTML = innr;
	mainClickEvent();
	subClickEvent();
}

function newBorderRed(boxs){
	borderBlack(boxs);
	boxs[boxs.length - 1].style.border = "1px solid red";
}

function deleteCateBtnClick(innerBody, mainBoxs, subBoxs){
	deleteCateBtn.onclick = () => {
		if(innerBody.innerHTML != ""){
			if(subBoxs == ""){
				let deleteCheck = 999;
				for(let i = 0; i < mainBoxs.length; i++){
					if(mainBoxs[i].style.border == "1px solid red"){
						deleteCheck = i;
					}
				}
				if(deleteCheck == 999){
					alert("삭제 할 카테고리를 선택해주세요!111111");
					return;
				}else{
					const subInnerBoxs = document.querySelectorAll(".cate-sub-box");
					if(subInnerBoxs[deleteCheck].innerHTML != ""){
						alert("서브 카테고리를 먼저 삭제해주세요!");
						return;
					}else{
						if(deleteCategoryApiFun(mainBoxs[deleteCheck].id, "main")){
							mainBoxs[deleteCheck].parentElement.remove();
							alert("삭제되었습니다.");
						}
					}
				}
			}else{
				if(subBoxs.style.border != "1px solid red"){
					alert("삭제 할 카테고리를 선택해주세요!2222");
					return;
				}else{
					if(subBoxs.parentElement.querySelectorAll(".cate-sub-title").length == 1){
						const subTitleText = subBoxs.querySelector(".sub-title-text");
						if(deleteCategoryApiFun(subTitleText.id, "sub")){
							const mainDiv = subBoxs.parentElement;
							mainDiv.replaceChildren();
							//mainDiv.remove();
							alert("삭제되었습니다.");
						}
					}else{
						console.log("2222222걸림??");
						const subTitleText = subBoxs.querySelector(".sub-title-text");
						if(deleteCategoryApiFun(subTitleText.id, "sub")){
							subBoxs.remove();
							alert("삭제되었습니다.");
						}
					}
				}
			}
		}
	}
}

function deleteCategoryApiFun(id, checkTitle){
	let flag = false;
	if(id == 999){
		return true;
	}else{
		$.ajax({
			type : "delete",
			url : "/board/api/remove",
			async : false,
			data : {
				id : id,
				checkTitle : checkTitle
			},
			success : function(data){
				if(data == true){
					flag = true;
				}
			},
			error : function(){
				alert("에러");
			}
		});
	}
	return flag;
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














