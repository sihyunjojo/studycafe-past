package basic.studyCafe.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import basic.studyCafe.vo.CartProductVO;
import basic.studyCafe.vo.ProductVO;


public interface ProductService {
	public List<ProductVO> getproductList();
	public ProductVO getProductDetail(int prod_number);
	public List<CartProductVO> getCartProductList(String user_id);
	public void addCartProduct(@Param("user_id") String user_id, @Param("prod_number") int prod_number);
	public void registArticle(ProductVO productVO);
	public void modifyProduct(ProductVO productVO);
	public void removeProduct(int prod_number);

}
