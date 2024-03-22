
 // 모달
     // 모달 닫힐 때 입력 필드 초기화
    $('#exampleModal').on('hidden.bs.modal', function () {
        // 입력 필드 초기화
        $('#exampleModal input[name="name"]').val('');
        $('#exampleModal input[name="pId"]').val('');
        $('#exampleModal input[name="hostId"]').val('');
    });
    
    	// 드롭다운 메뉴 항목을 클릭했을 때 호출되는 함수
	document.querySelectorAll('.dropdown-item').forEach(item => {
	    item.addEventListener('click', event => {
	        const selectedReason = event.target.getAttribute('data-value');
	        document.getElementById('selectedReason').innerText = selectedReason;
	    });
	});
	// 모달이 닫힐 때 초기화하는 함수
	function resetModal() {
	    document.getElementById('selectedReason').innerText = '';
	    document.getElementById('additionalReason').value = '';
	}
	document.getElementById('reportModal').addEventListener('hidden.bs.modal', function () {
	    resetModal();
	});
    // textarea에 작성된 내용도 reason으로 설정
    $("#additionalReason").on("input", function() {
        var additionalReason = $(this).val();
        $("#reasonInput").val(additionalReason);
    });
    
    
 // textarea 자동 높이 조절
 	function autoResize(textarea) {
		textarea.style.height = 'auto'; // 일단 자동 높이로 설정
		textarea.style.height = (textarea.scrollHeight + 2) + 'px'; // 스크롤 높이에 2px를 더해줌
	}