-- 채팅방 만들기
insert into chat_room (p_id , u_id , host_id) values (3 ,3 ,2);

-- 채팅방 업데이트
update chat_room 
set host_exit = 'Y';

-- 채팅방 전체 조회
SELECT
    p.p_id AS pId,
    p.address AS productAddress,
    p.name AS productName,
    p.price AS productPrice,
    p.host_id AS productHostId,
    p.description AS productDescription,
    p.file AS productFile,
    p.main_category_id AS mainCategoryId,
    p.sub_category_id AS subCategoryId,
    c.id AS roomId,
    c.user_room_name AS userRoomName,
    c.host_room_name AS hostRoomName,
    c.u_id AS userId,
    c.host_id AS hostId,
    c.create_at AS createAt,
    hu.name AS hostName,
    u.name AS userName
FROM
    chat_room c
LEFT JOIN
    product p ON p.p_id = c.p_id
INNER JOIN
    user hu ON hu.u_id = c.host_id
INNER JOIN
    user u ON u.u_id = c.u_id
WHERE
    (c.host_id = 2 AND c.host_exit != 'Y')
    OR (c.u_id = 2 AND c.user_exit != 'Y');
    
-- 상품
insert into product (address,name,price,host_id,description,file,main_category_id,sub_category_id) values('주소','이름' , 200 , 1 , '설명' , '파일' , 1 , 2);

-- emoji_history
insert into emoji_history  ( merchant_id , main_emoji_id , price , confirm_yn , u_id , cancel_amount , cancel_yn , bank)
values ( 'dsafsad-fsadsa' , 7 ,2300, 'Y' , 2 , 0 , 'N' , '부산은행');