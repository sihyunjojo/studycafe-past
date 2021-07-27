package basic.studyCafe.mybatis;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import basic.studyCafe.vo.CartProductVO;
import basic.studyCafe.vo.ProductVO;

public interface ProductMapper {

	List<ProductVO> selectProductList();
	ProductVO selectProduct(int prod_number);
	List<CartProductVO> selectCartProductList(@Param("user_id") String user_id);
	void insertCartProduct(@Param("user_id") String user_id, @Param("prod_number") int prod_number);
	


	
	
}
