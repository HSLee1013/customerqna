package kr.co.greenart.web.customer.qna;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.jdbc.SQL;

@Mapper
public interface QNA_Mapper {
	@Insert("INSERT INTO customerqna (title, content, username, password) VALUES (#{title}, #{content}, #{username}, #{password})")
//	@SelectKey(statement = "SELECT LAST_INSERT_ID()", keyColumn = "article_id", keyProperty = "articleId", resultType = Integer.class, before = false)
	@Options(useGeneratedKeys = true, keyProperty = "articleId")
	int save(QNA qna);
	
	@SelectProvider(type = SQLProvider.class, method = "count")
	int count(String search);

	@SelectProvider(type = SQLProvider.class, method = "select")	
	@Results(id = "qnaList",
			value = {
					@Result(column = "article_id", property = "articleId")
					,@Result(column = "title", property = "title")
					,@Result(column = "content", property = "content")
					,@Result(column = "username", property = "username")
					,@Result(column = "views", property = "views")
					,@Result(column = "is_secure", property = "secure")
			})
	List<QNA> findAll(MyOrder order, int pageSize, int offset, String search);

	@Select({"SELECT article_id, title, content, username, views, is_secure FROM customerqna"
			,"WHERE is_secure = 0"
			,"ORDER BY article_id DESC"
			,"LIMIT #{pageSize} OFFSET #{offset}"
	})
	@ResultMap("qnaList")
	List<QNA> findBySecureIsFalse(int pageSize, int offset);

	// TODO 구현
	@Select("SELECT * FROM customerqna where article_id = #{articleId}")
	@Results(id = "qnaMapping",
			value = {
			@Result(column = "article_id", property = "articleId")
			,@Result(column = "title", property = "title")
			,@Result(column = "content", property = "content")
			,@Result(column = "username", property = "username")
			,@Result(column = "password", property = "password")
			,@Result(column = "views", property = "views")
			,@Result(column = "created_at", property = "createdAt")
			,@Result(column = "updated_at", property = "updatedAt")
			,@Result(column = "is_secure", property = "secure")
			,@Result(column = "is_deleted", property = "deleted")
			}
	)
	QNA findById(Integer articleId);

	@Select("SELECT is_secure FROM customerqna WHERE article_id = #{articleId}")
	int findSecureByPk(int articleId);

	@Update("UPDATE customerqna SET views = views + 1 WHERE article_id = #{articleId}")
	int updateCount(int articleId);

//	void updateDelete();
	
	class SQLProvider {
		public String select(MyOrder order, int pageSize, int offset, String search) {
			return new SQL()
					.SELECT("article_id, title, content, username, views, is_secure")
					.FROM("customerqna")
					.WHERE(search)
					.ORDER_BY(order.getArticleOrder())
					.LIMIT(pageSize)
					.OFFSET(offset)
					.toString();					
		}
		
		public String count(String search) {
			return new SQL()
					.SELECT("count(*)")
					.FROM("customerqna")
					.WHERE(search)
					.toString();
		}
	}
}
