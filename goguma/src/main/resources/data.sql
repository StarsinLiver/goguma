-- 채팅방 만들기
insert into chat_room (p_id , u_id , host_id) values (3 ,3 ,2);

-- 채팅방 업데이트
update chat_room 
set host_exit = 'Y';
    
-- 상품
insert into product (address,name,price,host_id,description,file,main_category_id,sub_category_id) values('주소','이름' , 200 , 1 , '설명' , '파일' , 1 , 2);

-- emoji_history
insert into emoji_history  ( merchant_id , main_emoji_id , price , confirm_yn , u_id , cancel_amount , cancel_yn , bank)
values ( 'dsafsad-fsadsa' , 7 ,2300, 'Y' , 2 , 0 , 'N' , '부산은행');

-- 게시판 등록
insert into free_board(title , content , u_id , file , main_category , sub_category )
values ( '제목7' , '컨텐츠 1' , 5 , '파일' , 2 , 8);

-- 메인 카테고리
insert into board_main_category ( name)
values ('5차 카테고리');

-- 서브 카테고리
insert into board_sub_category ( name , group_id , number , row_count , background , font,  list_type)
values ('4차 카테고리' , 2 , 101 , 10 , '배경' , '폰트' , 'CARD');