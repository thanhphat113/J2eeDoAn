package model;

import java.util.ArrayList;
import java.util.HashMap;

public class Cart extends HashMap{
	public void addCart(ProductDTO sanpham) {
		String key = sanpham.getSanpham().getMaSP();
		if(this.containsKey(key)) {
			int soluongCu = ((ProductDTO)this.get(key)).getSoluong();
			((ProductDTO)this.get(key)).setSoluong(soluongCu+1);
		}else {
			this.put(sanpham.getSanpham().getMaSP(), sanpham);
		}
	}
	
	public boolean removeCart(String code) {
		if(this.containsKey(code)) {
			this.remove(code);
			return true;
		}
		return false;
	}
	
//	public ArrayList<ProductDTO> all(){
//		ArrayList<ProductDTO> list = 
//		return list;
//	}
	
	public Cart() {
		super();
	}
}
