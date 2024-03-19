package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.admin.dto.AdminReportDTO;
import com.store.goguma.admin.dto.EmojiHistoryDto;
import com.store.goguma.admin.dto.EmojiModifyDTO;
import com.store.goguma.entity.Emoji;
import com.store.goguma.entity.EmojiHistory;
import com.store.goguma.entity.MainEmoji;
import com.store.goguma.report.dto.ReportDTO;
import com.store.goguma.user.dto.OauthDTO;

@Mapper
public interface AdminRepository {

	void modifyAdminByEmail(OauthDTO dto);

	OauthDTO selectAdminByUid(Integer uId);

	List<EmojiHistoryDto> findEmojiHistoryByUser(@Param("start")int start , @Param("search") String search , @Param("searchType") String searchType);

	int countEmojiHistoryByCancleY( @Param("search") String search , @Param("searchType") String searchType);

	EmojiHistory selectCancelByMaerchantId(String merchantId);

	void updateCancelYnPayment(String merchantId);

	boolean modifyAdminEmojiModify(EmojiModifyDTO dto);

	int mainModify(MainEmoji entity);

	int subModify(Emoji emoji);

	Integer getMainLastId();

	List<ReportDTO> selecReportAll(@Param("start")int start , @Param("search") String search , @Param("searchType") String searchType);

	int countReportAll(@Param("search") String search , @Param("searchType") String searchType);

	ReportDTO selectReportReasonById(int id);

}
