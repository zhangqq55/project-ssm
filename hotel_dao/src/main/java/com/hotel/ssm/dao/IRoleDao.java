package com.hotel.ssm.dao;

import com.hotel.ssm.domain.Permission;
import com.hotel.ssm.domain.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IRoleDao {

    //根据用户id查询出所有对应的角色
    @Select("select * from haha where id in (select roleId from users_role where userId = #{userId})")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "roleName", column = "roleName"),
            @Result(property = "roleDesc", column = "roleDesc"),
            @Result(property = "permissions", column = "id", javaType = java.util.List.class,
                    many = @Many(select = "com.hotel.ssm.dao.IPermissionDao.findPermissionByRoleId")),
    })
    public List<Role> findRoleByUserId(String userId) throws Exception;

    @Select("select * from haha")
    List<Role> findAll();

    @Insert("insert into haha (roleName, roleDesc) values (#{roleName}, #{roleDesc})")
    void save(Role role);

    @Select("select * from haha where id = #{roleId}")
    Role findById(String roleId);

    @Select("select * from permission where id not in (select permissionId from role_permission where roleId = #{roleId})")
    List<Permission> findOtherPermissions(String roleId);

    @Insert("insert into role_permission(roleId, permissionId) values (#{roleId}, #{permissionId})")
    void addPermissionToRole(@Param("roleId") String roleId, @Param("permissionId") String permissionId);
}




















