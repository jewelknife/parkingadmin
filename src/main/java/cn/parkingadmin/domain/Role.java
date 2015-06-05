package cn.parkingadmin.domain;

import javax.persistence.Column;
import javax.persistence.Entity;

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
