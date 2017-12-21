package oracle;

import java.util.Arrays;

public class CreatePartition {

    static String[] arr = new String[] {"20160401","20160403","20160404","20160510","20160511","20160704","20160705","20160807","20160809","20160905","20160906","20161010","20161011","20161106","20161107","20161229","20161230","20161231","20170101","20171231"};
    static String[] arr1 = new String[] {"07","09","17","19","24"};
    static String[] arr2 = new String[] {"0700","0900","1700","1900","2400"};

    public static void main(String[] args) {
        createPartitionNew();
    }

    public static void createPartitionNew() {
        StringBuilder sql = new StringBuilder();
        sql.append("CREATE TABLE INDICATOR_REAL (\n");
        sql.append("\tNORM VARCHAR2(32),\n");
        sql.append("\t\"SCOPE\" VARCHAR2(128),\n");
        sql.append("\t\"RANGE\" VARCHAR2(16),\n");
        sql.append("\tTIMEFEATURE VARCHAR2(16),\n");
        sql.append("\tVALUE NUMBER(32,16),\n");
        sql.append("\tVERSION NUMBER(3,0),\n");
        sql.append("\tVALID NUMBER(1,0),\n");
        sql.append("\tDATNUM NUMBER(8),\n");
        sql.append("\tDAT VARCHAR2(32),\n");
        sql.append("\tUPDATETIME VARCHAR2(32),\n");
        sql.append("\tVERSIONINFO VARCHAR2(100),\n");
        sql.append("\tSCOPETYPE VARCHAR2(32),\n");
        sql.append("\tNAME VARCHAR2(256)\n");
        sql.append(") ");
        sql.append("partition by range(DATNUM)\n");
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
    
    public static void createPartition() {
        StringBuilder sql = new StringBuilder();
        sql.append("CREATE TABLE INDICATOR_REAL (\n");
        sql.append("\tNORM VARCHAR2(32),\n");
        sql.append("\t\"SCOPE\" VARCHAR2(128),\n");
        sql.append("\t\"RANGE\" VARCHAR2(16),\n");
        sql.append("\tTIMEFEATURE VARCHAR2(16),\n");
        sql.append("\tVALUE NUMBER(32,16),\n");
        sql.append("\tVERSION NUMBER(3,0),\n");
        sql.append("\tVALID NUMBER(1,0),\n");
        sql.append("\tDAT NUMBER(12),\n");
        sql.append("\tUPDATETIME VARCHAR2(32),\n");
        sql.append("\tVERSIONINFO VARCHAR2(100),\n");
        sql.append("\tSCOPETYPE VARCHAR2(32),\n");
        sql.append("\tNAME VARCHAR2(256)\n");
        sql.append(") ");
        sql.append("partition by range(DAT)\n");
        sql.append("(");
    
        Arrays.stream(arr)
                .map(n -> "partition part_"+n+" values less than("+n+"),\n")
                .forEach(p -> sql.append(p));
                //.forEach(System.out::println);
    
        Arrays.stream(arr)
                .forEach(d -> {
                    Arrays.stream(arr1)
                            .map(n -> "partition part_"+d+n+" values less than("+d+n+"),\n")
                            .forEach(p -> sql.append(p));
                });
    
        Arrays.stream(arr)
                .forEach(d -> {
                    Arrays.stream(arr2)
                            .map(n -> "partition part_"+d+n+" values less than("+d+n+"),\n")
                            .forEach(p -> sql.append(p));
                });
    
        sql.append("  partition part_maxvalue values less than(maxvalue)\n");
        sql.append(");\n");
        
        sql.append("CREATE INDEX IND_REAL_INDEX1 ON INDICATOR_REAL(DAT) LOCAL;\n");
        sql.append("CREATE INDEX IND_REAL_INDEX2 ON INDICATOR_REAL(NAME) LOCAL;\n");
        System.out.println(sql.toString());
    }

    public static void dropPartition() {
        StringBuilder sql = new StringBuilder();
        Arrays.stream(arr)
                .forEach(d -> {
                    Arrays.stream(arr1)
                            .forEach(p -> sql.append("ALTER TABLE INDICATOR_REAL DROP PARTITION part_"+d+p+";\n"));
                });
        Arrays.stream(arr)
                .forEach(d -> {
                    sql.append("ALTER TABLE INDICATOR_REAL DROP PARTITION part_"+d+";\n");
                    Arrays.stream(arr2)
                            .forEach(p -> sql.append("ALTER TABLE INDICATOR_REAL DROP PARTITION part_"+d+p+";\n"));
                });
        //sql.append("ALTER TABLE INDICATOR_REAL DROP PARTITION part_maxvalue;\n");
        System.out.println(sql.toString());
    }
    
}


