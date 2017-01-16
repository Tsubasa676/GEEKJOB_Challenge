package org.BJ;//ブラックジャック親クラス

import java.util.*;

/**
 *
 * @author mbp13
 */

   abstract class Human{
      //継承先Dealer,Userで必ず実装させるための抽象メソッド入力
      abstract public void setCard(Integer setCard);
      ArrayList<Integer> myCards = new ArrayList<>();
      abstract public int open();
      abstract public boolean checkSum();
      
      
      
   }

//課題内容
//１．Humanという抽象クラスを作成以下を実装
//　openというabstractな公開メソッド用意
//　setCardというArrayListを引数とした、abstractな公開メソッド用意
//　checkSumというabstractな公開メソッド用意
//　myCardsというArrayListの変数用意

//２．１で作成した抽象クラスを継承、以下のクラスを作成
//　Dealerクラス、Userクラス

//３．まずDealerクラス完成させる
//　cardsというArrayListの変数を用意し、初期処理でこのcardsに全てトランプ持
//　dealという公開メソッド用意、cardsからランダムで2枚のカードをArrayListに返却
//　hitという公開メソッド用意、cardsからランダムで１枚のカードをArrayListに返却

//４．DealerとUser両方に必要な処理を実装し、完成させる
//　setCardはArrayListで受けたカード情報をmyCardsに追加する
//　checkSumは、myCardsを確認、まだカードが必要ならtrue不要falseを返却
//　openは、myCardsのカードの合計値を返却
//５．準備完了、２つのクラスを利用してコーディング
