/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.util.ArrayList;
import java.util.List;
import model.SanPham;

/**
 *
 * @author ACER
 */
public class MyTools {
    
    public static List<SanPham> getListByPage(List<SanPham> list, int start, int end) {
        List<SanPham> lst = new ArrayList<>();
        for (int i = start; i < end; i++) {
            lst.add(list.get(i));
        }
        return lst;
    }
}
