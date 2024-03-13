const headMenus = document.querySelectorAll(".emoji--head-menu");
const headMenusBorder = document.querySelectorAll(".emoji--head-menu-title");
const innerBody = document.querySelector(".emoji--content-box");
let num = 0;

let listData = "";
load(num);

function load(num){
	headMenus[num].className = "emoji--head-menu-on";
	headMenusBorder[num].className = "emoji--head-menu-title-on";
	$.ajax({
		type : "get",
		url : "/emoji/api/list/" + num,
		async : false,
		success : function(data){
			if(data != ""){
				innerFun(data);
			}else{
				alert("실패");
			}
		},
		error : function(){
			alert("에러");
		}
	});
}

for(let i = 0; i < headMenus.length; i++){
	headMenus[i].onclick = () => {
		for(let k = 0; k < headMenus.length; k++){
			headMenus[k].className = "emoji--head-menu";
			headMenusBorder[k].className = "emoji--head-menu-title";
		}
		headMenus[i].className = "emoji--head-menu-on";
		headMenusBorder[i].className = "emoji--head-menu-title-on";
		load(i);
	}
}

function innerFun(list){
	let innr = "";
	innerBody.textContent = "";
	if(list != ""){
		for(let i = 0; i < list.length; i++){
			innr += `
				<div class="emoji--item-box" id="${list[i].id}">
                    <div class="emoji--img-box">
                        <img src="/images/upload/emoji/${list[i].file}" alt="이모티콘">
                    </div>
                    <div class="emoji--item-title-box">
                        <span>${list[i].name}</span>
                    </div>
                </div>
			`;
		}
		innerBody.innerHTML = innr;
		const detail = document.querySelectorAll(".emoji--item-box");
		detailPaging(detail);
	}
}

function detailPaging(detail){
	for(let i = 0; i < detail.length; i++){
		detail[i].onclick = () => {
			location.href = "/emoji/detail/" + detail[i].id;
		}
	}
}











