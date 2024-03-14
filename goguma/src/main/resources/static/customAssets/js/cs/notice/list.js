const tbody = document.querySelector(".notice--tbody");


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
			alert("error!!");
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
			location.href = "/cs/notice/detail/" + id[i].id;
		}
	}
}