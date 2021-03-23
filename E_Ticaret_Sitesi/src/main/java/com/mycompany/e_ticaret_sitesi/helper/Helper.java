
package com.mycompany.e_ticaret_sitesi.helper;


public class Helper {
    public static String get50Words(String acıklama)
    {
       String[] strs= acıklama.split("");
       if(strs.length>50)
       {
           String res="";
           for(int i=0;i<50;i++)
           {
               
               res=res+strs[i];
           }
           return (res+"...");
       }else
       {
           return (acıklama+"...");
       }
    }
}
