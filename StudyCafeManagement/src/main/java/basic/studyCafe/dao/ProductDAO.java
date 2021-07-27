package basic.studyCafe.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import basic.studyCafe.vo.CartProductVO;
import basic.studyCafe.vo.ProductVO;

public interface ProductDAO {
	public List<ProductVO> selectProductList();
	public ProductVO selectProduct(int prod_number);
	public List<CartProductVO> selectCartProductList(String user_id);
	public void insertCartProduct(@Param("user_id") String user_id, @Param("prod_number") int prod_number);
	public void insertArticle(ProductVO productVO);
	public void updateProduct(ProductVO productVO);
	public void deleteProduct(int prod_number);
}
 