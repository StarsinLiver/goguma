const tbody = document.querySelector(".notice--tbody");
const writeBtn = document.querySelector(".admin-notice-write-btn");

load();
function load(){
	$.ajax({
		type : "get",
		url : "/cs/api/notice/list",
		success : function(data){
			if(data != ""){
				innerFun(data);
			}
		},
		error : function(){
			Swal.fire({
			icon: "error",
			title: "Oops...",
			text: "서버 에러가 발생하였습니다!",
		});
		}
	});
}

function innerFun(data){
	let innr = "";
	for(let i = 0; i < data.length; i++){
		let day = data[i].createAt.split(" ")[0];
		innr += `
			<tr class="notice--tr href-num" id="${data[i].id}">
                <td class="notice--td cs-num">${data[i].id}</td>
                <td class="notice--td cs-title">${data[i].title}</td>
                <td class="notice--td cs-date">${day}</td>
            </tr>
		`;
	}
	tbody.innerHTML = innr;
	const pages = document.querySelectorAll(".href-num");
	pageFun(pages);
}

function pageFun(id){
	for(let i = 0; i < id.length; i++){
		id[i].onclick = () => {
			location.href = "/cs/notice/detail/admin/" + id[i].id;
		}
	}
}

writeBtn.onclick = () => {
	location.href = "/cs/notice/write/admin";
}