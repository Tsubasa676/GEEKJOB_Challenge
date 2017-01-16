package org.BJ;

import java.util.*;

public class User extends Human{
	ArrayList<Integer> cards = new ArrayList<>();
	int x;//dealの２まい
	int num = 0;
	public User(){//52枚ではなく13枚のトランプを用意し、ブラックジャックをする。
		System.out.print("Uトランプ用意");
		   for(int card = 1; card<14; card++){
	         cards.add(card);
		   }
		   Collections.shuffle(cards);//要素をシャッフルする。
	       System.out.println(cards);
	       deal();
	   }
	
	public ArrayList<Integer> deal(){//課題dealという公開メソッド用意、cardsからランダムで2枚のカードをArrayListに返却
		System.out.print("U先頭2枚 "+cards.get(0)+"と"+cards.get(1)+"ドロー");
		x=1;//dealの2枚を決める(配列の先頭2要素)
		myCards.add(cards.get(0));myCards.add(cards.get(1));
		cards.remove(0);cards.remove(0);//dealの2枚除外
		num=cards.get(0)+cards.get(1);
		System.out.println("後"+cards);
		return myCards;
	 }

	@Override
	public int open() {
	      int op = 0;
	      for(int o=0;o<myCards.size();o++){
	         op += myCards.get(o);
	      }
	      num = op;
	      return op;
	}

	@Override
	public boolean checkSum() {
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
	public void setCard(Integer setCard) {
		
		
	}

}
