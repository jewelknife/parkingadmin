/*
 *  @(#)MethodSecurityConfig.java    1.3 1/31/15
 *  Copyright © 2014 Vobile, Inc. All rights reserved.
 */
package cn.parkingadmin;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;

/**
 * @author <A HREF="mailto:chen_yingbo@vobile.cn">Yingbo Chen</A>
 * @version 1.3 1/31/15
 * @since 1.3
 */
@Configuration
@EnableGlobalMethodSecurity(securedEnabled = true)
public class MethodSecurityConfig {
}
