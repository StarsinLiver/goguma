const addMainCateBtn = document.querySelector(".add-cate-btn");
const addSubCateBtn = document.querySelector(".add-sub-cate-btn");
const deleteCateBtn = document.querySelector(".delete-cate-btn");
const switchCateBtn = document.querySelector(".switch-cate-btn");
const cateInput = document.querySelector(".cate-input");
const finalSaveBtn = document.querySelector(".save-cate-btn");
const innerBody = document.querySelector(".cate-box");
const hideTables = document.querySelectorAll(".hide-tr");
const fontRadios = document.querySelectorAll(".font-select-radio");
const typeRadios = document.querySelectorAll(".type-select-radio");
const fileInput = document.querySelector("#formFile");

let subFlag = false;
let fileValue = "";
const formData = new FormData();


load();
function load(){
	$.ajax({
		type : "get",
		url : "/board/api/list",
		success : function(data){
			innerFun(data);
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
				        <input type="hidden" value="1" class="main-hidden">
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
	finalSaveBtnClick(innerBody);
}

function subInnerFun(boxs, data){
	for(let i = 0; i < data.length; i++){
		let innr = "";
		if(data[i].subList != null){
			for(let k = 0; k < data[i].subList.length; k++){
				innr += `
					<div class="cate-sub-title" id="${data[i].subList[k].mainIndex}">
				        <span class="sub-title-text" id="${data[i].subList[k].index}">${data[i].subList[k].name}</span>
				        <input type="hidden" value="1" class="sub-hidden">
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
			if(subFlag == true){
				if(confirm("저장하지 않으면 설정한 데이터가 삭제됩니다. 저장하시겠습니까?")){
					return;
				}
			}
			fontRadios[0].checked = true;
			typeRadios[0].checked = true;
			fileInput.value = "";
			subFlag = false;
			borderBlack(mainTitleBoxs);
			mainTitleBoxs[i].style.border = "1px solid red";
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
			tableDisplayOption(false);
			cateInput.value = mainTitleTexts[i].textContent;
			const mainHiddenInputs = document.querySelectorAll(".main-hidden");
			titleChangeEvent(mainTitleBoxs[i], mainTitleTexts[i], mainHiddenInputs[i], "main");
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
			if(subFlag == true){
				if(confirm("저장하지 않으면 설정한 데이터가 삭제됩니다. 저장하시겠습니까?")){
					return;
				}
			}
			fontRadios[0].checked = true;
			typeRadios[0].checked = true;
			fileInput.value = "";
			subFlag = false;
			borderBlack(mainTitleBoxs);
			borderBlack(subTitleBoxs);
			subTitleBoxs[i].style.border = "1px solid red";
			let mainTitleBox = subTitleBoxs[i].parentElement.parentElement.querySelector(".cate-main-title");
			mainTitleBox.style.border = "1px solid red";
			tableDisplayOption(true);
			cateInput.value = subTitleTexts[i].textContent;
			const subHiddenInputs = document.querySelectorAll(".sub-hidden");
			titleChangeEvent(subTitleBoxs[i], subTitleTexts[i], subHiddenInputs[i], "sub");
			let deleteCheck = 999;
			for(let k = 0; k < mainTitleBoxs.length; k++){
				if(mainTitleBoxs[k].style.border == "1px solid red"){
					deleteCheck = k;
				}
			}
			if(deleteCheck != 999){
				deleteCateBtnClick(innerBody, mainTitleBoxs, subTitleBoxs[i]);
			}
			subOnChangeEvent(subHiddenInputs[i]);
		}
	}
}

function subOnChangeEvent(hidden){
	radioOnchange(fontRadios, hidden);
	radioOnchange(typeRadios, hidden);
	fileOnchange(fileInput, hidden);
}

function radioOnchange(list, hidden){
	for(let i = 0; i < list.length; i++){
		list[i].onchange = () => {
			subFlag = true;
			if(hidden.value == 1){
				hidden.value = 5;
			}else if(hidden.value == 3){
				hidden.value = 4;
			}else if(hidden.value == 2){
				hidden.value = 5;
			}
		}
	}
}

function fileOnchange(input, hidden){
	input.onchange = (event) => {
		if(event.target.files[0].size > 5242880){ // 5 mb 까지만 가능
			alert("첨부파일은 5mb 이하만 가능합니다.");
			input.value = "";
			return;
		}
		subFlag = true;
		if(hidden.value == 1){
			hidden.value = 5;
		}else if(hidden.value == 3){
			hidden.value = 4;
		}else if(hidden.value == 2){
			hidden.value = 5;
		}
		const reader = new FileReader();
        
        reader.readAsDataURL(event.target.files[0]);
        reader.onload = () => {
        	fileValue = event.target.files[0];
        }
	}
}

function tableDisplayOption(flag){
	if(flag == true){
		for(let k = 0; k < hideTables.length; k++){
			hideTables[k].style.display = "table-row";
		}
	}else{
		for(let k = 0; k < hideTables.length; k++){
			hideTables[k].style.display = "none";
		}
	}
}

function borderBlack(list){
	for(let i = 0; i < list.length; i++){
		list[i].style.border = "1px solid black";
	}
}

function titleChangeEvent(box, text, hidden, flag){
	cateInput.onkeyup = () => {
		if(box.style.border == "1px solid red"){
			text.textContent = cateInput.value;
			if(flag == "main"){
				if(hidden.value == 1){
					hidden.value = 2;
				}
			}else{
				if(hidden.value == 1){
					hidden.value = 2;
				}
			}
			
		}
	}
}

function addMainCateBtnClick(innerBody){
	addMainCateBtn.onclick = () => {
		addMainCategory(innerBody);
		const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
		const subInnerBoxs = document.querySelectorAll(".cate-sub-box");
		addSubCateBtnClick(mainTitleBoxs, subInnerBoxs);
		switchCateBtnClick(innerBody, mainTitleBoxs, "");
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
		        <input type="hidden" value="3" class="main-hidden">
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
		<div class="cate-sub-title" id="999">
	        <span class="sub-title-text" id="999">서브 카테고리</span>
	        <input type="hidden" value="3" class="sub-hidden">
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
					alert("삭제 할 카테고리를 선택해주세요!");
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
					alert("삭제 할 카테고리를 선택해주세요!");
					return;
				}else{
					if(subBoxs.parentElement.querySelectorAll(".cate-sub-title").length == 1){
						const subTitleText = subBoxs.querySelector(".sub-title-text");
						if(deleteCategoryApiFun(subTitleText.id, "sub")){
							const mainDiv = subBoxs.parentElement;
							mainDiv.replaceChildren();
							alert("삭제되었습니다.");
						}
					}else{
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

function finalSaveBtnClick(innerBody){
	finalSaveBtn.onclick = () => {
		//if(fileValue == ""){
		//	alert("이미지 파일을 첨부해주세요!");
		//	return;
		//}
		let fontResult = "";
		let typeResult = "";
		for(let i = 0; i < fontRadios.length; i++){
			if(fontRadios[i].checked == true){
				fontResult = fontRadios[i].value;
			}
		}
		for(let i = 0; i < typeRadios.length; i++){
			if(typeRadios[i].checked == true){
				typeResult = typeRadios[i].value;
			}
		}
		if(innerBody.innerHTML != ""){
			const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
			const mainTitleTexts = document.querySelectorAll(".main-title-text");
			const subInnerBoxs = document.querySelectorAll(".cate-sub-box");
			const mainHiddenInputs = document.querySelectorAll(".main-hidden");
			const subCateTexts = document.querySelectorAll(".sub-title-text");
			for(let i = 0; i < mainTitleTexts.length; i++){
				if(mainTitleTexts[i].textContent == ""){
					alert("메인 카테고리 이름을 적어주세요!");
					return;
				}
			}
			for(let i = 0; i < subCateTexts.length; i++){
				if(subCateTexts[i].textContent == ""){
					alert("서브 카테고리 이름을 적어주세요!");
					return;
				}
			}
			
			let mainCateList = new Array();
			
			for(let i = 0; i < mainTitleBoxs.length; i++){
				const mainObject = {
					id : mainTitleBoxs[i].id,
					name : mainTitleTexts[i].textContent,
					flag : mainHiddenInputs[i].value,
					subList : null
				}
				if(subInnerBoxs[i].innerHTML != ""){
					let subCateList = new Array();
					const subCateTitles = subInnerBoxs[i].querySelectorAll(".cate-sub-title");
					const subCateTexts = subInnerBoxs[i].querySelectorAll(".sub-title-text");
					const subHiddenInputs = subInnerBoxs[i].querySelectorAll(".sub-hidden");
					for(let k = 0; k < subCateTitles.length; k++){
						const subObject = {
							id : subCateTexts[k].id,
							groupId : subCateTitles[k].id,
							name : subCateTexts[k].textContent,
							font : "",
							listType : "",
							flag : subHiddenInputs[k].value
						}
						if(subHiddenInputs[k].value == 4 || subHiddenInputs[k].value == 5){
							subObject.font = fontResult;
							subObject.listType = typeResult;
						}
						subCateList.push(subObject);
					}
					mainObject.subList = subCateList;
				}
				mainCateList.push(mainObject);
			}
				console.log("최종", mainCateList);
			formData.append("mainCateList", new Blob([JSON.stringify(mainCateList)], {type: "application/json"}));
			formData.append("file", fileValue);
			$.ajax({
				type : "post",
				url : "/board/api/category/add",
				encType : "multipart/form-data",
				processData : false,
				contentType : false,
				data : formData,
				success : function(data){
					if(data == true){
						alert("저장되었습니다!");
						//location.href = "/board/cate-setting2";
					}
				},
				error : function(){
					alert("에러");
				}
			});
		}
	}
}














