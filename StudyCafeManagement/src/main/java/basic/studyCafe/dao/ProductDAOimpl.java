package basic.studyCafe.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import basic.studyCafe.mybatis.BoardMapper;
import basic.studyCafe.mybatis.ProductMapper;
import basic.studyCafe.vo.BoardVO;
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
	public void insertCartProduct(@Param("user_id") String user_id, @Param("prod_number") int prod_number) {
		// TODO Auto-generated method stub
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		productMapper.insertCartProduct(user_id,prod_number);
	}

	@Override
	public void insertArticle(ProductVO productVO) {
		// TODO Auto-generated method stub
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		productMapper.insertArticle(productVO);
	}	

	@Override
	public void updateProduct(ProductVO productVO) {
		// TODO Auto-generated method stub
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		productMapper.updateProduct(productVO);
	}

	@Override
	public void deleteProduct(int prod_number) {
		// TODO Auto-generated method stub
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		productMapper.deleteProduct(prod_number);	
	}





}