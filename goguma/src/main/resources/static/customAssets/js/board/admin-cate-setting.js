const addMainCateBtn = document.querySelector(".add-cate-btn");
const addSubCateBtn = document.querySelector(".add-sub-cate-btn");
const deleteCateBtn = document.querySelector(".delete-cate-btn");
const categoryInnerBox = document.querySelector(".cate-box");
const cateInput = document.querySelector(".cate-input");
const switchCateBtn = document.querySelector(".switch-cate-btn");
const hideTr = document.querySelector(".subCateTitleChange");



const mainList = new Array();
const subList = new Array();

let innr = "";
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

function subCateAddEvent(box, i){
	const subObject = {
		mainIndex : i,
		subInnrHTML : "",
		subTitle : ""
	};
	let innr = "";
	if(box[i].innerHTML == ""){
		box[i].innerHTML = `
			<div class="cate-sub-title">
                <span class="sub-title-text">서브 카테고리</span>
            </div>
		`;
		const subTitle = document.querySelectorAll(".sub-title-text");
		subObject.subInnrHTML = box[i].innerHTML;
		subObject.subTitle = subTitle[subTitle.length - 1].textContent;
		subList.push(subObject);
	}else{
		innr = box[i].innerHTML;
		innr += `
			<div class="cate-sub-title">
                <span class="sub-title-text">서브 카테고리</span>
            </div>
		`;
		let pushHTML = `
			<div class="cate-sub-title">
                <span class="sub-title-text">서브 카테고리</span>
            </div>
		`;
		box[i].innerHTML = innr;
		const subTitle = document.querySelectorAll(".sub-title-text");
		subObject.subInnrHTML = box[i].innerHTML;
		subObject.subTitle = subTitle[subTitle.length - 1].textContent;
		subList.push(pushHTML);
	}
	const subCateTitles = document.querySelectorAll(".cate-sub-title");
	const subCateTexts = document.querySelectorAll(".sub-title-text");
	const mainBoxs = document.querySelectorAll(".cate-main-title");
	changeSub(subCateTitles, subCateTexts, mainBoxs, i);
	subCateTitles[subCateTitles.length - 1].style.border = "1px solid red";
	subCateTitles[subCateTitles.length - 1].click();
}

function changeSub(boxs, texts, mainBoxs, index){
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
			titleChangeEvent(boxs[i], texts[i]);
		}
	}
}
//------------------------------------------------------------------------------------------------------------------------------------------------
addMainCateBtn.onclick = () => {
	borderCheck = 999;
	if(categoryInnerBox.innerHTML == ""){
		innr = categoryInnerBox.innerHTML;
		innr += `<div class="cate-main-box" id="${mainList.length}">
	                <div class="cate-main-title">
	                    <span class="main-title-text">메인 카테고리</span>
	                </div>
	                <div class="cate-sub-box"></div>
	            </div>`;
		mainList.push(innr);
		categoryInnerBox.innerHTML = innr;
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
		mainList.push(pushHTML);
		categoryInnerBox.innerHTML = innr;
	}
	const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
	const mainTitleTexts = document.querySelectorAll(".main-title-text");
	const subTitleBoxs = document.querySelectorAll(".cate-sub-box");
	changeMain(mainTitleBoxs, mainTitleTexts, subTitleBoxs);
	borderBlack(mainTitleBoxs);
	mainTitleBoxs[mainTitleBoxs.length - 1].style.border = "1px solid red";
	mainTitleBoxs[mainTitleBoxs.length - 1].click();
}

function changeMain(boxs, texts, subs){
	for(let i = 0; i < boxs.length; i++){
		boxs[i].onclick = () => {
			borderBlack(boxs);
			boxs[i].style.border = "1px solid red";
			cateInput.value = texts[i].textContent;
			titleChangeEvent(boxs[i], texts[i]);
			for(let k = 0; k < subs.length; k++){
				if(subs[k].innerHTML != ""){
					const subTitleBoxs = subs[k].querySelectorAll(".cate-sub-title");
					borderBlack(subTitleBoxs);
				}
			}
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
		console.log("삭제 메인", mainIndex);
		console.log("삭제 서브", subIndex);
		if(mainIndex == 999 && subIndex == 999){
			alert("삭제할 카테고리를 선택해주세요!");
			return;
		}else if(mainIndex != 999 && subIndex == 999){
			if(confirm("서브 카테고리도 함께 삭제 됩니다. 삭제하시겠습니까?")){
				// 메인+서브 둘 다 삭제
			}
		}else if(mainIndex != 999 && subIndex != 999){
			// 서브 카테고리 삭제
		}
	}// else
}






// 공통 함수----------------------------------------------------------------
function borderBlack(boxs){
	for(let v = 0; v < boxs.length; v++){
		boxs[v].style.border = "1px solid black";
	}
}

function titleChangeEvent(box, text){
	cateInput.onkeyup = () => {
		if(box.style.border == "1px solid red"){
			text.textContent = cateInput.value;
		}
	}
}











