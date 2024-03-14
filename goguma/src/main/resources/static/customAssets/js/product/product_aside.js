// 차례 순서 클릭시 색깔 변경
document.addEventListener("DOMContentLoaded", function() {
    var searchTypes = document.querySelectorAll(".search-type");

    searchTypes.forEach(function(type) {
        type.addEventListener("click", function(event) {
            event.preventDefault();
            var dataType = type.dataset.type;
            if (dataType === "price-high") {
                document.querySelector('.search-type[data-type="price-low"]').classList.remove("selected");
            } else if (dataType === "price-low") {
                document.querySelector('.search-type[data-type="price-high"]').classList.remove("selected");
            }
            type.classList.toggle("selected");
        });
    });
});

// 검색어를 입력할 때 색깔 변경
function highlightSearch(input) {
    var listItem = input.parentNode;
    var link = listItem.querySelector('.search-type');
    if (input.value.trim() !== '') {
        link.classList.add('selected');
    } else {
        link.classList.remove('selected');
    }
}

// 검색 버튼을 눌렀을 때
function checkSelected() {
    var selectedItems = []; // 검색 순서 
    var searchTypes = document.querySelectorAll(".search-type");
    var search = document.querySelector(".search-input").value;
    var searchAddress = document.querySelector(".search-input-address").value;
    var lowPrice = document.querySelector(".search-low-price").value;
    var highPrice = document.querySelector(".search-high-price").value;
    var index = 1;
    
    searchTypes.forEach(function(type) {
        if (type.classList.contains("selected") && type.dataset.type !== "title" && type.dataset.type !== "address") {
            if (type.dataset.type === "price-high") {
                selectedItems.push(3);
            } else if (type.dataset.type === "price-low") {
                selectedItems.push(4);
            } else {
                selectedItems.push(index);
                index++;
            }
        }
    });
    
    if(lowPrice > highPrice || lowPrice < 0 || highPrice < 0) {
		alert("가격이 잘못 되었습니다.");
		return ;
	}
    
    
    // 결과
    if (selectedItems.length > 0) {
        console.log("선택된 항목: " + selectedItems.join(","));
        console.log("제목 검색 " , search);
        console.log("주소 검색 " , searchAddress);
        console.log("낮은 가격 " , lowPrice);
        console.log("높은 가격 " , highPrice);
    } else {
        alert("선택된 항목이 없습니다.");
    }
}

// 초기화 버튼 클릭시 초기화
function resetSelection() {
    var searchTypes = document.querySelectorAll(".search-type");
    
    searchTypes.forEach(function(type) {
        type.classList.remove("selected");
    });
}
