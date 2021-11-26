package loop.login.model;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;

import loop.user.model.UsersBean;

public class UserAuthorityUtils {
	private static final List<GrantedAuthority> ADMIN_ROLES = AuthorityUtils
			.createAuthorityList("ROLE_ADMIN", "ROLE_USER");
	private static final List<GrantedAuthority> USER_ROLES = AuthorityUtils
			.createAuthorityList("ROLE_USER");

	public static Collection<? extends GrantedAuthority> createAuthorities(
			UsersBean bean) {
		String identity = bean.getUserIdentity();
		if (identity.equals(0)) {
			return ADMIN_ROLES;
		}
		return USER_ROLES;
	}
}
