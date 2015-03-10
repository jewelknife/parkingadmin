/*
 *  @(#)Role.java    5.0 3/10/15
 *  Copyright © 2015 Vobile, Inc. All rights reserved.
 */
package cn.parkingadmin.domain;

import javax.persistence.Column;
import javax.persistence.Entity;

/**
 * @author <A HREF="mailto:chen_yingbo@vobile.cn">Yingbo Chen</A>
 * @version 5.0 3/10/15
 * @since 5.0
 */
@Entity(name = "roles")
public class Role extends AbstractEntity {

    @Column(name="role_name")
    private String roleName;

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
