package com.alumni.core;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;


public class bean {
	public int ID;
	public String pwd;
	public String username;
	public int type;
	public static String fileName="D:\\Result.txt";
	public static String readFileByLines(int i) {
		File file = new File(fileName);
        BufferedReader reader = null;
        String tempString=null;
        try {
            reader = new BufferedReader(new FileReader(file));
            int line = 1;
            while (((tempString = reader.readLine()) != null)&&line<i) {
                line++;
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
		return tempString;
    }
	public static void writeByline(int ID, int Type){
	try{
	     BufferedWriter writer = new BufferedWriter(new FileWriter(new File(fileName)));

	     writer.write(String.valueOf(ID)+"\n"+String.valueOf(Type));
	     
	     writer.close();

	}catch(Exception e){

	     }

	}
	public static void emptytxt(){
		File f = new File(fileName);
		FileWriter fw = null;
		try {
			fw = new FileWriter(f);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			fw.write("");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			fw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}