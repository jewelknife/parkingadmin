package cn.parkingadmin.service;

import cn.parkingadmin.domain.Role;
import cn.parkingadmin.domain.User;
import cn.parkingadmin.repository.AreaRepository;
import cn.parkingadmin.repository.FeesRepository;
import cn.parkingadmin.repository.RoleRepository;
import cn.parkingadmin.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by jewelknife on 2015/1/20.
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private AreaRepository areaRepository;
    @Autowired
    private FeesRepository feesRepository;
    @Autowired
    private RoleRepository roleRepository;

    public void setAreaRepository(AreaRepository areaRepository) {
        this.areaRepository = areaRepository;
    }

    public void setFeesRepository(FeesRepository feesRepository) {
        this.feesRepository = feesRepository;
    }

    public void setUserRepository(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public Page<User> findAll(Pageable pageable) {
        return userRepository.findAll(pageable);
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public List<Role> findAllRole() {
        return roleRepository.findAll();
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

//    @Override
//    public User findByUsernameAndPassword(String username, String password) {
//        return userRepository.findByUsernameAndPassword(username, password);
//    }

    @Override
    public User save(User user) {
        return userRepository.save(user);
    }

    @Override
    public int changePasswod(long id, String oripasswd, String newpasswd, String repasswd) {
        return 0;
    }

    @Override
    public User findOne(Long id) {
        return userRepository.findOne(id);
    }

    @Override
    public void delete(Long id) {
        userRepository.delete(id);
    }

    @Override
    @Transactional
    public void delete(long[] idlist) {
        for(Long id : idlist) {
            userRepository.delete(id);
        }
    }

    @Override
    public boolean isUserInUse(User user) {
        if (feesRepository.findByUserCode(user.getUserCode(), new PageRequest(0, 1)).getContent().size() > 0) {
            return true;
        }
        if (areaRepository.findByAreaManagerId(user.getId(), new PageRequest(0, 1)).getContent().size() > 0) {
            return true;
        }
        return false;
    }
}
