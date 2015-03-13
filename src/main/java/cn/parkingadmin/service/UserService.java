package cn.parkingadmin.service;

import cn.parkingadmin.domain.Role;
import cn.parkingadmin.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Created by jewelknife on 2015/1/20.
 */
public interface UserService {

    Page<User> findAll(Pageable pageable);

    List<User> findAll();

    List<Role> findAllRole();

    User findByUsername(String username);

//    User findByUsernameAndPassword(String username, String password);

    User save(User user);

    int changePasswod(long id, String oripasswd, String newpasswd, String repasswd);

    User findOne(Long id);

    void delete(Long id);

    void delete(long[] idlist);

    boolean isUserInUse(User user);

}
