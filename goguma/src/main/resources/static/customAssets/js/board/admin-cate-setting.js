const addMainCateBtn = document.querySelector(".add-cate-btn");
const addSubCateBtn = document.querySelector(".add-sub-cate-btn");
const deleteCateBtn = document.querySelector(".delete-cate-btn");
const categoryInnerBox = document.querySelector(".cate-box");
const cateInput = document.querySelector(".cate-input");
const switchCateBtn = document.querySelector(".switch-cate-btn");
const hideTr = document.querySelector(".hide-tr");
const upBtn = document.querySelector(".up-btn");
const downBtn = document.querySelector(".down-btn");
const finalSaveBtn = document.querySelector(".save-cate-btn");

const mainList = new Array();
const subList = new Array();

function upDownBtnClick(){
	upBtn.onclick = () => {
		const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
		let mainCheck = 0;
		for(let i = 0; i < mainTitleBoxs.length; i++){
			if(mainTitleBoxs[i].style.border == "1px solid red"){
				mainCheck = i;
			}
		}
		if(mainList.length != 0 && mainList[mainCheck].subObject == null){
			const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
			let selectIndex = 999;
			for(let i = 0; i < mainList.length; i++){
				if(mainTitleBoxs[i].style.border == "1px solid red"){
					selectIndex = i;
				}
			}
			if(selectIndex != 999 && selectIndex != 0){
				[mainList[selectIndex - 1], mainList[selectIndex]] = [mainList[selectIndex], mainList[selectIndex - 1]];
				console.log("메인2", mainList);
				load();
			}
		}else if(mainList.length != 0 && mainList[mainCheck].subObject != null){
			const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
			const subTitleBoxs = document.querySelectorAll(".cate-sub-title");
			let selectIndex = 999;
			for(let i = 0; i < subTitleBoxs.length; i++){
				if(subTitleBoxs[i].style.border == "1px solid red"){
					selectIndex = subTitleBoxs[i].id;
				}
			}
			if(selectIndex != 999 && selectIndex != 0){
				[mainList[mainCheck].subObject[selectIndex - 1], mainList[mainCheck].subObject[selectIndex]] = 
				[mainList[mainCheck].subObject[selectIndex], mainList[mainCheck].subObject[selectIndex - 1]];
				console.log("바꿈", mainList[mainCheck].subObject);
				load();
			}
		}
	}
//----------------------------------------------------------------------------------------------------------------------------------------------
	/*
	downBtn.onclick = () => {
		const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
		let mainCheck = 0;
		for(let i = 0; i < mainTitleBoxs.length; i++){
			if(mainTitleBoxs[i].style.border == "1px solid red"){
				mainCheck = i;
			}
		}
		if(mainList.length != 0 && mainList[mainCheck].subObject == null){
			const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
			let selectIndex = 999;
			for(let i = 0; i < mainList.length; i++){
				if(mainTitleBoxs[i].style.border == "1px solid red"){
					selectIndex = i;
				}
			}
			if(selectIndex != 999 && selectIndex != 0){
				[mainList[selectIndex + 1], mainList[selectIndex + 1]] = [mainList[selectIndex + 1], mainList[selectIndex]];
				console.log("메인2", mainList);
				load();
			}
		}else if(mainList.length != 0 && mainList[mainCheck].subObject != null){
			const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
			const subTitleBoxs = document.querySelectorAll(".cate-sub-title");
			let selectIndex = 999;
			for(let i = 0; i < subTitleBoxs.length; i++){
				if(subTitleBoxs[i].style.border == "1px solid red"){
					selectIndex = subTitleBoxs[i].id;
				}
			}
			if(selectIndex != 999){
				[mainList[mainCheck].subObject[selectIndex], mainList[mainCheck].subObject[selectIndex + 1]] = 
				[mainList[mainCheck].subObject[selectIndex + 1], mainList[mainCheck].subObject[selectIndex]];
				console.log("바꿈", mainList[mainCheck].subObject);
				load();
			}
		}
	}//다운버튼은 기능이 미완성이라 지금은 안쓰는걸로
	*/ 
//----------------------------------------------------------------------------------------------------------------------------------------------
}
//----------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------
load();
function load(){
	let mainInnr = "";
	categoryInnerBox.innerHTML = "";
	if(mainList != 0){
		for(let i = 0; i < mainList.length; i++){
			mainInnr += mainList[i].mainInnrHTML;
			/*
			mainInnr += `
				<div class="cate-main-box" id="">
	                <div class="cate-main-title">
	                    <span class="main-title-text">${mainList[i].mainTitle}</span>
	                </div>
	                <div class="cate-sub-box"></div>
	            </div>
			`;
			 */
		}
	}
	categoryInnerBox.innerHTML = mainInnr;
	const mains = document.querySelectorAll(".cate-main-box");
	const mainTitles = document.querySelectorAll(".main-title-text");
	for(let i = 0; i < mains.length; i++){
		mains[i].id = i;
		mainTitles[i].textContent = mainList[i].mainTitle;
	}
	for(let i = 0; i < mainList.length; i++){
		if(mainList[i].subObject != null){
			const mains = document.querySelectorAll(".cate-main-box");
			const subInnrBoxs = document.querySelectorAll(".cate-sub-box");
			let subInnr = "";
			subInnrBoxs[i].innerHTML = "";
			for(let k = 0; k < mainList[i].subObject.length; k++){
				subInnr += `
					<div class="cate-sub-title" id="${mainList[i].subObject[k].subIndex}">
		                <span class="sub-title-text">${mainList[i].subObject[k].subTitle}</span>
		            </div>
				`;
				let pushHTML = `
					<div class="cate-sub-title" id="${mainList[i].subObject[k].subIndex}">
		                <span class="sub-title-text">${mainList[i].subObject[k].subTitle}</span>
		            </div>
				`;
				mainList[i].subObject[k].subInnrHTML = pushHTML;
			}
			subInnrBoxs[i].innerHTML = subInnr;
			const subs = subInnrBoxs[i].querySelectorAll(".cate-sub-title");
			const subTitles = subInnrBoxs[i].querySelectorAll(".sub-title-text");
			for(let s = 0; s < subs.length; s++){
				subs[s].id = s;
				subTitles[s].textContent = mainList[i].subObject[s].subTitle;
			}
		}// if(mainList[w]
	}
	/*
	if(subList != 0){
		const mains = document.querySelectorAll(".cate-main-box");
		const subInnrBoxs = document.querySelectorAll(".cate-sub-box");
		let subInnr = "";
		for(let i = 0; i < mains.length; i++){
			subInnr = "";
			for(let k = 0; k < mainList[i].subObject.length; k++){
				if(mains[i].id == mainList[i].subObject[k].mainIndex){
					subInnr += mainList[i].subObject[k].subInnrHTML;
				}
			}
			subInnrBoxs[i].innerHTML = subInnr;
			const subs = subInnrBoxs[i].querySelectorAll(".cate-sub-title");
			const subTitles = subInnrBoxs[i].querySelectorAll(".sub-title-text");
			for(let s = 0; s < mainList[i].subObject.length; s++){
				subs[s].id = s;
				subTitles[s].textContent = mainList[i].subObject[s].subTitle;
			}
		}
	}
	*/
	addSubCateBtnClick();
	addMainCateBtnClick();
	const subCateTitles = document.querySelectorAll(".cate-sub-title");
	const subCateTexts = document.querySelectorAll(".sub-title-text");
	const mainBoxs = document.querySelectorAll(".cate-main-title");
	changeSub(subCateTitles, subCateTexts, mainBoxs);
	
	const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
	const mainTitleTexts = document.querySelectorAll(".main-title-text");
	const subTitleBoxs = document.querySelectorAll(".cate-sub-box");
	changeMain(mainTitleBoxs, mainTitleTexts, subTitleBoxs);
	
	//upDownBtnClick();// 업다운
	
}

function addSubCateBtnClick(){
	let borderCheck = 999;
	addSubCateBtn.onclick = () => {
		borderCheck = 999;
		if(categoryInnerBox.innerHTML == ""){
			alert("메인 카테고리를 선택해주세요!");
		}else{
			const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
			for(let i = 0; i < mainTitleBoxs.length; i++){
				if(mainTitleBoxs[i].style.border == "1px solid red"){
					borderCheck = i;
				}
			}
			if(borderCheck == 999){
				alert("메인 카테고리를 선택해주세요!");
			}else{
				// 서브 카테고리 추가
				const subCategoryInnerBox = document.querySelectorAll(".cate-sub-box");
				subCateAddEvent(subCategoryInnerBox, borderCheck);
				mainTitleBoxs[borderCheck].style.border = "1px solid red";
			}
		}
	}
}

function addMainCateBtnClick(){
	addMainCateBtn.onclick = () => {
		const mainObject = {
			mainIndex : 999,
			mainInnrHTML : "",
			mainTitle : "",
			subObject : null
		};
		borderCheck = 999;
		if(categoryInnerBox.innerHTML == ""){
			innr = categoryInnerBox.innerHTML;
			innr += `<div class="cate-main-box" id="${mainList.length}">
		                <div class="cate-main-title">
		                    <span class="main-title-text">메인 카테고리</span>
		                </div>
		                <div class="cate-sub-box"></div>
		            </div>`;
			categoryInnerBox.innerHTML = innr;
			const mainTitle = document.querySelectorAll(".main-title-text");
			mainObject.mainIndex = 0;
			mainObject.mainInnrHTML = categoryInnerBox.innerHTML;
			mainObject.mainTitle = mainTitle[mainTitle.length - 1].textContent;
			mainList.push(mainObject);
		}else{
			innr = categoryInnerBox.innerHTML;
			innr += `<div class="cate-main-box" id="${mainList.length}">
		                <div class="cate-main-title">
		                    <span class="main-title-text">메인 카테고리</span>
		                </div>
		                <div class="cate-sub-box"></div>
		            </div>`;
		    let pushHTML = `<div class="cate-main-box" id="${mainList.length}">
				                <div class="cate-main-title">
				                    <span class="main-title-text">메인 카테고리</span>
				                </div>
				                <div class="cate-sub-box"></div>
				            </div>`;
			categoryInnerBox.innerHTML = innr;
			const mainTitle = document.querySelectorAll(".main-title-text");
			mainObject.mainIndex = mainTitle.length - 1;
			mainObject.mainInnrHTML = pushHTML;
			mainObject.mainTitle = mainTitle[mainTitle.length - 1].textContent;
			mainList.push(mainObject);
		}
		const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
		const mainTitleTexts = document.querySelectorAll(".main-title-text");
		const subTitleBoxs = document.querySelectorAll(".cate-sub-box");
		changeMain(mainTitleBoxs, mainTitleTexts, subTitleBoxs);
		borderBlack(mainTitleBoxs);
		mainTitleBoxs[mainTitleBoxs.length - 1].style.border = "1px solid red";
		mainTitleBoxs[mainTitleBoxs.length - 1].click();
	console.log("메인추가", mainList);
	}
}



function subCateAddEvent(box, i){
	console.log("서브생성 부모아이디", i);
	const subObject = {
		mainIndex : i,
		subIndex : 0,
		subInnrHTML : "",
		subTitle : ""
	};
	let innr = "";
	if(box[i].innerHTML == ""){
		box[i].innerHTML = `
			<div class="cate-sub-title" id="0">
                <span class="sub-title-text">서브 카테고리</span>
            </div>
		`;
		const subTitle = document.querySelectorAll(".sub-title-text");
		subObject.subInnrHTML = box[i].innerHTML;
		subObject.subTitle = subTitle[subTitle.length - 1].textContent;
		subList.push(subObject);
		mainList[i].subObject = subList;
	}else{
		let subNum = mainList[i].subObject[mainList[i].subObject.length - 1].subIndex;
		const subObject = {
			mainIndex : i,
			subIndex : subNum + 1,
			subInnrHTML : "",
			subTitle : ""
		};
		innr = box[i].innerHTML;
		innr += `
			<div class="cate-sub-title" id="${subNum + 1}">
                <span class="sub-title-text">서브 카테고리</span>
            </div>
		`;
		let pushHTML = `
			<div class="cate-sub-title" id="${subNum + 1}">
                <span class="sub-title-text">서브 카테고리</span>
            </div>
		`;
		box[i].innerHTML = innr;
		const subTitle = document.querySelectorAll(".sub-title-text");
		const newSubList = new Array();
		for(let k = 0; k < mainList[i].subObject.length; k++){
			newSubList.push(mainList[i].subObject[k]);
		}
		subObject.subInnrHTML = pushHTML;
		subObject.subTitle = subTitle[subTitle.length - 1].textContent;
		newSubList.push(subObject);
		mainList[i].subObject = newSubList;
	}
	const subCateTitles = document.querySelectorAll(".cate-sub-title");
	const subCateTexts = document.querySelectorAll(".sub-title-text");
	const mainBoxs = document.querySelectorAll(".cate-main-title");
	changeSub(subCateTitles, subCateTexts, mainBoxs);
	subCateTitles[subCateTitles.length - 1].style.border = "1px solid red";
	subCateTitles[subCateTitles.length - 1].click();
	console.log("서브생성", mainList[i].subObject);
}

function changeSub(boxs, texts, mainBoxs){
	for(let i = 0; i < boxs.length; i++){
		boxs[i].onclick = () => {
			borderBlack(mainBoxs);
			let mainIndex = boxs[i].parentElement.parentElement.id;
			mainBoxs[mainIndex].style.border = "1px solid red";
			let subIndex = 999;
			for(let k = 0; k < boxs.length; k++){
				boxs[k].style.border = "1px solid black";
			}
			boxs[i].style.border = "1px solid red";
			subIndex = boxs[i].id;
			cateInput.value = texts[i].textContent;
			subTitleChangeEvent(boxs[i], texts[i], mainList[mainIndex].subObject, subIndex);
			hideTr.style.display = "table-row";
		}
	}
}

function changeMain(boxs, texts, subs){
	for(let i = 0; i < boxs.length; i++){
		boxs[i].onclick = () => {
			borderBlack(boxs);
			boxs[i].style.border = "1px solid red";
			cateInput.value = texts[i].textContent;
			titleChangeEvent(boxs[i], texts[i], mainList, i);
			for(let k = 0; k < subs.length; k++){
				if(subs[k].innerHTML != ""){
					const subTitleBoxs = subs[k].querySelectorAll(".cate-sub-title");
					borderBlack(subTitleBoxs);
				}
			}
			hideTr.style.display = "none";
		}
	}
}

switchCateBtn.onclick = () => {
	cateInput.value = "";
	if(categoryInnerBox.innerHTML != ""){
		const mainCateStyle = document.querySelectorAll(".cate-main-title");
		const subCateStyle = document.querySelectorAll(".cate-sub-title");
		borderBlack(mainCateStyle);
		borderBlack(subCateStyle);
	}
}

deleteCateBtn.onclick = () => {
	if(categoryInnerBox.innerHTML == ""){
		alert("삭제할 카테고리가 없습니다.");
	}else{
		let mainIndex = 999;
		let subIndex = 999;
		const mainCateStyle = document.querySelectorAll(".cate-main-title");
		const subCateStyle = document.querySelectorAll(".cate-sub-title");
		for(let i = 0; i < mainCateStyle.length; i++){
			if(mainCateStyle[i].style.border == "1px solid red"){
				mainIndex = i;
			}
		}
		if(mainIndex != 999){
			for(let i = 0; i < subCateStyle.length; i++){
				if(subCateStyle[i].style.border == "1px solid red"){
					subIndex = subCateStyle[i].id;
				}
			}
			if(mainIndex == 999 && subIndex == 999){
				alert("삭제할 카테고리를 선택해주세요!");
				return;
			}else if(mainIndex != 999 && subIndex == 999){
				if(confirm("서브 카테고리도 함께 삭제 됩니다. 삭제하시겠습니까?")){
	//				for(let i = 0; i < subList.length; i++){
	//					if(subList[i].mainIndex == mainIndex){
	//						subList.splice(i, 1);
	//					}
	//				}
					mainList.splice(mainIndex, 1);
					load();
				}
			}else if(mainIndex != 999 && subIndex != 999){
				mainList[mainIndex].subObject.splice(subIndex, 1);
				load();
			}
		}// else
	}
	console.log("삭제", mainList);
}

function borderBlack(boxs){
	for(let v = 0; v < boxs.length; v++){
		boxs[v].style.border = "1px solid black";
	}
}

function titleChangeEvent(box, text, objList, v){
	cateInput.onkeyup = () => {
		if(box.style.border == "1px solid red"){
			text.textContent = cateInput.value;
			objList[v].mainTitle = text.textContent;
		}
		console.log(objList);
	}
}

function subTitleChangeEvent(box, text, objList, v){
	cateInput.onkeyup = () => {
		if(box.style.border == "1px solid red"){
			text.textContent = cateInput.value;
			objList[v].subTitle = text.textContent;
		}
		console.log("수정", mainList);
	}
}

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































