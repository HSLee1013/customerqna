package kr.co.greenart.web.customer.qna;

public class MyOrder {
	private String column;
	private String direction;

	public MyOrder(String column, String direction) {
		super();
		this.column = column;
		this.direction = direction;
	}

	public String getOrder() {
		return column + " " + direction;
	}
	
	public String getArticleOrder() {
		return column + " " + direction+", article_id DESC";
	}
}
