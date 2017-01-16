package org.BJ;

import java.util.*;

/**
 *
 * @author mbp13
 */
public class BJ {
   public static void main (String[] args){
      Dealer de = new Dealer();
      User u = new User();
      
      System.out.println("");
      System.out.println("--BJ.javaでの出力ここから--");
      if(de.open()<17){
      de.hit();//１７未満だともう一枚ドロー
      System.out.println("ディーラーもう1枚ドロー"+de.open());
      }else{
    	  System.out.println("ディーラーオープン"+de.open());
      }
      if(u.open()<17){
      u.hit();//１７未満だともう一枚ドロー
      System.out.println("ユーザーもう1枚ドロー"+u.open());
      }else{
    	  System.out.println("ユーザーオープン"+u.open());
      }
      //u.open()>de.open()
      //de.open()>u.open()
      System.out.println("");
      if(de.open()>21&&u.open()>21){
    	  System.out.println("手札オーバーです。ディーラー勝利！");
      }else if(de.open()>21&&u.open()<22||u.open()>de.open()){
    	  System.out.println("ユーザー勝利！！");
      }else if(u.open()>21&&de.open()<22||de.open()>u.open()){
    	  System.out.println("ディーラー勝利！");
      }else if(de.open()==u.open()){
    	  System.out.println("＼引き分け／");
      }else{
    	  System.out.println("！例外発生！");
      }
      
      
      
      
      
      
      
      
      
   }
   
}
