package cn.parkingadmin.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import java.util.Date;

/**
 * Created by jewelknife on 2015/1/29.
 */
@Entity(name="fees")
public class Fees extends AbstractEntity {

    @Column(name="area_id")
    private int areaId;
    @Column(name="user_code")
    private String userCode;
    @Column(name="fee_num")
    private double feeNum;
    @Column(name="fee_date")
    private Date feeDate;
//    @ManyToOne(map)
//    private Area area;

    public int getAreaId() {
        return areaId;
    }

    public void setAreaId(int areaId) {
        this.areaId = areaId;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public double getFeeNum() {
        return feeNum;
    }

    public void setFeeNum(double feeNum) {
        this.feeNum = feeNum;
    }

    public Date getFeeDate() {
        return feeDate;
    }

    public void setFeeDate(Date feeDate) {
        this.feeDate = feeDate;
    }
}
