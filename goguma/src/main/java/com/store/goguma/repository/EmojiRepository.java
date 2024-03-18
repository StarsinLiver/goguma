package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.entity.Emoji;
import com.store.goguma.entity.EmojiHistory;
import com.store.goguma.entity.MainEmoji;

@Mapper
public interface EmojiRepository {

	/**
	 * @fileName : EmojiRepository.java
	 * @Project : goguma
	 * @Date : 2024. 3. 11.
	 * @작성자 : 강민
	 * @설명 : 
	 */
	
	
	public int mainUpload(MainEmoji entity);

	public Integer getMainLastId();

	public int subUpload(Emoji emoji);


	// 메인 이모지에 포함된 (group_id) 모든 이모지 가져오기
	public List<Emoji> findByGroupId(@Param("mainEmojiList")List<Integer> mainEmojiList);

	public List<MainEmoji> getEmojiMainList();

	public List<MainEmoji> getEmojiMainListPopular();

	public List<Emoji> getEmojiDetailList(int id);

	public MainEmoji getEmojiDetailMain(int id);

	public int emojiOrder(EmojiHistory entity);

	public List<MainEmoji> getEmojiMainListHome();

	public List<MainEmoji> emojiSearch(String title);

	public MainEmoji getMainEmoji(Integer id);

	public int mainEmojiDownloadCountPlus(MainEmoji mainEmoji);

	// 메인 이모지 변경
	public int updateMainEmoji(@Param("file") String file , @Param("name") String name , @Param("price") int price , @Param("id") int id);
	// 서브 이모지 전체 삭제
	public int deleteSubEmojiByGroupId(int groupId);
	// 메인 이모지 삭제
	public int deleteMainEmojiById(int id);

}
