package oracle;

import java.util.Arrays;

public class CreateLineLink {

    static String[] arr = new String[] {"20160401","20160403","20160404","20160510","20160511","20160704","20160705","20160807","20160809","20160905","20160906","20161010","20161011","20161106","20161107","20161229","20161230","20161231","20170101","20171231"};

    public static void main(String[] args) {
        createLine();
//        dropLine();
    }

    public static void createLine() {
        StringBuilder sql = new StringBuilder();
        sql.append("CREATE TABLE PASS_LINE_LINK (\n");
        sql.append("\tDAT NUMBER(8),\n");           // 必填 日
        sql.append("\tHOURS NUMBER(2),\n");          // 必填 小时 0全天、-1早高峰、-2晚高峰
        sql.append("\tLINKID VARCHAR2(32),\n");     // 路链ID
        sql.append("\tVALUE NUMBER(16),\n");        // 值
        sql.append("\tCOLOR NUMBER(1)\n");
        sql.append(") ");
        sql.append("partition by range(DAT)\n");
        sql.append("(");

        Arrays.stream(arr)
                .map(n -> "partition ind_part_"+n+" values less than("+n+"),\n")
                .forEach(p -> sql.append(p));

        sql.append("  partition ind_part_maxvalue values less than(maxvalue)\n");
        sql.append(");\n");

//        sql.append("CREATE INDEX IND_REAL_INDEX1 ON INDICATOR_REAL(DAT) LOCAL;\n");
//        sql.append("CREATE INDEX IND_REAL_INDEX2 ON INDICATOR_REAL(NAME) LOCAL;\n");
        System.out.println(sql.toString());
    }


    public static void dropLine() {
        StringBuilder sql = new StringBuilder();
        Arrays.stream(arr)
                .forEach(d -> sql.append("ALTER TABLE PASS_LINE_LINK DROP PARTITION ind_part_"+d+";\n"));
        //sql.append("ALTER TABLE INDICATOR_REAL DROP PARTITION part_maxvalue;\n");
        System.out.println(sql.toString());
    }

}
