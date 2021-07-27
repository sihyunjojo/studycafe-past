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
	public ModelAndView ProductList() {

		ModelAndView mav = new ModelAndView();
		List<ProductVO> productList = productService.getproductList();
		mav.setViewName("product/ProductList");
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
	public ModelAndView ProductDetail(@RequestParam int prod_number) {
		ModelAndView mav = new ModelAndView();
		ProductVO product = productService.getProductDetail(prod_number);
		mav.setViewName("product/ProductDetail");
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
	
	
	
	@RequestMapping(value = "/addCartProduct", method = RequestMethod.POST)
	public ModelAndView AddCartProduct(@RequestParam("user_id") String user_id, @RequestParam("prod_number") int prod_number) {
		productService.addCartProduct(user_id,prod_number);
		
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
		return "redirect:/product/ProductList";
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
		return "redirect:/product/ProductList";
	}
	
	
	
	@RequestMapping("/ProductDelete")
	public String Productremove(@RequestParam int prod_number) {
		productService.removeProduct(prod_number);
		return "redirect:/product/ProductList";
	}
	
	@RequestMapping(value = "/ProductSearched", method = RequestMethod.GET)
	public String ProductSearched() {
		return "product/ProductSearched";

	}
}
