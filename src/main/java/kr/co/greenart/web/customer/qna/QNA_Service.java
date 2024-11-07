package kr.co.greenart.web.customer.qna;

import java.util.List;

public interface QNA_Service {
	int save(QNA qna);
	
	int count(String search);
	
	QNA findById(Integer articleId, boolean chkSecure);

	List<QNA> findAll(MyOrder order, int pageSize, int offset, String search);
	
	boolean chkPassword(Integer articleId, String password);
	
	int update(QNA qna);
	
/*
1. 게시글 작성

필수 입력 항목: 제목, 내용, 유저이름, 비밀번호 // 함
비밀번호는 게시글 수정/삭제 시 필요 
	
2. 게시글 조회
	
모든 사용자가 게시글 열람 가능 (비밀글은 비밀번호 일치시) // 비밀글 비밀번호 아직 
조회수 자동 증가 // 함
최신순/조회수순/댓글수순 정렬 가능 // 댓글순 빼고 함
페이지당 20개 게시글 표시 // 함

3. 게시글 수정/삭제

작성 시 입력한 비밀번호로 인증 // 함
수정 이력 저장
삭제 시 실제 삭제가 아닌 논리 삭제 처리

4. 검색 기능

검색 대상: 제목, 내용, 태그

5. 관리자 기능

비밀 게시글 조회
게시글 강제 삭제

6. 공유

게시글 공유 링크 생성
 */
}
