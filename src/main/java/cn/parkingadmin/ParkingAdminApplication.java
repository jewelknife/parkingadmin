package cn.parkingadmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.annotation.Order;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import javax.sql.DataSource;

@EnableJpaRepositories
@EnableAutoConfiguration
@ComponentScan
@EnableWebMvcSecurity
public class ParkingAdminApplication extends WebMvcConfigurerAdapter {

    public static void main(String[] args) {
        SpringApplication.run(ParkingAdminApplication.class, args);
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/login").setViewName("login");
    }

    @Bean
    public ApplicationSecurity applicationSecurity() {
        return new ApplicationSecurity();
    }

    @Order(SecurityProperties.ACCESS_OVERRIDE_ORDER)
    protected static class ApplicationSecurity extends WebSecurityConfigurerAdapter {

        @Autowired
        private SecurityProperties security;

        @Autowired
        private DataSource dataSource;

        private PasswordEncoder passwordEncoder = new Md5PasswordEncoder();

        @Override
        protected void configure(HttpSecurity http) throws Exception {
            http.csrf().disable().authorizeRequests().antMatchers("/css/**", "/js/**").permitAll()
                    .antMatchers("/admin/area/**").hasRole("areaManager")
                    .antMatchers("/admin/user/**").hasRole("userManager")
                    .anyRequest().authenticated().and().formLogin().loginPage("/login").defaultSuccessUrl("/index")
                    .failureUrl("/login?error").permitAll().and().logout().logoutUrl("/logout").logoutSuccessUrl("/login").permitAll().and().rememberMe();
        }

        @Override
        public void configure(AuthenticationManagerBuilder auth) throws Exception {
//            auth.inMemoryAuthentication()
//                    .withUser("user").password("123").roles("USER").and()
//                    .withUser("admin").password("123").roles("USER", "ADMIN");
            auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(passwordEncoder).usersByUsernameQuery("select user_name, user_password, 'true' from users where user_name = ?")
            .authoritiesByUsernameQuery("select user_name, role_name from users a, user_role b, roles c where a.id = b.user_id and b.role_id = c.id and a.user_name = ?");
        }

    }

}
