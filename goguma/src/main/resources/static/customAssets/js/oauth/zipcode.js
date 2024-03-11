function zipcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; 
            var extraAddr = ''; 

            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }

            $('input[name="zip"]').eq(0).val(data.zonecode);
            $('input[name="addr1"]').eq(0).val(addr);
            $('input[name="addr2"]').eq(0).focus();
            
            $('input[name="recipZip"]').eq(0).val(data.zonecode);
            $('input[name="recipAddr1"]').eq(0).val(addr);
            $('input[name="recipAddr2"]').eq(0).focus();
        
            
           
        }
    }).open();
}
