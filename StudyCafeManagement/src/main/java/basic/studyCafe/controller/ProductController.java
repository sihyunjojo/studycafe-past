package basic.studyCafe.controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import basic.studyCafe.service.ProductService;
import basic.studyCafe.vo.BoardVO;
import basic.studyCafe.vo.CartProductVO;
import basic.studyCafe.vo.ProductVO;
import basic.studyCafe.vo.SeatVO;


@Controller
@RequestMapping("/product/*")
public class ProductController extends HttpServlet {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private ProductService productService;

	@RequestMapping("/ProductList")
	public ModelAndView ProductList(@RequestParam(value="user_id",required = false) String user_id) {
		String path = "";
		ModelAndView mav = new ModelAndView();
		List<ProductVO> productList = productService.getproductList();
		if (user_id.equals("admin")) {
			path = "product/ProductListAdmin";
		} else {
			path = "product/ProductList";
		}
		
		mav.setViewName(path);
		mav.addObject("productList", productList);
		return mav; 
	}
	
	@RequestMapping(value = "/CartProductList", method = RequestMethod.GET)
	public ModelAndView ViewCartProductList(@RequestParam String user_id) {
		ModelAndView mav = new ModelAndView();
		List<CartProductVO> cartProductList = productService.getCartProductList(user_id);
		mav.setViewName("product/CartProductList");
		mav.addObject("cartProductList", cartProductList);
		return mav;
	} 
	
	@RequestMapping("/ProductDetail")
	public ModelAndView ProductDetail(@RequestParam(value="user_id",required = false) String user_id, @RequestParam int prod_number) {
		String path = "";
		ModelAndView mav = new ModelAndView();
		productService.increaseCount(prod_number);
		ProductVO product = productService.getProductDetail(prod_number);
		
		
		if (user_id.equals("admin")) {
			path = "product/ProductDetailAdmin";
		} else {
			path = "product/ProductDetail";
		}
		
		mav.setViewName(path);
		mav.addObject("product", product);
		return mav;
	}
	
	@RequestMapping("/ProductDetailAdmin")
	public ModelAndView ProductDetailAdmin(@RequestParam int prod_number) {
		ModelAndView mav = new ModelAndView();
		ProductVO product = productService.getProductDetail(prod_number);
		mav.setViewName("product/ProductDetailAdmin");
		mav.addObject("product", product);
		return mav;
	}
	
	@RequestMapping("/ProductListAdmin")
	public ModelAndView ProductListAdmin() {
		ModelAndView mav = new ModelAndView();
		List<ProductVO> productList = productService.getproductList();
	
		mav.setViewName("product/ProductListAdmin");
		mav.addObject("productList", productList);
		return mav; 
	}
	
	
	
	
	@RequestMapping(value = "/addCartProduct", method = RequestMethod.POST)
	public ModelAndView AddCartProduct(@RequestParam("user_id") String user_id, @RequestParam("prod_number") int prod_number) {
		productService.addCartProduct(user_id,prod_number);
		
		ModelAndView mav = new ModelAndView();
		List<CartProductVO> cartProductList = productService.getCartProductList(user_id);
		mav.setViewName("product/CartProductList");
		mav.addObject("cartProductList", cartProductList);

		return mav;
	}
	
	@RequestMapping(value = "/deleteCartProduct", method = RequestMethod.POST)
	public ModelAndView deleteCartProduct(@RequestParam("user_id") String user_id, @RequestParam("prod_number") int prod_number) {
		productService.deleteCartProduct(user_id,prod_number);
		
		ModelAndView mav = new ModelAndView();
		List<CartProductVO> cartProductList = productService.getCartProductList(user_id);
		mav.setViewName("product/CartProductList");
		mav.addObject("cartProductList", cartProductList);

		return mav;
	}
	
	
	@RequestMapping(value = "/ProductRegist", method = RequestMethod.GET)
	public String boardWriteForm() {
		return "/product/ProductRegist";
	}
	
	@RequestMapping(value = "/ProductRegist", method = RequestMethod.POST)
	public String ProductRegist(ProductVO productVO) {
		productService.registArticle(productVO);
		return "redirect:/product/ProductListAdmin";
	}
	
	@RequestMapping(value = "/ProductUpdate", method = RequestMethod.GET)
	public ModelAndView ProductUpdateForm(@RequestParam int prod_number) {
		ModelAndView mav = new ModelAndView();
		ProductVO product = productService.getProductDetail(prod_number);

		mav.setViewName("product/ProductUpdate");
		mav.addObject("product", product);
		return mav;
	}
	
	
	@RequestMapping(value = "/ProductUpdate", method = RequestMethod.POST)
	public String ProductUpdate(ProductVO product) {
		productService.modifyProduct(product);
		return "redirect:/product/ProductListAdmin";
	}
	
	
	
	@RequestMapping("/ProductDelete")
	public String Productremove(@RequestParam int prod_number) {
		productService.removeProduct(prod_number);
		return "redirect:/product/ProductList";
	}
	
	
	@RequestMapping(value = "/ProductSearchList", method = RequestMethod.POST)
	public ModelAndView viewProductSearchList(@RequestParam(defaultValue = "prod_name") String search_option,
			@RequestParam("keyword") String keyword,@RequestParam("user_id") String user_id, ProductVO searchProduct) {
		String path = "";
		ModelAndView mav = new ModelAndView();

		List<ProductVO> productSearchList;
		if (search_option.equals("prod_name")) {
			searchProduct.setProd_name(keyword);
			productSearchList = productService.getNameSearchList(searchProduct);
		} 
		else {
			searchProduct.setProd_type(keyword);
			productSearchList = productService.getTypeSearchList(searchProduct);
		}

		if (user_id.equals("admin")) {
			path = "product/ProductSearchListAdmin";
		} else {
			path = "product/ProductSearchList";
		}
		
		mav.setViewName(path);
		mav.addObject("productSearchList", productSearchList);	

		return mav;
	}
	
	@RequestMapping(value = "/ProductTypeList")
	public ModelAndView viewProductTypeList(@RequestParam String prod_type, ProductVO searchProduct ) {
		ModelAndView mav = new ModelAndView();

		List<ProductVO> productSearchList;
		searchProduct.setProd_type(prod_type);
		productSearchList = productService.getTypeSearchList(searchProduct);
		
		mav.setViewName("product/ProductSearchList");
		mav.addObject("productSearchList", productSearchList);	

		return mav;
	}
	
}
