package cn.parkingadmin.repository;

import cn.parkingadmin.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;

import java.util.List;

/**
 * Created by jewelknife on 11/14/14.
 */
public interface UserRepository extends Repository<User, Long> {

    @Query("select u.id, u.username, u.userCode from users u")
    List<User> findAll();

    Page<User> findAll(Pageable pageable);

    User findByUsername(String username);

//    @Query("select c from user c where c.username = :username and c.password = MD5(:password)")
//    User findByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

    User save(User user);

    User findOne(Long id);

}
