package model;

import java.util.HashMap;

public class Cart extends HashMap{
	public void addCart(ProductDTO sanpham) {
<<<<<<< HEAD
		String key = sanpham.getSanpham().getMaCT();
=======
		String key = sanpham.getSanpham().getMasp();
>>>>>>> 1be078e5f6224451b3723f85e2b6d596aaff18f4
		if(this.containsKey(key)) {
			int soluongCu = ((ProductDTO)this.get(key)).getSoluong();
			((ProductDTO)this.get(key)).setSoluong(soluongCu+1);
		}else {
<<<<<<< HEAD
			this.put(sanpham.getSanpham().getMaCT(), sanpham);
=======
			this.put(sanpham.getSanpham().getMasp(), sanpham);
>>>>>>> 1be078e5f6224451b3723f85e2b6d596aaff18f4
		}
	}
	
	public boolean removeCart(String code) {
		if(this.containsKey(code)) {
			this.remove(code);
			return true;
		}
		return false;
	}
        
        public void updateCart(String code, int quantity) {
		((ProductDTO)this.get(code)).setSoluong(quantity);
	}
	
	public Cart() {
		super();
	}
}
