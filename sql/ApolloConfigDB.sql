/*
 Navicat Premium Data Transfer

 Source Server         : tencent
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 119.45.50.7:3306
 Source Schema         : ApolloConfigDB

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 01/09/2020 09:20:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for AccessKey
-- ----------------------------
DROP TABLE IF EXISTS `AccessKey`;
CREATE TABLE `AccessKey`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Secret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Secret',
  `IsEnabled` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: enabled, 0: disabled',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '访问密钥' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of AccessKey
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of App
-- ----------------------------
INSERT INTO `App` VALUES (1, '12312312312', 'aaa-aaa', 'TEST2', '样例部门2', 'apollo', 'apollo@acme.com', b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 02:54:05');
INSERT INTO `App` VALUES (2, '20200806', 'cloud-test', 'TEST2', '样例部门2', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2020-08-06 02:56:06', 'apollo', '2020-08-06 02:56:06');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用namespace定义' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of AppNamespace
-- ----------------------------
INSERT INTO `AppNamespace` VALUES (1, 'TEST1.zty', '12313123', 'properties', b'1', '', b'0', 'apollo', '2020-08-06 02:49:33', 'apollo', '2020-08-06 02:49:33');
INSERT INTO `AppNamespace` VALUES (2, 'application', '12312312312', 'properties', b'0', 'default app namespace', b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 15:54:04');
INSERT INTO `AppNamespace` VALUES (3, 'application', '20200806', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2020-08-06 02:56:07', 'apollo', '2020-08-06 02:56:07');

-- ----------------------------
-- Table structure for Audit
-- ----------------------------
DROP TABLE IF EXISTS `Audit`;
CREATE TABLE `Audit`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `EntityName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '表名',
  `EntityId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '记录ID',
  `OpName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '操作类型',
  `Comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志审计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Audit
-- ----------------------------
INSERT INTO `Audit` VALUES (1, 'AppNamespace', 1, 'INSERT', NULL, b'0', 'apollo', '2020-08-06 02:49:34', NULL, '2020-08-06 02:49:34');
INSERT INTO `Audit` VALUES (2, 'App', 1, 'INSERT', NULL, b'0', 'apollo', '2020-08-06 02:52:40', NULL, '2020-08-06 02:52:40');
INSERT INTO `Audit` VALUES (3, 'AppNamespace', 2, 'INSERT', NULL, b'0', 'apollo', '2020-08-06 02:52:40', NULL, '2020-08-06 02:52:40');
INSERT INTO `Audit` VALUES (4, 'Cluster', 1, 'INSERT', NULL, b'0', 'apollo', '2020-08-06 02:52:40', NULL, '2020-08-06 02:52:40');
INSERT INTO `Audit` VALUES (5, 'Namespace', 1, 'INSERT', NULL, b'0', 'apollo', '2020-08-06 02:52:40', NULL, '2020-08-06 02:52:40');
INSERT INTO `Audit` VALUES (6, 'Namespace', 1, 'DELETE', NULL, b'0', 'apollo', '2020-08-06 02:54:04', NULL, '2020-08-06 02:54:04');
INSERT INTO `Audit` VALUES (7, 'Cluster', 1, 'DELETE', NULL, b'0', 'apollo', '2020-08-06 02:54:05', NULL, '2020-08-06 02:54:05');
INSERT INTO `Audit` VALUES (8, 'App', 1, 'DELETE', NULL, b'0', 'apollo', '2020-08-06 02:54:05', NULL, '2020-08-06 02:54:05');
INSERT INTO `Audit` VALUES (9, 'App', 2, 'INSERT', NULL, b'0', 'apollo', '2020-08-06 02:56:07', NULL, '2020-08-06 02:56:07');
INSERT INTO `Audit` VALUES (10, 'AppNamespace', 3, 'INSERT', NULL, b'0', 'apollo', '2020-08-06 02:56:07', NULL, '2020-08-06 02:56:07');
INSERT INTO `Audit` VALUES (11, 'Cluster', 2, 'INSERT', NULL, b'0', 'apollo', '2020-08-06 02:56:07', NULL, '2020-08-06 02:56:07');
INSERT INTO `Audit` VALUES (12, 'Namespace', 2, 'INSERT', NULL, b'0', 'apollo', '2020-08-06 02:56:07', NULL, '2020-08-06 02:56:07');
INSERT INTO `Audit` VALUES (13, 'Item', 1, 'INSERT', NULL, b'0', 'apollo', '2020-08-06 03:00:54', NULL, '2020-08-06 03:00:54');
INSERT INTO `Audit` VALUES (14, 'Item', 2, 'INSERT', NULL, b'0', 'apollo', '2020-08-06 03:01:19', NULL, '2020-08-06 03:01:19');
INSERT INTO `Audit` VALUES (15, 'Item', 3, 'INSERT', NULL, b'0', 'apollo', '2020-08-06 03:01:49', NULL, '2020-08-06 03:01:49');
INSERT INTO `Audit` VALUES (16, 'Item', 4, 'INSERT', NULL, b'0', 'apollo', '2020-08-06 03:02:06', NULL, '2020-08-06 03:02:06');
INSERT INTO `Audit` VALUES (17, 'Release', 1, 'INSERT', NULL, b'0', 'apollo', '2020-08-06 03:02:22', NULL, '2020-08-06 03:02:22');
INSERT INTO `Audit` VALUES (18, 'ReleaseHistory', 1, 'INSERT', NULL, b'0', 'apollo', '2020-08-06 03:02:22', NULL, '2020-08-06 03:02:22');
INSERT INTO `Audit` VALUES (19, 'Item', 1, 'UPDATE', NULL, b'0', 'apollo', '2020-08-06 04:00:37', NULL, '2020-08-06 04:00:37');
INSERT INTO `Audit` VALUES (20, 'Release', 2, 'INSERT', NULL, b'0', 'apollo', '2020-08-06 04:00:43', NULL, '2020-08-06 04:00:43');
INSERT INTO `Audit` VALUES (21, 'ReleaseHistory', 2, 'INSERT', NULL, b'0', 'apollo', '2020-08-06 04:00:43', NULL, '2020-08-06 04:00:43');
INSERT INTO `Audit` VALUES (22, 'Release', 3, 'INSERT', NULL, b'0', 'apollo', '2020-08-06 04:04:49', NULL, '2020-08-06 04:04:49');
INSERT INTO `Audit` VALUES (23, 'ReleaseHistory', 3, 'INSERT', NULL, b'0', 'apollo', '2020-08-06 04:04:49', NULL, '2020-08-06 04:04:49');
INSERT INTO `Audit` VALUES (24, 'Item', 5, 'INSERT', NULL, b'0', 'apollo', '2020-08-11 02:05:42', NULL, '2020-08-11 02:05:42');
INSERT INTO `Audit` VALUES (25, 'Release', 4, 'INSERT', NULL, b'0', 'apollo', '2020-08-11 02:05:45', NULL, '2020-08-11 02:05:45');
INSERT INTO `Audit` VALUES (26, 'ReleaseHistory', 4, 'INSERT', NULL, b'0', 'apollo', '2020-08-11 02:05:46', NULL, '2020-08-11 02:05:46');
INSERT INTO `Audit` VALUES (27, 'Item', 2, 'UPDATE', NULL, b'0', 'apollo', '2020-08-11 02:49:51', NULL, '2020-08-11 02:49:51');
INSERT INTO `Audit` VALUES (28, 'Release', 5, 'INSERT', NULL, b'0', 'apollo', '2020-08-11 02:49:55', NULL, '2020-08-11 02:49:55');
INSERT INTO `Audit` VALUES (29, 'ReleaseHistory', 5, 'INSERT', NULL, b'0', 'apollo', '2020-08-11 02:49:55', NULL, '2020-08-11 02:49:55');
INSERT INTO `Audit` VALUES (30, 'Release', 6, 'INSERT', NULL, b'0', 'apollo', '2020-08-11 02:53:10', NULL, '2020-08-11 02:53:10');
INSERT INTO `Audit` VALUES (31, 'ReleaseHistory', 6, 'INSERT', NULL, b'0', 'apollo', '2020-08-11 02:53:10', NULL, '2020-08-11 02:53:10');
INSERT INTO `Audit` VALUES (32, 'Item', 5, 'UPDATE', NULL, b'0', 'apollo', '2020-08-31 03:00:49', NULL, '2020-08-31 03:00:49');
INSERT INTO `Audit` VALUES (33, 'Item', 2, 'UPDATE', NULL, b'0', 'apollo', '2020-08-31 03:01:01', NULL, '2020-08-31 03:01:01');
INSERT INTO `Audit` VALUES (34, 'Item', 6, 'INSERT', NULL, b'0', 'apollo', '2020-08-31 03:03:58', NULL, '2020-08-31 03:03:58');
INSERT INTO `Audit` VALUES (35, 'Item', 7, 'INSERT', NULL, b'0', 'apollo', '2020-08-31 03:03:59', NULL, '2020-08-31 03:03:59');
INSERT INTO `Audit` VALUES (36, 'Item', 8, 'INSERT', NULL, b'0', 'apollo', '2020-08-31 03:03:59', NULL, '2020-08-31 03:03:59');
INSERT INTO `Audit` VALUES (37, 'Item', 9, 'INSERT', NULL, b'0', 'apollo', '2020-08-31 03:03:59', NULL, '2020-08-31 03:03:59');
INSERT INTO `Audit` VALUES (38, 'Item', 10, 'INSERT', NULL, b'0', 'apollo', '2020-08-31 03:03:59', NULL, '2020-08-31 03:03:59');
INSERT INTO `Audit` VALUES (39, 'Item', 11, 'INSERT', NULL, b'0', 'apollo', '2020-08-31 03:03:59', NULL, '2020-08-31 03:03:59');
INSERT INTO `Audit` VALUES (40, 'Item', 12, 'INSERT', NULL, b'0', 'apollo', '2020-08-31 03:03:59', NULL, '2020-08-31 03:03:59');
INSERT INTO `Audit` VALUES (41, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2020-08-31 03:03:59', NULL, '2020-08-31 03:03:59');
INSERT INTO `Audit` VALUES (42, 'Item', 13, 'INSERT', NULL, b'0', 'apollo', '2020-08-31 03:04:37', NULL, '2020-08-31 03:04:37');
INSERT INTO `Audit` VALUES (43, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2020-08-31 03:04:37', NULL, '2020-08-31 03:04:37');
INSERT INTO `Audit` VALUES (44, 'Release', 7, 'INSERT', NULL, b'0', 'apollo', '2020-08-31 03:04:43', NULL, '2020-08-31 03:04:43');
INSERT INTO `Audit` VALUES (45, 'ReleaseHistory', 7, 'INSERT', NULL, b'0', 'apollo', '2020-08-31 03:04:43', NULL, '2020-08-31 03:04:43');

-- ----------------------------
-- Table structure for Cluster
-- ----------------------------
DROP TABLE IF EXISTS `Cluster`;
CREATE TABLE `Cluster`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '集群名字',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'App id',
  `ParentClusterId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父cluster',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AppId_Name`(`AppId`, `Name`) USING BTREE,
  INDEX `IX_ParentClusterId`(`ParentClusterId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '集群' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Cluster
-- ----------------------------
INSERT INTO `Cluster` VALUES (1, 'default', '12312312312', 0, b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 02:54:05');
INSERT INTO `Cluster` VALUES (2, 'default', '20200806', 0, b'0', 'apollo', '2020-08-06 02:56:07', 'apollo', '2020-08-06 02:56:07');

-- ----------------------------
-- Table structure for Commit
-- ----------------------------
DROP TABLE IF EXISTS `Commit`;
CREATE TABLE `Commit`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ChangeSets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '修改变更集',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `ClusterName`(`ClusterName`(191)) USING BTREE,
  INDEX `NamespaceName`(`NamespaceName`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'commit 历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Commit
-- ----------------------------
INSERT INTO `Commit` VALUES (1, '{\"createItems\":[{\"namespaceId\":2,\"key\":\"spring.redis.host\",\"value\":\"localhost\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-06 16:00:53\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-06 16:00:53\"}],\"updateItems\":[],\"deleteItems\":[]}', '20200806', 'default', 'application', NULL, b'0', 'apollo', '2020-08-06 03:00:54', 'apollo', '2020-08-06 03:00:54');
INSERT INTO `Commit` VALUES (2, '{\"createItems\":[{\"namespaceId\":2,\"key\":\"spring.redis.port\",\"value\":\"6379\",\"lineNum\":2,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-06 16:01:19\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-06 16:01:19\"}],\"updateItems\":[],\"deleteItems\":[]}', '20200806', 'default', 'application', NULL, b'0', 'apollo', '2020-08-06 03:01:19', 'apollo', '2020-08-06 03:01:19');
INSERT INTO `Commit` VALUES (3, '{\"createItems\":[{\"namespaceId\":2,\"key\":\"spring.redis.password\",\"value\":\"Zty\\u0026\\u00261212\",\"lineNum\":3,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-06 16:01:49\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-06 16:01:49\"}],\"updateItems\":[],\"deleteItems\":[]}', '20200806', 'default', 'application', NULL, b'0', 'apollo', '2020-08-06 03:01:49', 'apollo', '2020-08-06 03:01:49');
INSERT INTO `Commit` VALUES (4, '{\"createItems\":[{\"namespaceId\":2,\"key\":\"spring.redis.database\",\"value\":\"1\",\"lineNum\":4,\"id\":4,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-06 16:02:06\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-06 16:02:06\"}],\"updateItems\":[],\"deleteItems\":[]}', '20200806', 'default', 'application', NULL, b'0', 'apollo', '2020-08-06 03:02:06', 'apollo', '2020-08-06 03:02:06');
INSERT INTO `Commit` VALUES (5, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":2,\"key\":\"spring.redis.host\",\"value\":\"localhost\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-06 16:00:54\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-06 16:00:54\"},\"newItem\":{\"namespaceId\":2,\"key\":\"spring.redis.host\",\"value\":\"119.45.50.7\",\"comment\":\"\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-06 16:00:54\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-06 17:00:36\"}}],\"deleteItems\":[]}', '20200806', 'default', 'application', NULL, b'0', 'apollo', '2020-08-06 04:00:37', 'apollo', '2020-08-06 04:00:37');
INSERT INTO `Commit` VALUES (6, '{\"createItems\":[{\"namespaceId\":2,\"key\":\"server.port\",\"value\":\"8088\",\"lineNum\":5,\"id\":5,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-11 15:05:41\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-11 15:05:41\"}],\"updateItems\":[],\"deleteItems\":[]}', '20200806', 'default', 'application', NULL, b'0', 'apollo', '2020-08-11 02:05:42', 'apollo', '2020-08-11 02:05:42');
INSERT INTO `Commit` VALUES (7, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":2,\"key\":\"spring.redis.port\",\"value\":\"6379\",\"lineNum\":2,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-06 16:01:19\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-06 16:01:19\"},\"newItem\":{\"namespaceId\":2,\"key\":\"spring.redis.port\",\"value\":\"0000\",\"comment\":\"\",\"lineNum\":2,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-06 16:01:19\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-11 15:49:51\"}}],\"deleteItems\":[]}', '20200806', 'default', 'application', NULL, b'0', 'apollo', '2020-08-11 02:49:52', 'apollo', '2020-08-11 02:49:52');
INSERT INTO `Commit` VALUES (8, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":2,\"key\":\"server.port\",\"value\":\"8088\",\"lineNum\":5,\"id\":5,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-11 15:05:42\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-11 15:05:42\"},\"newItem\":{\"namespaceId\":2,\"key\":\"server.port\",\"value\":\"8083\",\"comment\":\"\",\"lineNum\":5,\"id\":5,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-11 15:05:42\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-31 16:00:49\"}}],\"deleteItems\":[]}', '20200806', 'default', 'application', NULL, b'0', 'apollo', '2020-08-31 03:00:49', 'apollo', '2020-08-31 03:00:49');
INSERT INTO `Commit` VALUES (9, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":2,\"key\":\"spring.redis.port\",\"value\":\"0000\",\"comment\":\"\",\"lineNum\":2,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-06 16:01:19\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-11 15:49:51\"},\"newItem\":{\"namespaceId\":2,\"key\":\"spring.redis.port\",\"value\":\"6379\",\"comment\":\"\",\"lineNum\":2,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-06 16:01:19\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-31 16:01:01\"}}],\"deleteItems\":[]}', '20200806', 'default', 'application', NULL, b'0', 'apollo', '2020-08-31 03:01:01', 'apollo', '2020-08-31 03:01:01');
INSERT INTO `Commit` VALUES (10, '{\"createItems\":[{\"namespaceId\":2,\"key\":\"spring.application.name\",\"value\":\"gateway\",\"comment\":\"\",\"lineNum\":6,\"id\":6,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-31 16:03:58\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-31 16:03:58\"},{\"namespaceId\":2,\"key\":\"spring.cloud.gateway.discovery.locator.lowerCaseServiceId\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":7,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-31 16:03:58\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-31 16:03:58\"},{\"namespaceId\":2,\"key\":\"spring.cloud.gateway.discovery.locator.enabled\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":8,\"id\":8,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-31 16:03:58\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-31 16:03:58\"},{\"namespaceId\":2,\"key\":\"spring.cloud.gateway.loadbalancer.use404\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":9,\"id\":9,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-31 16:03:58\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-31 16:03:58\"},{\"namespaceId\":2,\"key\":\"spring.cloud.loadbalancer.ribbon.enabled\",\"value\":\"false\",\"comment\":\"\",\"lineNum\":10,\"id\":10,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-31 16:03:58\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-31 16:03:58\"},{\"namespaceId\":2,\"key\":\"eureka.instance.prefer-ip-address\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":11,\"id\":11,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-31 16:03:58\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-31 16:03:58\"},{\"namespaceId\":2,\"key\":\"eureka.instance.hostname\",\"value\":\"localhost\",\"comment\":\"\",\"lineNum\":12,\"id\":12,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-31 16:03:58\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-31 16:03:58\"}],\"updateItems\":[],\"deleteItems\":[]}', '20200806', 'default', 'application', NULL, b'0', 'apollo', '2020-08-31 03:03:59', 'apollo', '2020-08-31 03:03:59');
INSERT INTO `Commit` VALUES (11, '{\"createItems\":[{\"namespaceId\":2,\"key\":\"eureka.client.service-url.defaultZone\",\"value\":\"http://119.45.50.7:8081/eureka,http://119.45.50.7:8082/eureka\",\"comment\":\"\",\"lineNum\":13,\"id\":13,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-08-31 16:04:36\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-08-31 16:04:36\"}],\"updateItems\":[],\"deleteItems\":[]}', '20200806', 'default', 'application', NULL, b'0', 'apollo', '2020-08-31 03:04:37', 'apollo', '2020-08-31 03:04:37');

-- ----------------------------
-- Table structure for GrayReleaseRule
-- ----------------------------
DROP TABLE IF EXISTS `GrayReleaseRule`;
CREATE TABLE `GrayReleaseRule`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `BranchName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'branch name',
  `Rules` varchar(16000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '[]' COMMENT '灰度规则',
  `ReleaseId` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '灰度对应的release',
  `BranchStatus` tinyint(2) NULL DEFAULT 1 COMMENT '灰度分支状态: 0:删除分支,1:正在使用的规则 2：全量发布',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Namespace`(`AppId`, `ClusterName`, `NamespaceName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '灰度规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of GrayReleaseRule
-- ----------------------------

-- ----------------------------
-- Table structure for Instance
-- ----------------------------
DROP TABLE IF EXISTS `Instance`;
CREATE TABLE `Instance`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `DataCenter` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Data Center Name',
  `Ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'instance ip',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_UNIQUE_KEY`(`AppId`, `ClusterName`, `Ip`, `DataCenter`) USING BTREE,
  INDEX `IX_IP`(`Ip`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '使用配置的应用实例' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Instance
-- ----------------------------
INSERT INTO `Instance` VALUES (1, '20200806', 'default', '', '10.120.251.83', '2020-08-31 01:31:07', '2020-08-31 01:31:07');

-- ----------------------------
-- Table structure for InstanceConfig
-- ----------------------------
DROP TABLE IF EXISTS `InstanceConfig`;
CREATE TABLE `InstanceConfig`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `InstanceId` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'Instance Id',
  `ConfigAppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Config App Id',
  `ConfigClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Config Cluster Name',
  `ConfigNamespaceName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Config Namespace Name',
  `ReleaseKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发布的Key',
  `ReleaseDeliveryTime` timestamp(0) NULL DEFAULT NULL COMMENT '配置获取时间',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_UNIQUE_KEY`(`InstanceId`, `ConfigAppId`, `ConfigNamespaceName`) USING BTREE,
  INDEX `IX_ReleaseKey`(`ReleaseKey`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Valid_Namespace`(`ConfigAppId`, `ConfigClusterName`, `ConfigNamespaceName`, `DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用实例的配置信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of InstanceConfig
-- ----------------------------
INSERT INTO `InstanceConfig` VALUES (1, 1, '20200806', 'default', 'application', '20200831160443-9218f5141d7c27ab', '2020-08-31 03:04:50', '2020-08-31 01:31:07', '2020-08-31 19:08:55');

-- ----------------------------
-- Table structure for Item
-- ----------------------------
DROP TABLE IF EXISTS `Item`;
CREATE TABLE `Item`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `NamespaceId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '集群NamespaceId',
  `Key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置项值',
  `Comment` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '注释',
  `LineNum` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '行号',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_GroupId`(`NamespaceId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Item
-- ----------------------------
INSERT INTO `Item` VALUES (1, 2, 'spring.redis.host', '119.45.50.7', '', 1, b'0', 'apollo', '2020-08-06 03:00:54', 'apollo', '2020-08-06 04:00:37');
INSERT INTO `Item` VALUES (2, 2, 'spring.redis.port', '6379', '', 2, b'0', 'apollo', '2020-08-06 03:01:19', 'apollo', '2020-08-31 03:01:01');
INSERT INTO `Item` VALUES (3, 2, 'spring.redis.password', 'Zty&&1212', NULL, 3, b'0', 'apollo', '2020-08-06 03:01:49', 'apollo', '2020-08-06 03:01:49');
INSERT INTO `Item` VALUES (4, 2, 'spring.redis.database', '1', NULL, 4, b'0', 'apollo', '2020-08-06 03:02:06', 'apollo', '2020-08-06 03:02:06');
INSERT INTO `Item` VALUES (5, 2, 'server.port', '8083', '', 5, b'0', 'apollo', '2020-08-11 02:05:42', 'apollo', '2020-08-31 03:00:49');
INSERT INTO `Item` VALUES (6, 2, 'spring.application.name', 'gateway', '', 6, b'0', 'apollo', '2020-08-31 03:03:58', 'apollo', '2020-08-31 03:03:58');
INSERT INTO `Item` VALUES (7, 2, 'spring.cloud.gateway.discovery.locator.lowerCaseServiceId', 'true', '', 7, b'0', 'apollo', '2020-08-31 03:03:59', 'apollo', '2020-08-31 03:03:59');
INSERT INTO `Item` VALUES (8, 2, 'spring.cloud.gateway.discovery.locator.enabled', 'true', '', 8, b'0', 'apollo', '2020-08-31 03:03:59', 'apollo', '2020-08-31 03:03:59');
INSERT INTO `Item` VALUES (9, 2, 'spring.cloud.gateway.loadbalancer.use404', 'true', '', 9, b'0', 'apollo', '2020-08-31 03:03:59', 'apollo', '2020-08-31 03:03:59');
INSERT INTO `Item` VALUES (10, 2, 'spring.cloud.loadbalancer.ribbon.enabled', 'false', '', 10, b'0', 'apollo', '2020-08-31 03:03:59', 'apollo', '2020-08-31 03:03:59');
INSERT INTO `Item` VALUES (11, 2, 'eureka.instance.prefer-ip-address', 'true', '', 11, b'0', 'apollo', '2020-08-31 03:03:59', 'apollo', '2020-08-31 03:03:59');
INSERT INTO `Item` VALUES (12, 2, 'eureka.instance.hostname', 'localhost', '', 12, b'0', 'apollo', '2020-08-31 03:03:59', 'apollo', '2020-08-31 03:03:59');
INSERT INTO `Item` VALUES (13, 2, 'eureka.client.service-url.defaultZone', 'http://119.45.50.7:8081/eureka,http://119.45.50.7:8082/eureka', '', 13, b'0', 'apollo', '2020-08-31 03:04:37', 'apollo', '2020-08-31 03:04:37');

-- ----------------------------
-- Table structure for Namespace
-- ----------------------------
DROP TABLE IF EXISTS `Namespace`;
CREATE TABLE `Namespace`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId_ClusterName_NamespaceName`(`AppId`(191), `ClusterName`(191), `NamespaceName`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_NamespaceName`(`NamespaceName`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '命名空间' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Namespace
-- ----------------------------
INSERT INTO `Namespace` VALUES (1, '12312312312', 'default', 'application', b'1', 'apollo', '2020-08-06 02:52:40', 'apollo', '2020-08-06 02:54:05');
INSERT INTO `Namespace` VALUES (2, '20200806', 'default', 'application', b'0', 'apollo', '2020-08-06 02:56:07', 'apollo', '2020-08-06 02:56:07');

-- ----------------------------
-- Table structure for NamespaceLock
-- ----------------------------
DROP TABLE IF EXISTS `NamespaceLock`;
CREATE TABLE `NamespaceLock`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `NamespaceId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '集群NamespaceId',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `IsDeleted` bit(1) NULL DEFAULT b'0' COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_NamespaceId`(`NamespaceId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'namespace的编辑锁' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of NamespaceLock
-- ----------------------------

-- ----------------------------
-- Table structure for Release
-- ----------------------------
DROP TABLE IF EXISTS `Release`;
CREATE TABLE `Release`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `ReleaseKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发布的Key',
  `Name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '发布名字',
  `Comment` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发布说明',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Configurations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布配置',
  `IsAbandoned` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否废弃',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId_ClusterName_GroupName`(`AppId`(191), `ClusterName`(191), `NamespaceName`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_ReleaseKey`(`ReleaseKey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发布' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Release
-- ----------------------------
INSERT INTO `Release` VALUES (1, '20200806160221-9218f5141dca45fc', '20200806160208-release', 'redis配置', '20200806', 'default', 'application', '{\"spring.redis.host\":\"localhost\",\"spring.redis.port\":\"6379\",\"spring.redis.password\":\"Zty\\u0026\\u00261212\",\"spring.redis.database\":\"1\"}', b'0', b'0', 'apollo', '2020-08-06 03:02:22', 'apollo', '2020-08-06 03:02:22');
INSERT INTO `Release` VALUES (2, '20200806170042-9218f5141dca45fd', '20200806170039-release', '', '20200806', 'default', 'application', '{\"spring.redis.host\":\"119.45.50.7\",\"spring.redis.port\":\"6379\",\"spring.redis.password\":\"Zty\\u0026\\u00261212\",\"spring.redis.database\":\"1\"}', b'0', b'0', 'apollo', '2020-08-06 04:00:43', 'apollo', '2020-08-06 04:00:43');
INSERT INTO `Release` VALUES (3, '20200806170448-9218f5141dca45fe', '20200806170447-release', '', '20200806', 'default', 'application', '{\"spring.redis.host\":\"119.45.50.7\",\"spring.redis.port\":\"6379\",\"spring.redis.password\":\"Zty\\u0026\\u00261212\",\"spring.redis.database\":\"1\"}', b'0', b'0', 'apollo', '2020-08-06 04:04:49', 'apollo', '2020-08-06 04:04:49');
INSERT INTO `Release` VALUES (4, '20200811150545-9218f5141d80a3c1', '20200811150543-release', '', '20200806', 'default', 'application', '{\"spring.redis.host\":\"119.45.50.7\",\"spring.redis.port\":\"6379\",\"spring.redis.password\":\"Zty\\u0026\\u00261212\",\"spring.redis.database\":\"1\",\"server.port\":\"8088\"}', b'0', b'0', 'apollo', '2020-08-11 02:05:45', 'apollo', '2020-08-11 02:05:45');
INSERT INTO `Release` VALUES (5, '20200811154954-9218f5141d80a3c2', '20200811154952-release', '', '20200806', 'default', 'application', '{\"spring.redis.host\":\"119.45.50.7\",\"spring.redis.port\":\"0000\",\"spring.redis.password\":\"Zty\\u0026\\u00261212\",\"spring.redis.database\":\"1\",\"server.port\":\"8088\"}', b'0', b'0', 'apollo', '2020-08-11 02:49:55', 'apollo', '2020-08-11 02:49:55');
INSERT INTO `Release` VALUES (6, '20200811155310-9218f5141d80a3c3', '20200811155309-release', '', '20200806', 'default', 'application', '{\"spring.redis.host\":\"119.45.50.7\",\"spring.redis.port\":\"0000\",\"spring.redis.password\":\"Zty\\u0026\\u00261212\",\"spring.redis.database\":\"1\",\"server.port\":\"8088\"}', b'0', b'0', 'apollo', '2020-08-11 02:53:10', 'apollo', '2020-08-11 02:53:10');
INSERT INTO `Release` VALUES (7, '20200831160443-9218f5141d7c27ab', '20200831160440-release', '', '20200806', 'default', 'application', '{\"spring.redis.host\":\"119.45.50.7\",\"spring.redis.port\":\"6379\",\"spring.redis.password\":\"Zty\\u0026\\u00261212\",\"spring.redis.database\":\"1\",\"server.port\":\"8083\",\"spring.application.name\":\"gateway\",\"spring.cloud.gateway.discovery.locator.lowerCaseServiceId\":\"true\",\"spring.cloud.gateway.discovery.locator.enabled\":\"true\",\"spring.cloud.gateway.loadbalancer.use404\":\"true\",\"spring.cloud.loadbalancer.ribbon.enabled\":\"false\",\"eureka.instance.prefer-ip-address\":\"true\",\"eureka.instance.hostname\":\"localhost\",\"eureka.client.service-url.defaultZone\":\"http://119.45.50.7:8081/eureka,http://119.45.50.7:8082/eureka\"}', b'0', b'0', 'apollo', '2020-08-31 03:04:43', 'apollo', '2020-08-31 03:04:43');

-- ----------------------------
-- Table structure for ReleaseHistory
-- ----------------------------
DROP TABLE IF EXISTS `ReleaseHistory`;
CREATE TABLE `ReleaseHistory`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `BranchName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '发布分支名',
  `ReleaseId` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联的Release Id',
  `PreviousReleaseId` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '前一次发布的ReleaseId',
  `Operation` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发布类型，0: 普通发布，1: 回滚，2: 灰度发布，3: 灰度规则更新，4: 灰度合并回主分支发布，5: 主分支发布灰度自动发布，6: 主分支回滚灰度自动发布，7: 放弃灰度',
  `OperationContext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布上下文信息',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_Namespace`(`AppId`, `ClusterName`, `NamespaceName`, `BranchName`) USING BTREE,
  INDEX `IX_ReleaseId`(`ReleaseId`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发布历史' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ReleaseHistory
-- ----------------------------
INSERT INTO `ReleaseHistory` VALUES (1, '20200806', 'default', 'application', 'default', 1, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2020-08-06 03:02:22', 'apollo', '2020-08-06 03:02:22');
INSERT INTO `ReleaseHistory` VALUES (2, '20200806', 'default', 'application', 'default', 2, 1, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2020-08-06 04:00:43', 'apollo', '2020-08-06 04:00:43');
INSERT INTO `ReleaseHistory` VALUES (3, '20200806', 'default', 'application', 'default', 3, 2, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2020-08-06 04:04:49', 'apollo', '2020-08-06 04:04:49');
INSERT INTO `ReleaseHistory` VALUES (4, '20200806', 'default', 'application', 'default', 4, 3, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2020-08-11 02:05:45', 'apollo', '2020-08-11 02:05:45');
INSERT INTO `ReleaseHistory` VALUES (5, '20200806', 'default', 'application', 'default', 5, 4, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2020-08-11 02:49:55', 'apollo', '2020-08-11 02:49:55');
INSERT INTO `ReleaseHistory` VALUES (6, '20200806', 'default', 'application', 'default', 6, 5, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2020-08-11 02:53:10', 'apollo', '2020-08-11 02:53:10');
INSERT INTO `ReleaseHistory` VALUES (7, '20200806', 'default', 'application', 'default', 7, 6, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2020-08-31 03:04:43', 'apollo', '2020-08-31 03:04:43');

-- ----------------------------
-- Table structure for ReleaseMessage
-- ----------------------------
DROP TABLE IF EXISTS `ReleaseMessage`;
CREATE TABLE `ReleaseMessage`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Message` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发布的消息内容',
  `DataChange_LastTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Message`(`Message`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发布消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ReleaseMessage
-- ----------------------------
INSERT INTO `ReleaseMessage` VALUES (1, '12312312312+default+application', '2020-08-06 02:54:04');
INSERT INTO `ReleaseMessage` VALUES (8, '20200806+default+application', '2020-08-31 03:04:43');

-- ----------------------------
-- Table structure for ServerConfig
-- ----------------------------
DROP TABLE IF EXISTS `ServerConfig`;
CREATE TABLE `ServerConfig`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Cluster` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置对应的集群，default为不针对特定的集群',
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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置服务自身配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ServerConfig
-- ----------------------------
INSERT INTO `ServerConfig` VALUES (1, 'eureka.service.url', 'default', 'http://119.45.50.7:8081/eureka', 'Eureka服务Url，多个service以英文逗号分隔', b'0', 'default', '2020-08-03 08:14:07', '', '2020-08-31 15:16:45');
INSERT INTO `ServerConfig` VALUES (2, 'namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关', b'0', 'default', '2020-08-03 08:14:07', '', '2020-08-03 08:14:07');
INSERT INTO `ServerConfig` VALUES (3, 'item.key.length.limit', 'default', '128', 'item key 最大长度限制', b'0', 'default', '2020-08-03 08:14:07', '', '2020-08-03 08:14:07');
INSERT INTO `ServerConfig` VALUES (4, 'item.value.length.limit', 'default', '20000', 'item value最大长度限制', b'0', 'default', '2020-08-03 08:14:07', '', '2020-08-03 08:14:07');
INSERT INTO `ServerConfig` VALUES (5, 'config-service.cache.enabled', 'default', 'false', 'ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！', b'0', 'default', '2020-08-03 08:14:07', '', '2020-08-03 08:14:07');

SET FOREIGN_KEY_CHECKS = 1;
