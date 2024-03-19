const addCateBtn = document.querySelector(".add-cate-btn");
const deleteCateBtn = document.querySelector(".delete-cate-btn");
const categoryInnerBox = document.querySelector(".cate-box");
const cateInput = document.querySelector(".cate-input");
const switchCateBtn = document.querySelector(".switch-cate-btn");
const addSubCateBtn = document.querySelector(".add-sub-cate-btn");
const hideTr = document.querySelector(".subCateTitleChange");


const subList = new Array();
subList.push("test");

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
		}
	}
}

function subCateAddEvent(box, i){
	let innr = "";
	if(box[i].innerHTML == ""){
		box[i].innerHTML = `
			<div class="cate-sub-title">
                <span class="sub-title-text">서브 카테고리</span>
            </div>
		`;
	}else{
		innr = box[i].innerHTML;
		innr += `
			<div class="cate-sub-title">
                <span class="sub-title-text">서브 카테고리</span>
            </div>
		`;
		box[i].innerHTML = innr;
	}
	const subCateTitles = document.querySelectorAll(".cate-sub-title");
	const subCateTexts = document.querySelectorAll(".sub-title-text");
	const mainBoxs = document.querySelectorAll(".cate-main-title");
	changeSub(subCateTitles, subCateTexts, mainBoxs);
}

function changeSub(boxs, texts, mainBoxs){
	for(let i = 0; i < boxs.length; i++){
		boxs[i].onclick = () => {
			borderBlack(mainBoxs);
			for(let k = 0; k < boxs.length; k++){
				boxs[k].style.border = "1px solid black";
			}
			boxs[i].style.border = "1px solid red";
			cateInput.value = texts[i].textContent;
			mainCateTitleChange(texts[i]);
		}
	}
}
//------------------------------------------------------------------------------------------------------------------------------------------------
const mainList = new Array();
addCateBtn.onclick = () => {
	borderCheck = 999;
	if(categoryInnerBox.innerHTML == ""){
		innr = categoryInnerBox.innerHTML;
		innr += `<div class="cate-main-box">
	                <div class="cate-main-title">
	                    <span class="main-title-text">메인 카테고리</span>
	                </div>
	                <div class="cate-sub-box"></div>
	            </div>`;
		mainList.push(innr);
		categoryInnerBox.innerHTML = innr;
	}else{
			innr = categoryInnerBox.innerHTML;
			innr += `<div class="cate-main-box">
		                <div class="cate-main-title">
		                    <span class="main-title-text">메인 카테고리</span>
		                </div>
		                <div class="cate-sub-box"></div>
		            </div>`;
			mainList.push(innr);
			categoryInnerBox.innerHTML = innr;
	}
	const mainTitleBoxs = document.querySelectorAll(".cate-main-title");
	const mainTitleTexts = document.querySelectorAll(".main-title-text");
	changeMain(mainTitleBoxs, mainTitleTexts);
}

function changeMain(boxs, texts){
	for(let i = 0; i < boxs.length; i++){
		boxs[i].onclick = () => {
			borderBlack(boxs)
			boxs[i].style.border = "1px solid red";
			cateInput.value = texts[i].textContent;
			mainCateTitleChange(texts[i]);
		}
	}
}

function mainCateTitleChange(text){
	cateInput.onkeyup = () => {
		text.textContent = cateInput.value;
	}
}

switchCateBtn.onclick = () => {
	if(categoryInnerBox.innerHTML != ""){
		const mainCateStyle = document.querySelectorAll(".cate-main-title");
		const subCateStyle = document.querySelectorAll(".cate-sub-title");
		borderBlack(mainCateStyle);
		borderBlack(subCateStyle);
	}
}

function borderBlack(boxs){
	for(let v = 0; v < boxs.length; v++){
		boxs[v].style.border = "1px solid black";
	}
}
