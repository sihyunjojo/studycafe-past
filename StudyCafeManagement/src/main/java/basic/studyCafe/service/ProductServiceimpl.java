package basic.studyCafe.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import basic.studyCafe.dao.ProductDAO;
import basic.studyCafe.vo.CartProductVO;
import basic.studyCafe.vo.ProductVO;
import basic.studyCafe.vo.SeatVO;

@Service
public class ProductServiceimpl implements ProductService{
	@Autowired
	private ProductDAO productDAO;

	@Override
	public List<ProductVO> getproductList() {
		// TODO Auto-generated method stub
		List<ProductVO> productList = productDAO.selectProductList();
		return productList;
	}

	@Override
	public ProductVO getProductDetail(int prod_number) {
		// TODO Auto-generated method stub
		ProductVO product = productDAO.selectProduct(prod_number);
		return product;
	}

	@Override
	public List<CartProductVO> getCartProductList(String user_id) {
		// TODO Auto-generated method stub
		List<CartProductVO> cartProductList = productDAO.selectCartProductList(user_id);
		return cartProductList;
	}

	@Override
	public void addCartProduct(@Param("user_id") String user_id, @Param("prod_number") int prod_number) {
		// TODO Auto-generated method stub
		productDAO.insertCartProduct(user_id,prod_number);

	}

	@Override
	public void registArticle(ProductVO productVO) {
		// TODO Auto-generated method stub
		productDAO.insertArticle(productVO);
	}

	@Override
	public void modifyProduct(ProductVO productVO) {
		// TODO Auto-generated method stub
		productDAO.updateProduct(productVO);

	}

	@Override
	public void removeProduct(int prod_number) {
		// TODO Auto-generated method stub
		productDAO.deleteProduct(prod_number);
	}







}
