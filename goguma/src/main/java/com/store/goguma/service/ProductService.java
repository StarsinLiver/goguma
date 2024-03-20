package com.store.goguma.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.store.goguma.admin.dto.AdminProductDto;
import com.store.goguma.entity.Product;
import com.store.goguma.product.dto.ProductDTO;
import com.store.goguma.product.dto.ProductSearchDto;
import com.store.goguma.product.dto.ProductUserDto;
import com.store.goguma.product.dto.ProductWriteFormDTO;
import com.store.goguma.repository.ProductRepository;
import com.store.goguma.user.dto.ModifyUserDto;
import com.store.goguma.user.dto.my.RequestPageDTO;
import com.store.goguma.user.dto.my.ResponsePageDTO;
import com.store.goguma.utils.Define;
import com.store.goguma.utils.page.PageReq;
import com.store.goguma.utils.page.PageRes;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductService {

	
	private final ProductRepository productRepository;
	
	// 모든 상품 리스트
	public List<ProductDTO> findAllProduct() {
	    List<Product> productList = productRepository.findAllProduct();

	    List<ProductDTO> productDTOList = new ArrayList<>();

	    for (Product product : productList) {
	        ProductDTO productDTO = ProductDTO.builder()
	                .pId(product.getPId())
	                .address(product.getAddress())
	                .name(product.getName())
	                .price(product.getPrice())
	                .hostId(product.getHostId())
	                .description(product.getDescription())
	                .file(product.getFile())
	                .mainCategoryId(product.getMainCategoryId())
	                .subCategoryId(product.getSubCategoryId())
	                .createAt(product.getCreateAt())
	                .updateAt(product.getUpdateAt())
	                .deleteAt(product.getDeleteAt())
	                .deleteYn(product.getDeleteYn())
	                .confirmYn(product.getConfirmYn())
	                .build();

	        productDTOList.add(productDTO);
	    }
	    return productDTOList;
	}
	
	public ProductDTO findAllBypId(Integer pId) {
		
		Product product = productRepository.findAllBypId(pId);
		
//		// 확인
//		if (product == null) {
//			throw new CustomRestfulException("해당 상품이 없거나 오류가 발생하였습니다.", HttpStatus.SC_INTERNAL_SERVER_ERROR);
//		}
		
        ProductDTO dto = ProductDTO.builder()
                .pId(product.getPId())
                .address(product.getAddress())
                .name(product.getName())
                .price(product.getPrice())
                .hostId(product.getHostId())
                .description(product.getDescription())
                .file(product.getFile())
                .mainCategoryId(product.getMainCategoryId())
                .subCategoryId(product.getSubCategoryId())
                .createAt(product.getCreateAt())
                .updateAt(product.getUpdateAt())
                .deleteAt(product.getDeleteAt())
                .deleteYn(product.getDeleteYn())
                .confirmYn(product.getConfirmYn())
                .countWishList(product.getCountWishList())
                .countChatRoom(product.getCountChatRoom())
                .build();
        
        return dto;
	}
	
	// 유저가 등록한 상품목록 조회
	public List<ProductUserDto> findByHostId(Integer hostId) {

	    List<ProductUserDto> userProdList = productRepository.findByHostId(hostId);
	    return userProdList;
	}
	

	/**
	 * 전체 검색 조회
	 * @param search
	 * @param searchAdress
	 * @param lowPrice
	 * @param highPrice
	 * @param sortWishList
	 * @param sortChatRoom
	 * @param sortLowPrice
	 * @param sortHighPrice
	 * @param page
	 * @return
	 */
	public PageRes<ProductSearchDto> searchAll(String search , String searchAddress ,int lowPrice , int highPrice , String sortWishList , String sortChatRoom , String sortLowPrice , String sortHighPrice , PageReq page) {

		List<ProductSearchDto> list = productRepository.searchAll(search, searchAddress, lowPrice, highPrice, sortWishList, sortChatRoom, sortLowPrice, sortHighPrice, page);
		int count = productRepository.countSearchAll(search, searchAddress, lowPrice, highPrice);
		PageRes<ProductSearchDto> pageRes = new PageRes<>(list , page.getPage() , count , page.getSize());
		return pageRes;
	}
	
	// 상품 찜,채팅 개수
	public List<ProductDTO> findWishAndChat(Integer pId) {

	    List<Product> userProdList = productRepository.findWishAndChat(pId);
	    List<ProductDTO> userProdListDTO = new ArrayList<>();

	    for (Product product : userProdList) {
	        ProductDTO productDTO = new ProductDTO();
	        productDTO.setPId(product.getPId());
	        productDTO.setAddress(product.getAddress());
	        productDTO.setName(product.getName());
	        productDTO.setPrice(product.getPrice());
	        productDTO.setHostId(product.getHostId());
	        productDTO.setDescription(product.getDescription());
	        productDTO.setFile(product.getFile());
	        productDTO.setMainCategoryId(product.getMainCategoryId());
	        productDTO.setSubCategoryId(product.getSubCategoryId());
	        productDTO.setCreateAt(product.getCreateAt());
	        productDTO.setUpdateAt(product.getUpdateAt());
	        productDTO.setDeleteAt(product.getDeleteAt());
	        productDTO.setDeleteYn(product.getDeleteYn());
	        productDTO.setConfirmYn(product.getConfirmYn());
	        productDTO.setCountWishList(product.getCountWishList());
	        productDTO.setCountChatRoom(product.getCountChatRoom());

	        userProdListDTO.add(productDTO);
	    }
	    return userProdListDTO;
	}
	
	// 메인 상품
	public List<ProductSearchDto> findLimitEightFromMain() {
		return productRepository.findLimitEightFromMain();
	}
	
	public int countProductAll() {
		return productRepository.countProductAll();
	}
	
	// 관리자 계쩡 상품 전체 보기
	public ResponsePageDTO adminFindAll(RequestPageDTO pageDTO) {
		int start = (pageDTO.getPg() -1) * pageDTO.getSize();
		
		List<AdminProductDto> list = productRepository.adminFindAll(start , pageDTO.getSearch() , pageDTO.getSearchType());
		int count = productRepository.adminCountFindAll(pageDTO.getSearch() , pageDTO.getSearchType());
		
		return ResponsePageDTO.builder()
				.requestPageDTO(pageDTO)
				.dtoList(list)
				.total(count)
				.build();
	}
	
	// 관리자 계정에서 상품 삭제
	@Transactional
	public int adminDeleteProduct(int pId) {
		return productRepository.adminDeleteProduct(pId);
	}
	
	// 상품 등록
	@Transactional
	public int writeProduct(ProductWriteFormDTO dto, int uId) {
		String address = dto.getAddr1() + " " + dto.getAddr2();
		String file = "";
		
		for(MultipartFile i : dto.getFile()) {
			file += uploadProfile(i) + ",";
		}
		file.substring(0 , file.length() - 1);
		
		Product productEntity = Product.builder()
								.address(address)
								.name(dto.getName())
								.price(dto.getPrice())
								.hostId(uId)
								.file(file)
								.description(dto.getDescription())
								.mainCategoryId(dto.getMainCategoryId())
								.subCategoryId(dto.getSubCategoryId())
								.build();
		
		return productRepository.insertProduct(productEntity);
	}
	
	// 사진 등록
	public String uploadProfile(MultipartFile mf) {
		
		log.info("fileUpload...1");
        log.info("fileUpload...2"+mf);
        
        if(!mf.isEmpty()){
        	
            // 파일 첨부 했을 경우
            String path = new File(Define.UPLOAD_FILE_DERECTORY).getAbsolutePath();
            log.info("fileUpload...3"+path);
            File directory = new File(Define.UPLOAD_FILE_DERECTORY);
            
            // 디렉토리가 존재하지 않으면 생성
            if (!directory.exists()) {
                directory.mkdirs();
            }
            
            // 이름 중복처리
            String oName = mf.getOriginalFilename();
            String ext = oName.substring(oName.lastIndexOf("."));
            String sName = UUID.randomUUID().toString()+ext;

            log.info("fileUpload...4"+oName);

            try {
                log.info("fileUpload...5");
                
                // 파일 등록
                mf.transferTo(new File(path, sName));
            } catch (IOException e) {
                throw new RuntimeException("사진 등록에 실패했습니다.");
            }

            return sName;

        }
        // 파일 첨부 안했을 경우
        return null;
		
	}
	
	/**
	 * 상품 거래 완료
	 * @param pId
	 * @return
	 */
	@Transactional
	public int updateConfirmYn(int pId) {
		return productRepository.updateConfirmYn(pId);
	}
	
}
