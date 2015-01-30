/*
 *  @(#)Area.java    1.3 1/30/15
 *  Copyright © 2014 Vobile, Inc. All rights reserved.
 */
package cn.parkingadmin.domain;

import javax.persistence.Column;
import javax.persistence.Entity;

/**
 * @author <A HREF="mailto:chen_yingbo@vobile.cn">Yingbo Chen</A>
 * @version 1.3 1/30/15
 * @since 1.3
 */
@Entity(name="areas")
public class Area extends AbstractEntity {

    @Column(name="area_code")
    private String areaCode;
    @Column(name="area_name")
    private String areaName;
    @Column(name="area_parking_capacity")
    private int areaParkingCapacity;
    @Column(name="area_description")
    private String areaDescription;

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