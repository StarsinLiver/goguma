![logo](https://github.com/StarsinLiver/goguma/assets/141594965/b0d2f5de-c7e7-49ce-b066-6befb0b60d2d)

<br/>
<br/>

# 1️⃣ 프로젝트 구조
- com.store.goguma
- 각각 기능별 [관리자 , 유저 , 자유게시판 ...]로 구분

<details>
  <summary> 프로젝트 구조 보기</summary>

```
📦src
 ┣ 📂main
 ┃ ┣ 📂java
 ┃ ┃ ┗ 📂com
 ┃ ┃ ┃ ┗ 📂store
 ┃ ┃ ┃ ┃ ┗ 📂goguma
 ┃ ┃ ┃ ┃ ┃ ┣ 📂about
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜AboutPageController.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂admin
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜AdminRestController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminAnswerDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminBannerDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminChatRoomAndMessageDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminChatRoomDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminFreeBoardDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminProductDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminQnaDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminReportDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminResponsePageDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EmojiHistoryDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EmojiModifyDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PageReqDTO.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂category
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CategoryApiController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CategoryPageController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CategoryRequestDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CategoryResponseDto.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂chat
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChatRestController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂chatMessage
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatMessageDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChatMessageReqDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂chatRoom
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatRoomDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatRoomUpdateDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SaveRoomDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂chatRoomName
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChatRoomNameDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChatUtil.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂chatbot
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜AdminController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜AdminDTO.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂config
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MvcConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜WebMvcConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜WebSocketConfig.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂cs
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CsPageController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FaqController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NoticeController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜QnaController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FaqRequestDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NoticeRequestDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜QnaRequestDto.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂emoji
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EmojiApiController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜EmojiPageController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EmojiFileDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EmojiHistoryReqDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EmojiListMainAndSubDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EmojiUploadDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ShareWriteReqDto.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Banner.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BoardCategoryMain.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BoardCategorySub.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatMessage.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatRoom.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatRoomName.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Emoji.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EmojiHistory.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Faq.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoard.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardDetail.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardRecommendation.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardView.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MainEmoji.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Notice.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OauthUserEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PMainCategory.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Product.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductHistory.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PSubcategory.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Qna.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Report.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Review.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜User.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜WishList.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂freeboard
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeboardController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardDetailController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeboardRestController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜FreeBoardReviewController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BoardCategoryMainDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BoardCategorySubDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BoardTypeDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CategoryDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardCateListDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardCountRecommendationByCateDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardDetailAndUserDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardDetailDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardFormDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardListDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardManyCategoryDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardPageDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardRecommendationDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardResDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardReviewDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardReviewReqDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardReviewResDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardViewDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserFreeBoardPageReqDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UserFreeBoardPageResDto.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂handler
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂exception
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BackPageRestfulException.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatRoomException.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LoginRestfulException.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RedirectException.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ReportException.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CustomErrorController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RestfulExceptionHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StompEventListener.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜StompHandler.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂main
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MainController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜BannerDTO.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂product
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ProductRestController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductSearchDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductUserDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductWriteFormDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜WishListDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂utils
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ProductType.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂report
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ReportDTO.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BannerRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BoardMainCategoryRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BoardSubCategoryRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CategoryRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatMessageRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatRoomNameRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatRoomRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EmojiHistoryRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EmojiRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FaqRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardRecommendationRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardViewRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MainEmojiRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MyUserRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NoticeRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OauthRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PMainCategoryRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductHistoryRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PSubcategoryRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜QnaRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReportRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReviewRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜WishListRepository.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BannerService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BoardService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CategoryService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatMessageService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatRoomNameService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatRoomService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EmojiHistoryService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EmojiService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EmojiUploadService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FaqService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardDetailService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardRecommendationService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardViewService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MainEmojiService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NoticeService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OauthService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PaymentService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PMainCategoryService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductHistoryService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PSubcategoryService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜QnaService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReportService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReviewService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜WishListService.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂user
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OauthController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SessionController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UserRestController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂my
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductHistoryDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductHostDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜QnaUserDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RequestPageDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResponsePageDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserEmojiDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜WishProductDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FreeBoardDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GoogleProfile.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜KakaoAccount.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜KakaoProfile.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ModifyUserDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NaverProfile.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NaverResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OauthDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OauthResisterDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OAuthToken.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductHistoryReqDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Profile.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Properties.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResOauthUserDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SignInFormDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UserProfileDto.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂utils
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂page
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PageReq.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PageRes.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂payment
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PaymentRefundDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PaymentReqDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PaymentResponseData.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PaymentTokenDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ResponseToken.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BannerType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Define.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserRole.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜Utils.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜GogumaApplication.java
 ┃ ┣ 📂resources
 ┃ ┃ ┣ 📂mapper
 ┃ ┃ ┃ ┣ 📜admin.xml
 ┃ ┃ ┃ ┣ 📜banner.xml
 ┃ ┃ ┃ ┣ 📜boardMainCategory.xml
 ┃ ┃ ┃ ┣ 📜boardSubCategory.xml
 ┃ ┃ ┃ ┣ 📜category.xml
 ┃ ┃ ┃ ┣ 📜chatMessage.xml
 ┃ ┃ ┃ ┣ 📜chatRoom.xml
 ┃ ┃ ┃ ┣ 📜chatRoomName.xml
 ┃ ┃ ┃ ┣ 📜emoji.xml
 ┃ ┃ ┃ ┣ 📜emojiHistory.xml
 ┃ ┃ ┃ ┣ 📜faq.xml
 ┃ ┃ ┃ ┣ 📜freeBoard.xml
 ┃ ┃ ┃ ┣ 📜freeBoardRecommendation.xml
 ┃ ┃ ┃ ┣ 📜freeBoardView.xml
 ┃ ┃ ┃ ┣ 📜myUser.xml
 ┃ ┃ ┃ ┣ 📜notice.xml
 ┃ ┃ ┃ ┣ 📜oauth.xml
 ┃ ┃ ┃ ┣ 📜product.xml
 ┃ ┃ ┃ ┣ 📜productHistory.xml
 ┃ ┃ ┃ ┣ 📜qna.xml
 ┃ ┃ ┃ ┣ 📜report.xml
 ┃ ┃ ┃ ┣ 📜review.xml
 ┃ ┃ ┃ ┣ 📜user.xml
 ┃ ┃ ┃ ┗ 📜wishList.xml
 ┃ ┃ ┣ 📂static
 ┃ ┃ ┃ ┣ 📂assets
 ┃ ┃ ┃ ┃ ┣ 📂css
 ┃ ┃ ┃ ┃ ┃ ┣ 📜animate.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📜bootstrap-theme.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📜bootstrap-theme.css.map
 ┃ ┃ ┃ ┃ ┃ ┣ 📜bootstrap-theme.min.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📜bootstrap-theme.min.css.map
 ┃ ┃ ┃ ┃ ┃ ┣ 📜bootstrap.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📜bootstrap.css.map
 ┃ ┃ ┃ ┃ ┃ ┣ 📜bootstrap.min.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📜bootstrap.min.css.map
 ┃ ┃ ┃ ┃ ┃ ┣ 📜colors.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📜custom.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📜flaticon.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📜font-awesome.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📜font-awesome.min.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📜owl.carousel.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📜prettyPhoto.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📜responsive.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📜style.css
 ┃ ┃ ┃ ┃ ┃ ┗ 📜versions.css
 ┃ ┃ ┃ ┃ ┣ 📂fonts
 ┃ ┃ ┃ ┃ ┃ ┣ 📜flaticon.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Flaticon.eot
 ┃ ┃ ┃ ┃ ┃ ┣ 📜flaticon.html
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Flaticon.svg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Flaticon.ttf
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Flaticon.woff
 ┃ ┃ ┃ ┃ ┃ ┣ 📜fontawesome-webfont.eot
 ┃ ┃ ┃ ┃ ┃ ┣ 📜fontawesome-webfont.svg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜fontawesome-webfont.ttf
 ┃ ┃ ┃ ┃ ┃ ┣ 📜fontawesome-webfont.woff
 ┃ ┃ ┃ ┃ ┃ ┣ 📜fontawesome-webfont.woff2
 ┃ ┃ ┃ ┃ ┃ ┣ 📜FontAwesome.otf
 ┃ ┃ ┃ ┃ ┃ ┣ 📜glyphicons-halflings-regular.eot
 ┃ ┃ ┃ ┃ ┃ ┣ 📜glyphicons-halflings-regular.svg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜glyphicons-halflings-regular.ttf
 ┃ ┃ ┃ ┃ ┃ ┣ 📜glyphicons-halflings-regular.woff
 ┃ ┃ ┃ ┃ ┃ ┣ 📜glyphicons-halflings-regular.woff2
 ┃ ┃ ┃ ┃ ┃ ┗ 📜_flaticon.scss
 ┃ ┃ ┃ ┃ ┣ 📂images
 ┃ ┃ ┃ ┃ ┃ ┣ 📂logos
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜logo-light.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜logo-seo.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📂prettyPhoto
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dark_rounded
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜btnNext.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜btnPrevious.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜contentPattern.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜default_thumbnail.gif
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜loader.gif
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜sprite.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dark_square
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜btnNext.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜btnPrevious.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜contentPattern.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜default_thumbnail.gif
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜loader.gif
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜sprite.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂default
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜default_thumb.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜loader.gif
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜sprite.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜sprite_next.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜sprite_prev.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜sprite_x.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜sprite_y.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂facebook
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜btnNext.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜btnPrevious.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜contentPatternBottom.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜contentPatternLeft.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜contentPatternRight.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜contentPatternTop.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜default_thumbnail.gif
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜loader.gif
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜sprite.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂light_rounded
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜btnNext.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜btnPrevious.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜default_thumbnail.gif
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜loader.gif
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜sprite.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂light_square
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜btnNext.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜btnPrevious.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜default_thumbnail.gif
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜loader.gif
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜sprite.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📂seo-icons
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜development.svg
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜growth.svg
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜research.svg
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜stopwatch.svg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ajax-loader.gif
 ┃ ┃ ┃ ┃ ┃ ┣ 📜apple-touch-icon.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜bg.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜btnG_완성형.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜cat-1.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜cat-2.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜cat-3.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜cat-4.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜favicon.ico
 ┃ ┃ ┃ ┃ ┃ ┣ 📜goguma_mascot.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜kakao_login_medium_narrow.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜logo.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜pattern-4.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜pattern.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜phonebg.png
 ┃ ┃ ┃ ┃ ┃ ┗ 📜web_light_sq_ctn@4x.png
 ┃ ┃ ┃ ┃ ┣ 📂js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜01-custom-places-example.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜all.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜animate.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜custom.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜freeBoardList.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜hoverdir.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜jquery.prettyPhoto.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜jquery.vide.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜map.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜mapsed.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜modernizer.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜owl.carousel.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜portfolio.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜retina.js
 ┃ ┃ ┃ ┃ ┃ ┗ 📜scroll.js
 ┃ ┃ ┃ ┃ ┗ 📂uploads
 ┃ ┃ ┃ ┃ ┃ ┣ 📜about_01.jpg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜background-12.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜cloud.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜code.jpg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜logo_01.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜logo_02.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜logo_03.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜logo_04.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜logo_05.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜logo_06.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜parallax_02.jpg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜parallax_02.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜parallax_03.jpg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜parallax_04.jpg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜parallax_05.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜parallax_11.jpg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜parallax_12.jpg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜parallax_13.jpg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜parallax_17.jpg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜rocket.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜seo_01.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜seo_02.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜seo_03.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜seo_04.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜seo_05.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜seo_06.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜testi_01.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜testi_02.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜testi_03.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜version_01.jpg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜version_02.jpg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜version_03.jpg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜version_04.jpg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜version_05.jpg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜version_06.jpg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜version_07.jpg
 ┃ ┃ ┃ ┃ ┃ ┗ 📜version_08.jpg
 ┃ ┃ ┃ ┗ 📂customAssets
 ┃ ┃ ┃ ┃ ┣ 📂css
 ┃ ┃ ┃ ┃ ┃ ┣ 📂about
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜about.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📂all
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜font.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📂board
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜admin-cate-setting.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜list.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📂cs
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂faq
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜list.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂notice
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜detail.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜list.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜write.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂qna
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜write.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📂emoji
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜detail.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜list.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜refund.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜upload.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📂error
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜error.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📂product
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_management_chat.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜product_list.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜sidebar.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜userProduct.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📜chat_room.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📜market.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📜market2.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📜user.css
 ┃ ┃ ┃ ┃ ┃ ┗ 📜userProduct.css
 ┃ ┃ ┃ ┃ ┣ 📂images
 ┃ ┃ ┃ ┃ ┃ ┣ 📜common_img_sprite.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜github.svg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜no_product.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜sweet_potato_image.png
 ┃ ┃ ┃ ┃ ┃ ┗ 📜sweet_potato_image2.png
 ┃ ┃ ┃ ┃ ┗ 📂js
 ┃ ┃ ┃ ┃ ┃ ┣ 📂about
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜about.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📂admin
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_management_chat.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_management_notice.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜board.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜detail.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜list.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜user_role.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📂board
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜admin-cate-setting.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜admin-cate-setting2.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜list.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜메모.txt
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜메모2.txt
 ┃ ┃ ┃ ┃ ┃ ┣ 📂cs
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂faq
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜admin-write.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜list.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂notice
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜admin-detail.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜admin-list.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜admin-update.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜admin-write.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜detail.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜list.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂qna
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜write.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📂emoji
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜detail.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜list.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜refund.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜upload.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📂error
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜error.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📂free-board
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜free_board_detail.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜free_board_sidebar.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜free_detail_review.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜free_list.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜free_write.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜free_write_update.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📂oauth
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜zipcode.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📂product
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜product_aside.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📂user
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜board.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜product_host_history.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜chat_aside.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜chat_room.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜detail.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜free.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜jsonImage.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜newFile.js
 ┃ ┃ ┃ ┃ ┃ ┗ 📜session.js
 ┃ ┃ ┣ 📜application.yml
 ┃ ┃ ┣ 📜data.sql
 ┃ ┃ ┗ 📜schema.sql
 ┃ ┗ 📂webapp
 ┃ ┃ ┗ 📂WEB-INF
 ┃ ┃ ┃ ┗ 📂view
 ┃ ┃ ┃ ┃ ┣ 📂about
 ┃ ┃ ┃ ┃ ┃ ┗ 📜about.jsp
 ┃ ┃ ┃ ┃ ┣ 📂admin
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_aside.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_free_board.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_management_banner.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_management_banner_add.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_management_banner_update.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_management_chat.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_management_faq.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_management_faq_update.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_management_notice.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_management_product.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_management_qna.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_management_report.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_management_user_role.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_modi.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_payment_history.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_user.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin_write_qna.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜banner_create.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜banner_modify.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜emoji_detail.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜emoji_management.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜freeBoard_create.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜freeBoard_modify.jsp
 ┃ ┃ ┃ ┃ ┣ 📂board
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin-cate-setting.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin-cate-setting2.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜freeBoard_modify.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜list.jsp
 ┃ ┃ ┃ ┃ ┣ 📂chat
 ┃ ┃ ┃ ┃ ┃ ┣ 📜chat_room.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜chat_room_update.jsp
 ┃ ┃ ┃ ┃ ┣ 📂cs
 ┃ ┃ ┃ ┃ ┃ ┣ 📂faq
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜admin-write.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜list.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📂notice
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜admin-detail.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜admin-list.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜admin-update.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜admin-write.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜detail.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜list.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📂qna
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜write.jsp
 ┃ ┃ ┃ ┃ ┣ 📂emoji
 ┃ ┃ ┃ ┃ ┃ ┣ 📜detail.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜list.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜refund.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜upload.jsp
 ┃ ┃ ┃ ┃ ┣ 📂error
 ┃ ┃ ┃ ┃ ┃ ┗ 📜error.jsp
 ┃ ┃ ┃ ┃ ┣ 📂free_board
 ┃ ┃ ┃ ┃ ┃ ┣ 📜asideTest.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜free-card.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜free-list.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜free-main.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜free-write-update.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜free-write.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜free_board_aside.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜free_board_detail.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜free_board_review.jsp
 ┃ ┃ ┃ ┃ ┣ 📂login
 ┃ ┃ ┃ ┃ ┃ ┣ 📜login.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜oauthRegister.jsp
 ┃ ┃ ┃ ┃ ┣ 📂product
 ┃ ┃ ┃ ┃ ┃ ┣ 📜detail.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜product_aside.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜product_list.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜product_register.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜product_update.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜userProduct.jsp
 ┃ ┃ ┃ ┃ ┣ 📂user
 ┃ ┃ ┃ ┃ ┃ ┣ 📜board.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜info.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜info_modify.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜myPageAside.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜my_imoji.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜my_qna.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜my_qna_view.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜payment_history.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜product_history.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜product_host_history.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜wish.jsp
 ┃ ┃ ┃ ┃ ┣ 📜footer.jsp
 ┃ ┃ ┃ ┃ ┣ 📜header.jsp
 ┃ ┃ ┃ ┃ ┗ 📜main.jsp
 ┗ 📂test
 ┃ ┗ 📂java
 ┃ ┃ ┗ 📂com
 ┃ ┃ ┃ ┗ 📂store
 ┃ ┃ ┃ ┃ ┗ 📂goguma
 ┃ ┃ ┃ ┃ ┃ ┗ 📜GogumaApplicationTests.java
```
</details>



<br/>
<br/>



# 2️⃣ 프로젝트 개요
## 🍠 고구마마켓
- 고구마마켓은 사용자들이 <b>[고]</b>민 없이 중고 상품을 <b>[구]</b>매할 수 있는 온라인 <b>[마]</b>켓 플랫폼입니다. <br/><br/> 이 플랫폼은 사용자들이 중고 상품을 구매하고 판매할 수 있는 기능을 제공하며, 사용자 간의 신뢰를 기반으로 한 거래가 이루어집니다.입니다. 또한 사용자 경험을 개선하고 사용자들 간의 상호 작용을 촉진하여 커뮤니티를 활성화하는 것을 목표로 합니다.

<br/>

## 🍠 비즈니스 모델
이모티콘 구매 : 사용자가 상품을 살 때 일정 비율의 수수료가 발생합니다. <br/>
광고 배너 : 유료로 광고 공간을 제공하여 상품 노출량을 높임

<br/>
<br/>

## 🍠 역할 분담

|Name|이산하 [ 팀장 ]|강민|정영재|이지민|김병준|
|---|---|---|---|---|---|
|**position**|채팅 , 상품 , 메인|고객센터 , 이모티콘 , 자유게시판 (카테고리)|관리자 , 자유게시판 (리스트,배너)|유저 , 자유게시판 (리뷰)|상품 , 자유게시판 (상세조회)|


- 프로젝트 기간: 총 11일 (03/11 ~ 03/25)

<br/>
<br/>
<br/>

## 📚기술스택
<div class= "container">
<img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=MySQL&logoColor=white">
<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=OpenJDK&logoColor=white">
<img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white">
<img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white">
<img src="https://img.shields.io/badge/JUnit5-25A162?style=for-the-badge&logo=JUnit5&logoColor=white">
<img src="https://img.shields.io/badge/Hibernate-59666C?style=for-the-badge&logo=Hibernate&logoColor=white">
<img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white">
<img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=white">
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white">
<img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
<img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
<img src="https://img.shields.io/badge/bootstrap-ba55d3?style=for-the-badge&logo=bootstrap&logoColor=black">
</div>

###  🕵️‍♂️Front_End
<details>
<summary> FrontEnd</summary>
<div markdown="1">

- bootstrap : v5.0.0
- bootstrap icon : v1.4.1
- font-awesome : v6.0.0
- kakao map : v2
- HTML5
- CSS3
- JavaScript : v1.16.1
- sockjs-client : v1.5.2
- stomp.js : v2.3.3
- perfect-scrollbar : v1.5.2
- sweetalert : v11.10.7
- iamport 
- Popper.js : v2.11.6
- owl.carousel : v2.1.0
- retina : v2.1.0
- daum map : v2

</div>
</details>

###  🕵️‍♂️Back_End
<details>
<summary>BackEnd</summary>
<div markdown="1">
 
- springboot : v3.1.8
- MySQL : v8.0.26
- jdk : v17.0.2
- MyBatis : v3.0.3
- JSP
- JSTL : v2.0.0
- Apache Tomcat : v10.0
- net.nurigo:javaSDK : v2.2
- starter-websocket
- lombok : v1.18.32
</div>

</details>

### 개발 툴
<details>
<summary>개발 툴</summary>

- eclipse [sts4]
- Mysql v8..46 
</details>

### 협력 툴
<details>
<summary>협력 툴</summary>

- github
- discord 
</details>

### 📡API
<details>
<summary>API</summary> 
<div markdown="1">
 
- 카카오/구글/네이버 소셜 로그인 API (OAuth 2.0 프로토콜)
- 포트원 API
- 카카오 맵 API
- DAUM 우편번호 찾기 API
</div>
</details>

<br/>
<br/>
<br/>

# ⚙ 의존성
---
```
implementation 'org.springframework.boot:spring-boot-starter-web'
implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:3.0.3'
implementation group: 'org.glassfish.web', name: 'jakarta.servlet.jsp.jstl', version: '2.0.0'
implementation 'org.apache.tomcat.embed:tomcat-embed-jasper'
implementation 'org.springframework.boot:spring-boot-starter-websocket'

compileOnly 'org.projectlombok:lombok'
developmentOnly 'org.springframework.boot:spring-boot-devtools'
runtimeOnly 'com.mysql:mysql-connector-j'
annotationProcessor 'org.projectlombok:lombok'

testImplementation 'org.springframework.boot:spring-boot-starter-test'
testImplementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter-test:3.0.3'	
```


<br/>
<br/><br/>
<br/><br/>

# 3️⃣ ERD & 테이블 명세서
![goguma (1)](https://github.com/Kira7124/PlaceStation/assets/141594965/2ff9e283-ce0b-4d9c-9501-a1a2306dc2ff)


<br/>
<br/>
<br/>
<br/>


# 4️⃣ SiteMap

<img src="https://github.com/Kira7124/PlaceStation/assets/136421992/41233a00-a93a-40c8-893d-eedd33762208">

<br/>
<br/>
<br/>


# 5️⃣ 주요 기능


#### 유저 (USER)
<details>
  <summary> 기능 보기</summary>

- 소셜 로그인
- 내 정보 수정 , 탈퇴
- 이모티콘 결제, 환불
- 중고거래 내역 확인
- 상품 관리 (등록 , 수정 , 삭제)
- 자유 게시물 관리
- 고객 센터 문의
- 찜 목록 확인
</details>

#### 관리자 (MASTER , ADMIN)
<details>
  <summary> 기능 보기</summary>

- 소셜 로그인
- 내 정보 수정 , 탈퇴
- 이모티콘 관리 (등록 , 환불)
- 고객센터 관리
- 신고 관리
- 상품 관리 (삭제)
- 유저 권한 관리
- 채팅 로그 관리
- 광고 관리
- 자유게시판 관리 [카테고리 관리]
</details>

#### 중고 거래
<details>
  <summary> 기능 보기</summary>

- 전체 조회
- 채팅 
- 유저 신고
- 찜
- 이모티콘
</details>

#### 자유 게시판
<details>
  <summary> 기능 보기</summary>

- 카테고리별 전체 조회
- 좋아요
- 댓글 등록
</details>

#### 고객 센터
<details>
  <summary> 기능 보기</summary>

- 공지사항
- 1 : 1 문의
- 자주 묻는 질문
</details>

<br/>
<br/>
<br/>

# 6️⃣ 주요 기능
