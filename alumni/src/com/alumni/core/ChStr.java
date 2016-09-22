package com.alumni.core;

public class ChStr {
    public static String toChinese(String strvalue) {
    try {
        if (strvalue == null) {
            return "";
        } else {
            strvalue = new String(strvalue.getBytes("utf-8"), "utf-8").trim();
            return strvalue;
        }
    } catch (Exception e) {
        return "";
    }
}

//�����ַ��еĿ�ֵ
    public static final String nullToString(String v, String toV) {
        if (v == null || "".equals(v)) {
            v = toV;
        }
       
        return v;
    }
}
