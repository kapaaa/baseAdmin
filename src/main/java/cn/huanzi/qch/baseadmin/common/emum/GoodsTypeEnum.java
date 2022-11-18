package cn.huanzi.qch.baseadmin.common.emum;

public enum GoodsTypeEnum {
    // 定义一个枚举类型
    DRINKS(1, "饮料"),
    FOOD(2, "食品"),
    ARECA(3, "槟榔"),
    CIGARETTE(4, "香烟"),
    OTHER(5, "其他");

    //成员变量
    private Integer key;
    private String value;

    public static String getValue(Integer key) {
        for (GoodsTypeEnum e : values()) {
            if (e.getKey()==key)return e.getValue();
        }
        return "";
    }

    //构造方法
    GoodsTypeEnum(Integer key, String value) {
        this.key = key;
        this.value = value;
    }

    public Integer getKey() {
        return key;
    }

    public void setKey(Integer key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
