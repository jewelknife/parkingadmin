package cn.parkingadmin.repository;

import cn.parkingadmin.domain.Role;
import org.springframework.data.repository.Repository;

import java.util.List;

public interface RoleRepository extends Repository<Role, Integer> {
    List<Role> findAll();
}
