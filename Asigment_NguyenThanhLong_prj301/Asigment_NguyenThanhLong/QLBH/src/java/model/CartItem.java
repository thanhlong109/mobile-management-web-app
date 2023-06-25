
package model;


public class CartItem {
    private SanPham sp;
    private int amount;

    public CartItem() {
    }

    public CartItem(SanPham sp, int amount) {
        this.sp = sp;
        this.amount = amount;
    }

    public SanPham getSp() {
        return sp;
    }

    public void setSp(SanPham sp) {
        this.sp = sp;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
    
}
