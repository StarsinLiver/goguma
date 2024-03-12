-- 채팅방        
insert into chat_room (name , p_id , u_id , host_id) values ('방 번호 1번', 1 , 1 , 2);

-- 상품
insert into product (address,name,price,host_id,description,file,main_category_id,sub_category_id) values('주소','이름' , 200 , 1 , '설명' , '파일' , 1 , 2);

-- emoji_history
insert into emoji_history  ( merchant_id , main_emoji_id , price , confirm_yn , u_id , cancel_amount , cancel_yn , bank)
values ( 'dsafsad-fsadsa' , 7 ,2300, 'Y' , 2 , 0 , 'N' , '부산은행');