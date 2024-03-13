package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.store.goguma.entity.EmojiHistory;
import com.store.goguma.user.dto.OauthDTO;

@Mapper
public interface AdminRepository {

	void modifyAdminByEmail(OauthDTO dto);

	OauthDTO selectAdminByUid(Integer uId);

	List<EmojiHistory> findEmojiHistoryByUser(int start);

	int countEmojiHistoryByCancleY();

	EmojiHistory selectCancelByMaerchantId(String merchantId);

	void updateConfirmPayment(String merchantId);
}
