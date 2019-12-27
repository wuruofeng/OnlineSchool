package cn.miaozt.onlineschool.model;

import io.swagger.models.auth.In;

import java.io.Serializable;
import java.sql.Timestamp;

public class Create_at implements Serializable {
    Integer updated_at_day;
    String updated_at_year_month;

    public Create_at(String time){
        String months[]={"","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sept","Oct","Nov","Dec"};
        String timestr=time;
        Integer month=Integer.valueOf(timestr.substring(5,7));
        System.out.println(month.intValue());
        this.updated_at_year_month=months[month.intValue()]+", "+timestr.substring(0,4);
        this.updated_at_day=Integer.valueOf(timestr.substring(8,10));
    }

    public Integer getUpdated_at_day() {
        return updated_at_day;
    }

    public void setUpdated_at_day(Integer updated_at_day) {
        this.updated_at_day = updated_at_day;
    }

    public String getUpdated_at_year_month() {
        return updated_at_year_month;
    }

    public void setUpdated_at_year_month(String updated_at_year_month) {
        this.updated_at_year_month = updated_at_year_month;
    }

    @Override
    public String toString() {
        return "Create_at{" +
                "updated_at_day=" + updated_at_day +
                ", updated_at_year_month='" + updated_at_year_month + '\'' +
                '}';
    }
}
