/*
 Navicat Premium Data Transfer

 Source Server         : tencent
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 119.45.50.7:3306
 Source Schema         : ApolloPortalDB

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 01/09/2020 09:20:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for App
-- ----------------------------
DROP TABLE IF EXISTS `App`;
CREATE TABLE `App`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Name`(`Name`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of App
-- ----------------------------
INSERT INTO `App` VALUES (1, '20200803', 'cloud-test', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'1', 'apollo', '2020-08-03 09:44:40', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `App` VALUES (2, '20200803', 'cloud', 'TEST2', '样例部门2', 'apollo', 'apollo@acme.com', b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `App` VALUES (3, '12313123', 'zz-ddd', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'1', 'apollo', '2020-08-06 02:39:08', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `App` VALUES (4, '12312312312', 'aaa-aaa', 'TEST2', '样例部门2', 'apollo', 'apollo@acme.com', b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `App` VALUES (5, '20200806', 'cloud-test', 'TEST2', '样例部门2', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');

-- ----------------------------
-- Table structure for AppNamespace
-- ----------------------------
DROP TABLE IF EXISTS `AppNamespace`;
CREATE TABLE `AppNamespace`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'namespace名字，注意，需要全局唯一',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'app id',
  `Format` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'properties' COMMENT 'namespace的format类型',
  `IsPublic` bit(1) NOT NULL DEFAULT b'0' COMMENT 'namespace是否为公共',
  `Comment` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AppId`(`AppId`) USING BTREE,
  INDEX `Name_AppId`(`Name`, `AppId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用namespace定义' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of AppNamespace
-- ----------------------------
INSERT INTO `AppNamespace` VALUES (1, 'application', '20200803', 'properties', b'0', 'default app namespace', b'1', 'apollo', '2020-08-03 09:44:40', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `AppNamespace` VALUES (2, 'application', '20200803', 'properties', b'0', 'default app namespace', b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `AppNamespace` VALUES (3, 'application', '12313123', 'properties', b'0', 'default app namespace', b'1', 'apollo', '2020-08-06 02:39:08', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `AppNamespace` VALUES (4, 'TEST1.zty', '12313123', 'properties', b'1', '', b'1', 'apollo', '2020-08-06 02:49:33', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `AppNamespace` VALUES (5, 'application', '12312312312', 'properties', b'0', 'default app namespace', b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `AppNamespace` VALUES (6, 'application', '20200806', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');

-- ----------------------------
-- Table structure for Authorities
-- ----------------------------
DROP TABLE IF EXISTS `Authorities`;
CREATE TABLE `Authorities`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Authority` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Authorities
-- ----------------------------
INSERT INTO `Authorities` VALUES (2, 'apollo', 'ROLE_user');

-- ----------------------------
-- Table structure for Consumer
-- ----------------------------
DROP TABLE IF EXISTS `Consumer`;
CREATE TABLE `Consumer`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '开放API消费者' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Consumer
-- ----------------------------

-- ----------------------------
-- Table structure for ConsumerAudit
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerAudit`;
CREATE TABLE `ConsumerAudit`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'Consumer Id',
  `Uri` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '访问的Uri',
  `Method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '访问的Method',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_ConsumerId`(`ConsumerId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'consumer审计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ConsumerAudit
-- ----------------------------

-- ----------------------------
-- Table structure for ConsumerRole
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerRole`;
CREATE TABLE `ConsumerRole`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'Consumer Id',
  `RoleId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_ConsumerId_RoleId`(`ConsumerId`, `RoleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'consumer和role的绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ConsumerRole
-- ----------------------------

-- ----------------------------
-- Table structure for ConsumerToken
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerToken`;
CREATE TABLE `ConsumerToken`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'ConsumerId',
  `Token` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'token',
  `Expires` datetime(0) NOT NULL DEFAULT '2099-01-01 00:00:00' COMMENT 'token失效时间',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_Token`(`Token`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'consumer token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ConsumerToken
-- ----------------------------

-- ----------------------------
-- Table structure for Favorite
-- ----------------------------
DROP TABLE IF EXISTS `Favorite`;
CREATE TABLE `Favorite`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '收藏的用户',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Position` int(32) NOT NULL DEFAULT 10000 COMMENT '收藏顺序',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `IX_UserId`(`UserId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Favorite
-- ----------------------------

-- ----------------------------
-- Table structure for Permission
-- ----------------------------
DROP TABLE IF EXISTS `Permission`;
CREATE TABLE `Permission`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `PermissionType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限类型',
  `TargetId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限对象类型',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_TargetId_PermissionType`(`TargetId`(191), `PermissionType`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'permission表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Permission
-- ----------------------------
INSERT INTO `Permission` VALUES (1, 'CreateApplication', 'SystemRole', b'0', 'apollo', '2020-08-03 08:34:46', 'apollo', '2020-08-03 08:34:46');
INSERT INTO `Permission` VALUES (2, 'AssignRole', '20200803', b'1', 'apollo', '2020-08-03 09:44:40', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `Permission` VALUES (3, 'CreateCluster', '20200803', b'1', 'apollo', '2020-08-03 09:44:40', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `Permission` VALUES (4, 'CreateNamespace', '20200803', b'1', 'apollo', '2020-08-03 09:44:40', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `Permission` VALUES (5, 'ManageAppMaster', '20200803', b'1', 'apollo', '2020-08-03 09:44:40', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `Permission` VALUES (6, 'ModifyNamespace', '20200803+application', b'1', 'apollo', '2020-08-03 09:44:41', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `Permission` VALUES (7, 'ReleaseNamespace', '20200803+application', b'1', 'apollo', '2020-08-03 09:44:41', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `Permission` VALUES (8, 'ModifyNamespace', '20200803+application+DEV', b'1', 'apollo', '2020-08-03 09:44:41', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `Permission` VALUES (9, 'ReleaseNamespace', '20200803+application+DEV', b'1', 'apollo', '2020-08-03 09:44:41', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `Permission` VALUES (10, 'AssignRole', '20200803', b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `Permission` VALUES (11, 'CreateCluster', '20200803', b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `Permission` VALUES (12, 'CreateNamespace', '20200803', b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `Permission` VALUES (13, 'ManageAppMaster', '20200803', b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `Permission` VALUES (14, 'ModifyNamespace', '20200803+application', b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `Permission` VALUES (15, 'ReleaseNamespace', '20200803+application', b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `Permission` VALUES (16, 'ModifyNamespace', '20200803+application+DEV', b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `Permission` VALUES (17, 'ReleaseNamespace', '20200803+application+DEV', b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `Permission` VALUES (18, 'AssignRole', '12313123', b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Permission` VALUES (19, 'CreateCluster', '12313123', b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Permission` VALUES (20, 'CreateNamespace', '12313123', b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Permission` VALUES (21, 'ManageAppMaster', '12313123', b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Permission` VALUES (22, 'ModifyNamespace', '12313123+application', b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Permission` VALUES (23, 'ReleaseNamespace', '12313123+application', b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Permission` VALUES (24, 'ModifyNamespace', '12313123+application+DEV', b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Permission` VALUES (25, 'ReleaseNamespace', '12313123+application+DEV', b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Permission` VALUES (26, 'ModifyNamespace', '12313123+TEST1.zty', b'1', 'apollo', '2020-08-06 02:49:33', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Permission` VALUES (27, 'ReleaseNamespace', '12313123+TEST1.zty', b'1', 'apollo', '2020-08-06 02:49:33', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Permission` VALUES (28, 'ModifyNamespace', '12313123+TEST1.zty+DEV', b'1', 'apollo', '2020-08-06 02:49:33', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Permission` VALUES (29, 'ReleaseNamespace', '12313123+TEST1.zty+DEV', b'1', 'apollo', '2020-08-06 02:49:33', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Permission` VALUES (30, 'CreateCluster', '12312312312', b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `Permission` VALUES (31, 'CreateNamespace', '12312312312', b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `Permission` VALUES (32, 'AssignRole', '12312312312', b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `Permission` VALUES (33, 'ManageAppMaster', '12312312312', b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `Permission` VALUES (34, 'ModifyNamespace', '12312312312+application', b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `Permission` VALUES (35, 'ReleaseNamespace', '12312312312+application', b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `Permission` VALUES (36, 'ModifyNamespace', '12312312312+application+DEV', b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `Permission` VALUES (37, 'ReleaseNamespace', '12312312312+application+DEV', b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `Permission` VALUES (38, 'CreateCluster', '20200806', b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');
INSERT INTO `Permission` VALUES (39, 'CreateNamespace', '20200806', b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');
INSERT INTO `Permission` VALUES (40, 'AssignRole', '20200806', b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');
INSERT INTO `Permission` VALUES (41, 'ManageAppMaster', '20200806', b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');
INSERT INTO `Permission` VALUES (42, 'ModifyNamespace', '20200806+application', b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');
INSERT INTO `Permission` VALUES (43, 'ReleaseNamespace', '20200806+application', b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');
INSERT INTO `Permission` VALUES (44, 'ModifyNamespace', '20200806+application+DEV', b'0', 'apollo', '2020-08-06 02:56:07', 'apollo', '2020-08-06 02:56:07');
INSERT INTO `Permission` VALUES (45, 'ReleaseNamespace', '20200806+application+DEV', b'0', 'apollo', '2020-08-06 02:56:07', 'apollo', '2020-08-06 02:56:07');

-- ----------------------------
-- Table structure for Role
-- ----------------------------
DROP TABLE IF EXISTS `Role`;
CREATE TABLE `Role`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Role name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_RoleName`(`RoleName`(191)) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Role
-- ----------------------------
INSERT INTO `Role` VALUES (1, 'CreateApplication+SystemRole', b'0', 'apollo', '2020-08-03 08:34:47', 'apollo', '2020-08-03 08:34:47');
INSERT INTO `Role` VALUES (2, 'Master+20200803', b'1', 'apollo', '2020-08-03 09:44:40', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `Role` VALUES (3, 'ManageAppMaster+20200803', b'1', 'apollo', '2020-08-03 09:44:40', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `Role` VALUES (4, 'ModifyNamespace+20200803+application', b'1', 'apollo', '2020-08-03 09:44:41', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `Role` VALUES (5, 'ReleaseNamespace+20200803+application', b'1', 'apollo', '2020-08-03 09:44:41', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `Role` VALUES (6, 'ModifyNamespace+20200803+application+DEV', b'1', 'apollo', '2020-08-03 09:44:41', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `Role` VALUES (7, 'ReleaseNamespace+20200803+application+DEV', b'1', 'apollo', '2020-08-03 09:44:41', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `Role` VALUES (8, 'Master+20200803', b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `Role` VALUES (9, 'ManageAppMaster+20200803', b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `Role` VALUES (10, 'ModifyNamespace+20200803+application', b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `Role` VALUES (11, 'ReleaseNamespace+20200803+application', b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `Role` VALUES (12, 'ModifyNamespace+20200803+application+DEV', b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `Role` VALUES (13, 'ReleaseNamespace+20200803+application+DEV', b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `Role` VALUES (14, 'Master+12313123', b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Role` VALUES (15, 'ManageAppMaster+12313123', b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Role` VALUES (16, 'ModifyNamespace+12313123+application', b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Role` VALUES (17, 'ReleaseNamespace+12313123+application', b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Role` VALUES (18, 'ModifyNamespace+12313123+application+DEV', b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Role` VALUES (19, 'ReleaseNamespace+12313123+application+DEV', b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Role` VALUES (20, 'ModifyNamespace+12313123+TEST1.zty', b'1', 'apollo', '2020-08-06 02:49:33', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Role` VALUES (21, 'ReleaseNamespace+12313123+TEST1.zty', b'1', 'apollo', '2020-08-06 02:49:33', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Role` VALUES (22, 'ModifyNamespace+12313123+TEST1.zty+DEV', b'1', 'apollo', '2020-08-06 02:49:33', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Role` VALUES (23, 'ReleaseNamespace+12313123+TEST1.zty+DEV', b'1', 'apollo', '2020-08-06 02:49:33', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `Role` VALUES (24, 'Master+12312312312', b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `Role` VALUES (25, 'ManageAppMaster+12312312312', b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `Role` VALUES (26, 'ModifyNamespace+12312312312+application', b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `Role` VALUES (27, 'ReleaseNamespace+12312312312+application', b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `Role` VALUES (28, 'ModifyNamespace+12312312312+application+DEV', b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `Role` VALUES (29, 'ReleaseNamespace+12312312312+application+DEV', b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `Role` VALUES (30, 'Master+20200806', b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');
INSERT INTO `Role` VALUES (31, 'ManageAppMaster+20200806', b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');
INSERT INTO `Role` VALUES (32, 'ModifyNamespace+20200806+application', b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');
INSERT INTO `Role` VALUES (33, 'ReleaseNamespace+20200806+application', b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');
INSERT INTO `Role` VALUES (34, 'ModifyNamespace+20200806+application+DEV', b'0', 'apollo', '2020-08-06 02:56:07', 'apollo', '2020-08-06 02:56:07');
INSERT INTO `Role` VALUES (35, 'ReleaseNamespace+20200806+application+DEV', b'0', 'apollo', '2020-08-06 02:56:07', 'apollo', '2020-08-06 02:56:07');

-- ----------------------------
-- Table structure for RolePermission
-- ----------------------------
DROP TABLE IF EXISTS `RolePermission`;
CREATE TABLE `RolePermission`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'Role Id',
  `PermissionId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'Permission Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_PermissionId`(`PermissionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和权限的绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of RolePermission
-- ----------------------------
INSERT INTO `RolePermission` VALUES (1, 1, 1, b'0', 'apollo', '2020-08-03 08:34:47', 'apollo', '2020-08-03 08:34:47');
INSERT INTO `RolePermission` VALUES (2, 2, 2, b'1', 'apollo', '2020-08-03 09:44:40', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `RolePermission` VALUES (3, 2, 3, b'1', 'apollo', '2020-08-03 09:44:40', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `RolePermission` VALUES (4, 2, 4, b'1', 'apollo', '2020-08-03 09:44:40', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `RolePermission` VALUES (5, 3, 5, b'1', 'apollo', '2020-08-03 09:44:40', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `RolePermission` VALUES (6, 4, 6, b'1', 'apollo', '2020-08-03 09:44:41', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `RolePermission` VALUES (7, 5, 7, b'1', 'apollo', '2020-08-03 09:44:41', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `RolePermission` VALUES (8, 6, 8, b'1', 'apollo', '2020-08-03 09:44:41', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `RolePermission` VALUES (9, 7, 9, b'1', 'apollo', '2020-08-03 09:44:41', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `RolePermission` VALUES (10, 8, 10, b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `RolePermission` VALUES (11, 8, 11, b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `RolePermission` VALUES (12, 8, 12, b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `RolePermission` VALUES (13, 9, 13, b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `RolePermission` VALUES (14, 10, 14, b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `RolePermission` VALUES (15, 11, 15, b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `RolePermission` VALUES (16, 12, 16, b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `RolePermission` VALUES (17, 13, 17, b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `RolePermission` VALUES (18, 14, 18, b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `RolePermission` VALUES (19, 14, 19, b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `RolePermission` VALUES (20, 14, 20, b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `RolePermission` VALUES (21, 15, 21, b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `RolePermission` VALUES (22, 16, 22, b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `RolePermission` VALUES (23, 17, 23, b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `RolePermission` VALUES (24, 18, 24, b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `RolePermission` VALUES (25, 19, 25, b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `RolePermission` VALUES (26, 20, 26, b'1', 'apollo', '2020-08-06 02:49:33', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `RolePermission` VALUES (27, 21, 27, b'1', 'apollo', '2020-08-06 02:49:33', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `RolePermission` VALUES (28, 22, 28, b'1', 'apollo', '2020-08-06 02:49:33', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `RolePermission` VALUES (29, 23, 29, b'1', 'apollo', '2020-08-06 02:49:33', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `RolePermission` VALUES (30, 24, 32, b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `RolePermission` VALUES (31, 24, 30, b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `RolePermission` VALUES (32, 24, 31, b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `RolePermission` VALUES (33, 25, 33, b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `RolePermission` VALUES (34, 26, 34, b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `RolePermission` VALUES (35, 27, 35, b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `RolePermission` VALUES (36, 28, 36, b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `RolePermission` VALUES (37, 29, 37, b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `RolePermission` VALUES (38, 30, 38, b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');
INSERT INTO `RolePermission` VALUES (39, 30, 39, b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');
INSERT INTO `RolePermission` VALUES (40, 30, 40, b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');
INSERT INTO `RolePermission` VALUES (41, 31, 41, b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');
INSERT INTO `RolePermission` VALUES (42, 32, 42, b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');
INSERT INTO `RolePermission` VALUES (43, 33, 43, b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');
INSERT INTO `RolePermission` VALUES (44, 34, 44, b'0', 'apollo', '2020-08-06 02:56:07', 'apollo', '2020-08-06 02:56:07');
INSERT INTO `RolePermission` VALUES (45, 35, 45, b'0', 'apollo', '2020-08-06 02:56:07', 'apollo', '2020-08-06 02:56:07');

-- ----------------------------
-- Table structure for ServerConfig
-- ----------------------------
DROP TABLE IF EXISTS `ServerConfig`;
CREATE TABLE `ServerConfig`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项值',
  `Comment` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_Key`(`Key`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置服务自身配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ServerConfig
-- ----------------------------
INSERT INTO `ServerConfig` VALUES (1, 'apollo.portal.envs', 'dev', '可支持的环境列表', b'0', 'default', '2020-08-03 08:15:31', '', '2020-08-03 08:15:31');
INSERT INTO `ServerConfig` VALUES (2, 'organizations', '[{\"orgId\":\"TEST1\",\"orgName\":\"样例部门1\"},{\"orgId\":\"TEST2\",\"orgName\":\"样例部门2\"}]', '部门列表', b'0', 'default', '2020-08-03 08:15:31', '', '2020-08-03 08:15:31');
INSERT INTO `ServerConfig` VALUES (3, 'superAdmin', 'apollo', 'Portal超级管理员', b'0', 'default', '2020-08-03 08:15:31', '', '2020-08-03 08:15:31');
INSERT INTO `ServerConfig` VALUES (4, 'api.readTimeout', '10000', 'http接口read timeout', b'0', 'default', '2020-08-03 08:15:31', '', '2020-08-03 08:15:31');
INSERT INTO `ServerConfig` VALUES (5, 'consumer.token.salt', 'someSalt', 'consumer token salt', b'0', 'default', '2020-08-03 08:15:31', '', '2020-08-03 08:15:31');
INSERT INTO `ServerConfig` VALUES (6, 'admin.createPrivateNamespace.switch', 'true', '是否允许项目管理员创建私有namespace', b'0', 'default', '2020-08-03 08:15:31', '', '2020-08-03 08:15:31');
INSERT INTO `ServerConfig` VALUES (7, 'configView.memberOnly.envs', 'pro', '只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔', b'0', 'default', '2020-08-03 08:15:31', '', '2020-08-03 08:15:31');
INSERT INTO `ServerConfig` VALUES (8, 'apollo.portal.meta.servers', '{http://119.45.50.7:8099}', '各环境Meta Service列表', b'0', 'default', '2020-08-03 08:15:31', '', '2020-08-31 14:36:24');

-- ----------------------------
-- Table structure for UserRole
-- ----------------------------
DROP TABLE IF EXISTS `UserRole`;
CREATE TABLE `UserRole`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `UserId` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户身份标识',
  `RoleId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_UserId_RoleId`(`UserId`, `RoleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和role的绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of UserRole
-- ----------------------------
INSERT INTO `UserRole` VALUES (1, 'apollo', 2, b'1', 'apollo', '2020-08-03 09:44:41', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `UserRole` VALUES (2, 'apollo', 4, b'1', 'apollo', '2020-08-03 09:44:41', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `UserRole` VALUES (3, 'apollo', 5, b'1', 'apollo', '2020-08-03 09:44:41', 'apollo', '2020-08-03 09:48:38');
INSERT INTO `UserRole` VALUES (4, 'apollo', 8, b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `UserRole` VALUES (5, 'apollo', 10, b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `UserRole` VALUES (6, 'apollo', 11, b'1', 'apollo', '2020-08-03 09:49:09', 'apollo', '2020-08-06 15:38:40');
INSERT INTO `UserRole` VALUES (7, 'apollo', 14, b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `UserRole` VALUES (8, 'apollo', 16, b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `UserRole` VALUES (9, 'apollo', 17, b'1', 'apollo', '2020-08-06 02:39:09', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `UserRole` VALUES (10, 'apollo', 20, b'1', 'apollo', '2020-08-06 02:49:33', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `UserRole` VALUES (11, 'apollo', 21, b'1', 'apollo', '2020-08-06 02:49:33', 'apollo', '2020-08-06 15:51:29');
INSERT INTO `UserRole` VALUES (12, 'apollo', 24, b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `UserRole` VALUES (13, 'apollo', 26, b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `UserRole` VALUES (14, 'apollo', 27, b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `UserRole` VALUES (15, 'apollo', 30, b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');
INSERT INTO `UserRole` VALUES (16, 'apollo', 32, b'0', 'apollo', '2020-08-06 02:56:07', 'apollo', '2020-08-06 02:56:07');
INSERT INTO `UserRole` VALUES (17, 'apollo', 33, b'0', 'apollo', '2020-08-06 02:56:07', 'apollo', '2020-08-06 02:56:07');

-- ----------------------------
-- Table structure for Users
-- ----------------------------
DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '用户名',
  `Password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '密码',
  `Email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '邮箱地址',
  `Enabled` tinyint(4) NULL DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Users
-- ----------------------------
INSERT INTO `Users` VALUES (1, 'apollo', '$2a$10$igOyhsIPo4Wqbu0GiFx9NOuz1PkWLsJy6In4/LkdEiPNObhKZm/pa', '447647649@qq.com', 1);

SET FOREIGN_KEY_CHECKS = 1;
