package com.ruoyi.framework.config;

import com.ruoyi.framework.api.service.MemberDetailsServiceImpl;
import com.ruoyi.framework.web.service.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.ArrayList;
import java.util.List;

@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsServiceImpl us1;

    @Autowired
    private MemberDetailsServiceImpl us2;

    @Override
    @Bean
    protected AuthenticationManager authenticationManager() throws Exception {
        DaoAuthenticationProvider dao1 = new DaoAuthenticationProvider();
        dao1.setPasswordEncoder(bCryptPasswordEncoder());
        dao1.setUserDetailsService(us1);

        DaoAuthenticationProvider dao2 = new DaoAuthenticationProvider();
        dao2.setPasswordEncoder(bCryptPasswordEncoder());
        dao2.setUserDetailsService(us2);

        List<AuthenticationProvider> providers = new ArrayList<>();
        providers.add(dao1);
        providers.add(dao2);

        ProviderManager manager = new ProviderManager(providers, null);

        return manager;
    }

    /**
     * 强散列哈希加密实现
     */
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder()
    {
        return new BCryptPasswordEncoder();
    }

}
