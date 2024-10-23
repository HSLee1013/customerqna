package kr.co.greenart.web.customer;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface QnAMapper {
	@Insert("INSERT INTO customerqna (title, content, username, password) VALUES (#{title},#{content},#{username},#{password})")
	void q2(String title, String content, String username, String password);

	@Select("SELECT article_id, title, username, is_secure FROM customerqna")
	void q3();

	@Select("SELECT article_id, title, username, is_secure FROM customerqna where is_secure = 0")
	void q3_1();

	@Select("SELECT title, content, username FROM customerqna where atricle_id = #{article_id}")
	void q4(int article_id);

	@Select("SELECT is_secure FROM customerqna WHERE article_id = #{article_id}")
	void q5(int article_id);

	@Update("UPDATE customerqna SET views = views + 1 WHERE article_id = #{article_id}")
	void q6(int article_id);

	@Update("UPDATE customerqna SET is_deleted = 1 WHERE article_id = #{article_id} AND password = #{password}")
	void q7(int article_id, String password);
}
