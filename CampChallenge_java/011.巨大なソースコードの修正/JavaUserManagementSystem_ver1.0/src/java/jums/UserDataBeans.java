/*
課題３
フォームから受け取ったデータを格納
これを利用して表示や分岐などをする。
 */
package jums;

import java.sql.Timestamp;
import java.util.*;

/**
 *
 * @author mbp13
 */
public class UserDataBeans {
   private int userID;
   private String name;
   private Date birthday;
   private int type;
   private String tell;
   private String comment;
   private Timestamp newDate;
   
   public int getUserID() {
        return userID;
    }
    public void setUserID(int userID) {
        this.userID = userID;
    }
    
    public String getName(){
        return name;
    }
    public void setName(String name){
        this.name = name;
    }
    
    public Date getBirthday(){
        return birthday;
    }
    public void setBirthday(Date birthday){
        this.birthday = birthday;
    }
    
    public String getTell(){
        return tell;
    }
    public void setTell(String tell){
        this.tell = tell;
    }
    
    public int getType(){
        return type;
    }
    public void setType(int type){
        this.type = type;
    }
    
    public String getComment(){
        return comment;
    }
    public void setComment(String comment){
        this.comment = comment;
    }
       
    public Timestamp getNewDate() {
        return newDate;
    }
    public void setNewDate(Timestamp newDate) {
        this.newDate = newDate;
    }
}
