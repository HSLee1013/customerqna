package kr.co.greenart.web.customer.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.greenart.web.util.QNA_NotFoundException;
import kr.co.greenart.web.util.QNA_isSecure;

@Service
public class QNA_ServiceImpl implements QNA_Service {

	@Autowired
	private QNA_Mapper mapper;

	@Override
	@Transactional(readOnly = false)
	public int save(QNA qna) {
		int rows = mapper.save(qna);
		if (rows == 1) {
			return qna.getArticleId();
		}
		return 0;
	}

	@Override
	@Transactional
	public int count(String search) {
		return mapper.count(search);
	}

	@Override
	@Transactional
	public QNA findById(Integer articleId) {
		QNA qna = mapper.findById(articleId);

		if (qna == null) {
			throw new QNA_NotFoundException(articleId);
		}

		if (qna.getSecure()) {
			throw new QNA_isSecure(articleId);
		}

		int rows = mapper.updateCount(articleId);
		if (rows == 1) {
			qna.setViews(qna.getViews() + 1);
		}

		return qna;
	}

	@Override
	@Transactional
	public List<QNA> findAll(MyOrder order, int pageSize, int offset, String search) {
		return mapper.findAll(order, pageSize, offset, search);
	}

	@Override
	public boolean chkPassword(Integer articleId, String password) {
		return mapper.chkPassword(articleId, password) == 1;
	}

}
