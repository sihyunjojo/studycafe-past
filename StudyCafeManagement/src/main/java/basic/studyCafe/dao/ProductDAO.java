package basic.studyCafe.dao;

import java.util.ArrayList;
import java.util.List;

import basic.studyCafe.vo.CartProductVO;
import basic.studyCafe.vo.ProductVO;

public interface ProductDAO {
	public List<ProductVO> selectProductList();
	public ProductVO selectProduct(int prod_number);
	public List<CartProductVO> selectCartProductList(String user_id);
	public void insertCartProduct(String user_id, int prod_number);
}
 