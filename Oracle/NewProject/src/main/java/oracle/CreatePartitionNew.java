package oracle;

import java.util.Arrays;

public class CreatePartitionNew {

    static String[] arr = new String[] {"20160403","20160404","20160510","20160511","20160704","20160705","20160807","20160809","20160905","20160906","20161010","20161011","20161106","20161107","20161229","20161230","20161231","20170101","20171231"};
    static String[] arr1 = new String[] {"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27"};

    public static void main(String[] args) {
        createPartitionNew();
//        dropPartition();
    }

    public static void createPartitionNew() {
        StringBuilder sql = new StringBuilder();
        sql.append("CREATE TABLE PASS_INDICATOR (\n");
        sql.append("\tNORM  VARCHAR2(32),\n");
        sql.append("\tNAME  VARCHAR2(128),\n");
        sql.append("\tVALUE NUMBER(24,6),\n");
        sql.append("\tDAT   NUMBER(8) NOT NULL,\n");
        sql.append("\tHOU   NUMBER(2) NOT NULL,\n");
        sql.append("\tDHM   NUMBER(12) NOT NULL,\n");
        sql.append("\tSCOPETYPE VARCHAR2(32)\n");
        sql.append(") ");
        sql.append("partition by range(DAT, HOU)\n");
        sql.append("(");
    
        Arrays.stream(arr)
                .forEach(d -> {
                    Arrays.stream(arr1)
                            .map(n -> "partition ind_part_"+d+"_"+n+" values less than("+d+","+n+"),\n")
                            .forEach(p -> sql.append(p));
                });

        sql.append("  partition ind_part_maxvalue values less than(maxvalue, maxvalue)\n");
        sql.append(");\n");

        // sql.append("CREATE INDEX IND_REAL_INDEX1 ON PASS_INDICATOR(DAT, HOU) LOCAL;\n");
        System.out.println(sql.toString());
    }

    public static void dropPartition() {
        StringBuilder sql = new StringBuilder();
    
        Arrays.stream(arr)
                .forEach(d -> {
                    Arrays.stream(arr1)
                            .map(n -> "ALTER TABLE PASS_INDICATOR DROP PARTITION ind_part_"+d+"_"+n+";\n")
                            .forEach(p -> sql.append(p));
                });
        
        // sql.append("ALTER TABLE INDICATOR_REAL DROP PARTITION ind_part__maxvalue;\n");
        System.out.println(sql.toString());
    }
    
}


