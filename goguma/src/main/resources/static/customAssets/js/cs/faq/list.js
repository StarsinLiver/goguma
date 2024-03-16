const faqBody = document.querySelector(".faq--box");
load();
function load(){
	$.ajax({
		type : "get",
		url : "/cs/api/faq/list",
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
			<div class="faq--col">
                <div class="faq--col-main">
                    <div class="faq--left-box">
                        <div class="faq--num-box">
                            <span class="faq-num-color">${data[i].id}</span>
                        </div>
                        <div class="faq--title-box">
                            <span>${data[i].title}</span>
                        </div>
                    </div>
                    <div class="faq--right-box">
                        <span class="check-text">▼</span>
                    </div>
                </div>
                <div class="faq--col-sub">
                    <pre>${data[i].content}</pre>
                </div>
            </div>
		`;
	}
	faqBody.innerHTML = innr;
	const mainBody = document.querySelectorAll(".faq--col-main");
	const subBody = document.querySelectorAll(".faq--col-sub");
	const checkText = document.querySelectorAll(".check-text");
	clickFun(mainBody, subBody, checkText);
	
}

function clickFun(a, b, c){
	for(let i = 0; i < a.length; i++){
		a[i].onclick = () => {
			for(let k = 0; k < a.length; k++){
				b[k].className = "faq--col-sub"
				c[k].textContent = "▼";
			}
			b[i].className = "faq--col-sub-on";
			c[i].textContent = "▲";
		}
	}
}