
package model;

import dao.SanPhamDAO;
import java.util.ArrayList;

/**
 *
 * @author ACER
 */
public class CartList extends ArrayList<CartItem>{
    public void addToCart(String msp, int sl){
        if(this.size()>0){
            int found = containSp(msp);
            if(found!=-1){
                CartItem ci = this.get(found);
                ci.setAmount(ci.getAmount()+sl);
            }else{
                SanPhamDAO spd = new SanPhamDAO();
                this.add(new CartItem(spd.details(msp),sl));
            }
        }else{
            SanPhamDAO spd = new SanPhamDAO();
            this.add(new CartItem(spd.details(msp),sl));
        }
    }
    public void delete(String msp){
        if(this.size()>0){
            int found = containSp(msp);
            if(found!=-1){
                this.remove(found);
            }
        }
    }
    public int containSp(String msp){
        for(int i=0;i<this.size();i++){
            if(this.get(i).getSp().getMasp().equals(msp)){
                return i;
            }
        }
        return -1;
    }
    public double calMoney(){
        double money=0;
        for(CartItem ci : this){
            SanPham sp = ci.getSp();
            money += ci.getAmount()*(sp.getDongia()-sp.getKhuyenmai()*sp.getDongia());
        }
        return money;
    }
}
