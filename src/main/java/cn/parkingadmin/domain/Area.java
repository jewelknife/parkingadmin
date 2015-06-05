package cn.parkingadmin.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *  By jewelknife
 *
 */
@Entity(name="areas")
public class Area extends AbstractEntity {

    @Column(name="area_code")
    private String areaCode;
    @Column(name="area_name")
    private String areaName;
    @Column(name="area_parking_capacity")
    private int areaParkingCapacity;
    @Column(name="area_manager_id")
    private long areaManagerId;
    @Column(name="area_description")
    private String areaDescription;
    @ManyToOne
    @JoinColumn(name="area_manager_id", insertable = false, updatable = false)
    private User manager;

    public long getAreaManagerId() {
        return areaManagerId;
    }

    public void setAreaManagerId(long areaManagerId) {
        this.areaManagerId = areaManagerId;
    }

    public User getManager() {
        return manager;
    }

    public void setManager(User manager) {
        this.manager = manager;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public int getAreaParkingCapacity() {
        return areaParkingCapacity;
    }

    public void setAreaParkingCapacity(int areaParkingCapacity) {
        this.areaParkingCapacity = areaParkingCapacity;
    }

    public String getAreaDescription() {
        return areaDescription;
    }

    public void setAreaDescription(String areaDescription) {
        this.areaDescription = areaDescription;
    }
}
