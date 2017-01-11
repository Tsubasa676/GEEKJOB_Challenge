package org.ClassKadai;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.PrintWriter;
/**
 *
 * @author mbp13
 */
public class ClassKadai12 {
//課題１　「クラス作成」ここから
   //パブリックな変数２つ用意(フィールド)
   public int a;
   public int b;
   //２つの変数に値を設定するパブリックなメソッド
   public void A(){
      a=12;
   }
   public void B(){
      b=24;
   }
   //２つの変数の中身をprintするパブリックなメソッド
   public void C(PrintWriter out,int a,int b){
      //サーブレット「System.outとoutは異なる」
      out.print(a);
      out.print(b);
   }
//課題１　「クラス作成」ここまで
//ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
//課題２　「クラス継承」ここから
   //２つの変数の中身をクリアするパブリックなメソッド
   public void Da(){
      a=0;
   }
   public void Db(){
      b=0;
   }
//課題２　「クラス継承」ここまで

}