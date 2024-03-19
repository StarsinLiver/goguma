const addMainCateBtn = document.querySelector(".add-cate-btn");
const addSubCateBtn = document.querySelector(".add-sub-cate-btn");
const deleteCateBtn = document.querySelector(".delete-cate-btn");
const categoryInnerBox = document.querySelector(".cate-box");
const cateInput = document.querySelector(".cate-input");
const switchCateBtn = document.querySelector(".switch-cate-btn");
const hideTr = document.querySelector(".hide-tr");
const upBtn = document.querySelector(".up-btn");
const downBtn = document.querySelector(".down-btn");


const mainList = new Array();
const subList = new Array();

function upDownBtnClick(){
	upBtn.onclick = () => {
		if(mainList.length != 0 && subList.length == 0){
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
		}else if(mainList.length != 0 && subList.length != 0){
			const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
			const subTitleBoxs = document.querySelectorAll(".cate-sub-title");
			let selectIndex = 999;
			for(let i = 0; i < subList.length; i++){
				if(subTitleBoxs[i].style.border == "1px solid red"){
					selectIndex = i;
				}
			}
			if(selectIndex != 999 && selectIndex != 0){
				[subList[selectIndex - 1], subList[selectIndex]] = [subList[selectIndex], subList[selectIndex - 1]];
				console.log("서브2", subList);
				load();
			}
		}
	}
//----------------------------------------------------------------------------------------------------------------------------------------------
	downBtn.onclick = () => {
		if(mainList.length != 0 && subList.length == 0){
			const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
			let selectIndex = 999;
			for(let i = 0; i < mainList.length; i++){
				if(mainTitleBoxs[i].style.border == "1px solid red"){
					selectIndex = i;
				}
			}
			if(selectIndex != 999){
				[mainList[selectIndex], mainList[selectIndex + 1]] = [mainList[selectIndex + 1], mainList[selectIndex]];
				console.log("메인2", mainList);
				load();
			}
		}else if(mainList.length != 0 && subList.length != 0){
			const subTitleBoxs = document.querySelectorAll(".cate-sub-title");
			let selectIndex = 999;
			for(let i = 0; i < subList.length; i++){
				if(subTitleBoxs[i].style.border == "1px solid red"){
					selectIndex = i;
				}
			}
			if(selectIndex != 999){
				[subList[selectIndex], subList[selectIndex + 1]] = [subList[selectIndex + 1], subList[selectIndex]];
				console.log("서브2", subList);
				load();
			}
		}
	}
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
		}
	}
	categoryInnerBox.innerHTML = mainInnr;
	const mains = document.querySelectorAll(".cate-main-box");
	const mainTitles = document.querySelectorAll(".main-title-text");
	for(let i = 0; i < mains.length; i++){
		mains[i].id = i;
		mainTitles[i].textContent = mainList[i].mainTitle;
	}
	if(subList != 0){
		const mains = document.querySelectorAll(".cate-main-box");
		const subInnrBoxs = document.querySelectorAll(".cate-sub-box");
		let subInnr = "";
		for(let i = 0; i < mains.length; i++){
			subInnr = "";
			for(let k = 0; k < subList.length; k++){
				if(mains[i].id == subList[k].mainIndex){
					subInnr += subList[k].subInnrHTML;
				}
			}
			subInnrBoxs[i].innerHTML = subInnr;
			const subs = document.querySelectorAll(".cate-sub-title");
			const subTitles = document.querySelectorAll(".sub-title-text");
			for(let i = 0; i < subs.length; i++){
				subs[i].id = i;
				subTitles[i].textContent = subList[i].subTitle;
			}
		}
	}
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
	
	upDownBtnClick();
	
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
			mainTitle : ""
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
	}
}



function subCateAddEvent(box, i){
	const subObject = {
		mainIndex : i,
		subInnrHTML : "",
		subTitle : ""
	};
	let innr = "";
	if(box[i].innerHTML == ""){
		box[i].innerHTML = `
			<div class="cate-sub-title" id="${subList.length}">
                <span class="sub-title-text">서브 카테고리</span>
            </div>
		`;
		const subTitle = document.querySelectorAll(".sub-title-text");
		subObject.subInnrHTML = box[i].innerHTML;
		subObject.subTitle = subTitle[subTitle.length - 1].textContent;
		subList.push(subObject);
	}else{
		const subObject = {
			mainIndex : i,
			subInnrHTML : "",
			subTitle : ""
		};
		innr = box[i].innerHTML;
		innr += `
			<div class="cate-sub-title" id="${subList.length}">
                <span class="sub-title-text">서브 카테고리</span>
            </div>
		`;
		let pushHTML = `
			<div class="cate-sub-title" id="${subList.length}">
                <span class="sub-title-text">서브 카테고리</span>
            </div>
		`;
		box[i].innerHTML = innr;
		const subTitle = document.querySelectorAll(".sub-title-text");
		subObject.subInnrHTML = pushHTML;
		subObject.subTitle = subTitle[subTitle.length - 1].textContent;
		subList.push(subObject);
	}
	const subCateTitles = document.querySelectorAll(".cate-sub-title");
	const subCateTexts = document.querySelectorAll(".sub-title-text");
	const mainBoxs = document.querySelectorAll(".cate-main-title");
	changeSub(subCateTitles, subCateTexts, mainBoxs);
	subCateTitles[subCateTitles.length - 1].style.border = "1px solid red";
	subCateTitles[subCateTitles.length - 1].click();
}

function changeSub(boxs, texts, mainBoxs){
	for(let i = 0; i < boxs.length; i++){
		boxs[i].onclick = () => {
			borderBlack(mainBoxs);
			let mainIndex = boxs[i].parentElement.parentElement.id;
			mainBoxs[mainIndex].style.border = "1px solid red";
			for(let k = 0; k < boxs.length; k++){
				boxs[k].style.border = "1px solid black";
			}
			boxs[i].style.border = "1px solid red";
			cateInput.value = texts[i].textContent;
			subTitleChangeEvent(boxs[i], texts[i], subList, i);
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
		if(subList.length != 0){
			for(let i = 0; i < subCateStyle.length; i++){
				if(subCateStyle[i].style.border == "1px solid red"){
					subIndex = i;
				}
			}
		}
		if(mainIndex == 999 && subIndex == 999){
			alert("삭제할 카테고리를 선택해주세요!");
			return;
		}else if(mainIndex != 999 && subIndex == 999){
			if(confirm("서브 카테고리도 함께 삭제 됩니다. 삭제하시겠습니까?")){
				for(let i = 0; i < subList.length; i++){
					if(subList[i].mainIndex == mainIndex){
						subList.splice(i, 1);
					}
				}
				mainList.splice(mainIndex, 1);
				load();
			}
		}else if(mainIndex != 999 && subIndex != 999){
			subList.splice(subIndex, 1);
			load();
		}
	}// else
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
	}
}











