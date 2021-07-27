package basic.studyCafe.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import basic.studyCafe.mybatis.ProductMapper;
import basic.studyCafe.mybatis.SeatMapper;
import basic.studyCafe.vo.CartProductVO;
import basic.studyCafe.vo.ProductVO;

@Repository
public class ProductDAOimpl implements ProductDAO {

	@Autowired
	private SqlSession sqlSession;
	// SqlSessionTemplate이 SqlSession을 구현함
	
	@Override
	public List<ProductVO> selectProductList() {
		// TODO Auto-generated method stub
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<ProductVO> productList = productMapper.selectProductList();
		return productList;
	}

	@Override
	public ProductVO selectProduct(int prod_number) {
		// TODO Auto-generated method stub
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		ProductVO product = productMapper.selectProduct(prod_number);
		return product;
	}

	@Override
	public List<CartProductVO> selectCartProductList(String user_id) {
		// TODO Auto-generated method stub
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<CartProductVO> cartProductList = productMapper.selectCartProductList(user_id);
		return cartProductList;
	}


	@Override
	public void insertCartProduct(String user_id, int prod_number) {
		// TODO Auto-generated method stub
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		productMapper.insertCartProduct(user_id,prod_number);
	}



}