/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.BJ;

import java.util.*;

/**
 *
 * @author mbp13
 */
public class Dealer extends Human{
   
   ArrayList<Integer> cards = new ArrayList<>();
   ArrayList<Integer> Dcards = new ArrayList<>();
   int x;//dealの２まい
   int num = 0;

   public Dealer(){//52枚ではなく13枚のトランプを用意し、ブラックジャックをする。
	   System.out.print("Dトランプ用意");
	   for(int card = 1; card<14; card++){
         cards.add(card);
      }
      Collections.shuffle(cards);//要素をシャッフルする。
      System.out.println(cards);
      deal();
   }
   
   public ArrayList<Integer> deal(){//課題dealという公開メソッド用意、cardsからランダムで2枚のカードをArrayListに返却
	   System.out.print("D先頭2枚 "+cards.get(0)+"と"+cards.get(1)+"ドロー");
	   x=1;//dealの2枚を決める(配列の先頭2要素)
	   myCards.add(cards.get(0));myCards.add(cards.get(1));
	   cards.remove(0);cards.remove(0);//dealの2枚除外
	   num=cards.get(0)+cards.get(1);
	   System.out.println("後"+cards);
	   return myCards;
   }
   
   @Override
   public boolean checkSum(){//myCardsを確認、カードの数合わせ。場合によってはUserにもう一枚カードを引かせる。
	  boolean check = false;
      if(num<17){
    	check = true;
      }
      	return check;
   }
   
   public ArrayList<Integer> hit(){//課題hitという公開メソッド用意、cardsからランダムで１枚のカードをArrayListに返却
	  if(checkSum()){
		  myCards.add(cards.get(0));
		  cards.remove(0);
	  }
	  return myCards;
   }
   
   @Override
   public int open(){//myCardsのカードの合計値を返却します
      int op = 0;
      for(int o=0;o<myCards.size();o++){
         op += myCards.get(o);
      }
      num = op;
      return op;
   }
   
   public void setCard() {
	   Dcards = myCards;
	   return;
   }
@Override
public void setCard(Integer setCard) {
	// TODO 自動生成されたメソッド・スタブ
	
}

   
   
}//Dealerクラスの終わり


//エースの処理
//      if(x==0){//エースが出た時、１として扱うか１１と扱うかの処理ここから
//	 int cardx =(11+cards.get(y));
//	 if(cardx==20||cardx==21){//エースを11とした時20or21になる場合の処理
//            //処理記入
//	 }
//      }else if(y==0){//エースを11とした時20or21になる場合の処理
//	 int cardy =(11+cards.get(x));
//	 if(cardy==20||cardy==21){//エースを11とした時20or21になる場合の処理
//            //処理記入
//	 }
//      }//エースが出た時、１として扱うか１１と扱うかの処理ここまで