/*
 *  @(#)RoleRepository.java    5.0 3/11/15
 *  Copyright © 2015 Vobile, Inc. All rights reserved.
 */
package cn.parkingadmin.repository;

import cn.parkingadmin.domain.Role;
import org.springframework.data.repository.Repository;

import java.util.List;

/**
 * @author <A HREF="mailto:chen_yingbo@vobile.cn">Yingbo Chen</A>
 * @version 5.0 3/11/15
 * @since 5.0
 */
public interface RoleRepository extends Repository<Role, Integer> {
    List<Role> findAll();
}
