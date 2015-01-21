package cn.parkingadmin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
//@ComponentScan(basePackages = "web.function", useDefaultFilters = false, includeFilters = {
//        @ComponentScan.Filter(type = FilterType.ANNOTATION, value = {Controller.class})
//})
public class ParkingAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(ParkingAdminApplication.class, args);
    }
}
