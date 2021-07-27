package basic.studyCafe.vo;

public class ProductVO {
	private int prod_number;
	private String prod_type;	//상품 종류
	private int prod_amount;
	private String prod_name;
	private int prod_price;
	private String prod_image;
	private String prod_content;
	private int prod_readcount;
	

	public int getProd_number() {
		return prod_number;
	}


	public void setProd_number(int prod_number) {
		this.prod_number = prod_number;
	}


	public String getProd_type() {
		return prod_type;
	}


	public void setProd_type(String prod_type) {
		this.prod_type = prod_type;
	}


	public int getProd_amount() {
		return prod_amount;
	}


	public void setProd_amount(int prod_amount) {
		this.prod_amount = prod_amount;
	}


	public String getProd_name() {
		return prod_name;
	}


	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}


	public int getProd_price() {
		return prod_price;
	}


	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}


	public String getProd_image() {
		return prod_image;
	}


	public void setProd_image(String prod_image) {
		this.prod_image = prod_image;
	}


	public String getProd_content() {
		return prod_content;
	}


	public void setProd_content(String prod_content) {
		this.prod_content = prod_content;
	}


	public int getProd_readcount() {
		return prod_readcount;
	}


	public void setProd_readcount(int prod_readcount) {
		this.prod_readcount = prod_readcount;
	}


	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "prod_name";
	}
	
}
