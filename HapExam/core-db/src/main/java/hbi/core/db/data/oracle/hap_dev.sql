-------------------------------------------------
-- Export file for user HAP_DEV2               --
-- Created by liuwanwan on 2016/8/27, 22:08:56 --
-------------------------------------------------

set define off
spool hap_dev.log

prompt
prompt Creating table DATABASECHANGELOG
prompt ================================
prompt
create table HAP_DEV2.DATABASECHANGELOG
(
  id            VARCHAR2(255) not null,
  author        VARCHAR2(255) not null,
  filename      VARCHAR2(255) not null,
  dateexecuted  TIMESTAMP(6) not null,
  orderexecuted NUMBER(10) not null,
  exectype      VARCHAR2(10) not null,
  md5sum        VARCHAR2(35),
  description   VARCHAR2(255),
  comments      VARCHAR2(255),
  tag           VARCHAR2(255),
  liquibase     VARCHAR2(20),
  contexts      VARCHAR2(255),
  labels        VARCHAR2(255)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DATABASECHANGELOGLOCK
prompt ====================================
prompt
create table HAP_DEV2.DATABASECHANGELOGLOCK
(
  id          NUMBER(10) not null,
  locked      NUMBER(1) not null,
  lockgranted TIMESTAMP(6),
  lockedby    VARCHAR2(255)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAP_DEV2.DATABASECHANGELOGLOCK
  add constraint PK_DATABASECHANGELOGLOCK primary key (ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table FRUIT_B
prompt ======================
prompt
create table HAP_DEV2.FRUIT_B
(
  fruit_id              NUMBER not null,
  fruit_name            VARCHAR2(150) not null,
  fruit_code            VARCHAR2(150) not null,
  fruit_description     VARCHAR2(240),
  object_version_number NUMBER default 1,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.FRUIT_B
  is '水果表';
comment on column HAP_DEV2.FRUIT_B.fruit_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.FRUIT_B.fruit_name
  is '水果名称';
comment on column HAP_DEV2.FRUIT_B.fruit_code
  is '水果编码';
comment on column HAP_DEV2.FRUIT_B.fruit_description
  is '水果描述';
alter table HAP_DEV2.FRUIT_B
  add constraint FRUIT_B_PK primary key (FRUIT_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table FRUIT_TL
prompt =======================
prompt
create table HAP_DEV2.FRUIT_TL
(
  fruit_id              NUMBER not null,
  lang                  VARCHAR2(10) not null,
  fruit_description     VARCHAR2(240),
  object_version_number NUMBER default 1,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.FRUIT_TL
  is '水果表(多语言)';
comment on column HAP_DEV2.FRUIT_TL.fruit_id
  is '水果ID';
comment on column HAP_DEV2.FRUIT_TL.lang
  is '语言';
comment on column HAP_DEV2.FRUIT_TL.fruit_description
  is '水果描述';
alter table HAP_DEV2.FRUIT_TL
  add constraint FRUIT_TL_PK primary key (FRUIT_ID, LANG)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HAP_AR_CUSTOMERS
prompt ===============================
prompt
create table HAP_DEV2.HAP_AR_CUSTOMERS
(
  customer_id        NUMBER not null,
  customer_number    VARCHAR2(60) not null,
  customer_name      VARCHAR2(240) not null,
  company_id         NUMBER not null,
  enabled_flag       VARCHAR2(1) not null,
  creation_date      DATE default sysdate not null,
  created_by         NUMBER default -1 not null,
  last_updated_by    NUMBER default -1 not null,
  last_update_date   DATE default sysdate not null,
  last_update_login  NUMBER,
  attribute_category VARCHAR2(30),
  attribute1         VARCHAR2(240),
  attribute2         VARCHAR2(240),
  attribute3         VARCHAR2(240),
  attribute4         VARCHAR2(240),
  attribute5         VARCHAR2(240),
  attribute6         VARCHAR2(240),
  attribute7         VARCHAR2(240),
  attribute8         VARCHAR2(240),
  attribute9         VARCHAR2(240),
  attribute10        VARCHAR2(240),
  attribute11        VARCHAR2(240),
  attribute12        VARCHAR2(240),
  attribute13        VARCHAR2(240),
  attribute14        VARCHAR2(240),
  attribute15        VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.HAP_AR_CUSTOMERS
  is '客户主数据';
comment on column HAP_DEV2.HAP_AR_CUSTOMERS.customer_id
  is '客户ID';
comment on column HAP_DEV2.HAP_AR_CUSTOMERS.customer_number
  is '客户编号';
comment on column HAP_DEV2.HAP_AR_CUSTOMERS.customer_name
  is '客户名称';
comment on column HAP_DEV2.HAP_AR_CUSTOMERS.company_id
  is '公司ID';
comment on column HAP_DEV2.HAP_AR_CUSTOMERS.enabled_flag
  is '启用标识';

prompt
prompt Creating table HAP_INV_INVENTORY_ITEMS
prompt ======================================
prompt
create table HAP_DEV2.HAP_INV_INVENTORY_ITEMS
(
  inventory_item_id  NUMBER not null,
  item_code          VARCHAR2(60) not null,
  item_uom           VARCHAR2(60) not null,
  item_description   VARCHAR2(240) not null,
  order_flag         VARCHAR2(1) not null,
  start_active_date  DATE,
  end_active_date    DATE,
  enabled_flag       VARCHAR2(1) not null,
  creation_date      DATE default sysdate not null,
  created_by         NUMBER default -1 not null,
  last_updated_by    NUMBER default -1 not null,
  last_update_date   DATE default sysdate not null,
  last_update_login  NUMBER,
  attribute_category VARCHAR2(30),
  attribute1         VARCHAR2(240),
  attribute2         VARCHAR2(240),
  attribute3         VARCHAR2(240),
  attribute4         VARCHAR2(240),
  attribute5         VARCHAR2(240),
  attribute6         VARCHAR2(240),
  attribute7         VARCHAR2(240),
  attribute8         VARCHAR2(240),
  attribute9         VARCHAR2(240),
  attribute10        VARCHAR2(240),
  attribute11        VARCHAR2(240),
  attribute12        VARCHAR2(240),
  attribute13        VARCHAR2(240),
  attribute14        VARCHAR2(240),
  attribute15        VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.HAP_INV_INVENTORY_ITEMS
  is '物料主数据';
comment on column HAP_DEV2.HAP_INV_INVENTORY_ITEMS.inventory_item_id
  is '物料ID';
comment on column HAP_DEV2.HAP_INV_INVENTORY_ITEMS.item_code
  is '物料编码';
comment on column HAP_DEV2.HAP_INV_INVENTORY_ITEMS.item_uom
  is '物料单位';
comment on column HAP_DEV2.HAP_INV_INVENTORY_ITEMS.item_description
  is '物料描述';
comment on column HAP_DEV2.HAP_INV_INVENTORY_ITEMS.order_flag
  is '是否能用于销售';
comment on column HAP_DEV2.HAP_INV_INVENTORY_ITEMS.start_active_date
  is '生效起始时间';
comment on column HAP_DEV2.HAP_INV_INVENTORY_ITEMS.end_active_date
  is '生效结束时间';
comment on column HAP_DEV2.HAP_INV_INVENTORY_ITEMS.enabled_flag
  is '启用标识';

prompt
prompt Creating table HAP_OM_ORDER_HEADERS
prompt ===================================
prompt
create table HAP_DEV2.HAP_OM_ORDER_HEADERS
(
  header_id             NUMBER not null,
  order_number          VARCHAR2(60) not null,
  company_id            NUMBER,
  order_date            DATE not null,
  order_status          VARCHAR2(30) not null,
  customer_id           NUMBER,
  request_id            NUMBER,
  object_version_number NUMBER default 1 not null,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.HAP_OM_ORDER_HEADERS
  is '销售订单头表';
comment on column HAP_DEV2.HAP_OM_ORDER_HEADERS.header_id
  is '订单头ID';
comment on column HAP_DEV2.HAP_OM_ORDER_HEADERS.order_number
  is '订单编号';
comment on column HAP_DEV2.HAP_OM_ORDER_HEADERS.company_id
  is '公司ID';
comment on column HAP_DEV2.HAP_OM_ORDER_HEADERS.order_date
  is '订单日期';
comment on column HAP_DEV2.HAP_OM_ORDER_HEADERS.order_status
  is '订单状态';
comment on column HAP_DEV2.HAP_OM_ORDER_HEADERS.customer_id
  is '客户ID';
comment on column HAP_DEV2.HAP_OM_ORDER_HEADERS.request_id
  is '请求号';
comment on column HAP_DEV2.HAP_OM_ORDER_HEADERS.object_version_number
  is '行版本号，用来处理锁';
alter table HAP_DEV2.HAP_OM_ORDER_HEADERS
  add constraint HAP_OM_ORDER_HEADERS_PK primary key (HEADER_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HAP_OM_ORDER_LINES
prompt =================================
prompt
create table HAP_DEV2.HAP_OM_ORDER_LINES
(
  line_id               NUMBER not null,
  header_id             NUMBER not null,
  line_number           NUMBER not null,
  inventory_item_id     NUMBER not null,
  orderd_quantity       NUMBER not null,
  order_quantity_uom    VARCHAR2(40) not null,
  unit_selling_price    NUMBER not null,
  description           VARCHAR2(240),
  company_id            NUMBER not null,
  addition1             VARCHAR2(150),
  addition2             VARCHAR2(150),
  addition3             VARCHAR2(150),
  addition4             VARCHAR2(150),
  addition5             VARCHAR2(150) default 'PENDING',
  request_id            NUMBER,
  object_version_number NUMBER default 1 not null,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.HAP_OM_ORDER_LINES
  is '销售订单行表';
comment on column HAP_DEV2.HAP_OM_ORDER_LINES.line_id
  is '订单行ID';
comment on column HAP_DEV2.HAP_OM_ORDER_LINES.header_id
  is '订单头ID';
comment on column HAP_DEV2.HAP_OM_ORDER_LINES.line_number
  is '行号';
comment on column HAP_DEV2.HAP_OM_ORDER_LINES.inventory_item_id
  is '产品ID';
comment on column HAP_DEV2.HAP_OM_ORDER_LINES.orderd_quantity
  is '数量';
comment on column HAP_DEV2.HAP_OM_ORDER_LINES.order_quantity_uom
  is '产品单位';
comment on column HAP_DEV2.HAP_OM_ORDER_LINES.unit_selling_price
  is '销售单价';
comment on column HAP_DEV2.HAP_OM_ORDER_LINES.description
  is '备注';
comment on column HAP_DEV2.HAP_OM_ORDER_LINES.company_id
  is '公司ID';
comment on column HAP_DEV2.HAP_OM_ORDER_LINES.addition1
  is '附加信息1';
comment on column HAP_DEV2.HAP_OM_ORDER_LINES.addition2
  is '附加信息2';
comment on column HAP_DEV2.HAP_OM_ORDER_LINES.addition3
  is '附加信息3';
comment on column HAP_DEV2.HAP_OM_ORDER_LINES.addition4
  is '附加信息4';
comment on column HAP_DEV2.HAP_OM_ORDER_LINES.addition5
  is '附加信息5';
comment on column HAP_DEV2.HAP_OM_ORDER_LINES.request_id
  is '请求号';
comment on column HAP_DEV2.HAP_OM_ORDER_LINES.object_version_number
  is '行版本号，用来处理锁';
create index HAP_DEV2.HAP_OM_ORDER_LINES_N1 on HAP_DEV2.HAP_OM_ORDER_LINES (HEADER_ID)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index HAP_DEV2.HAP_OM_ORDER_LINES_N2 on HAP_DEV2.HAP_OM_ORDER_LINES (INVENTORY_ITEM_ID)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAP_DEV2.HAP_OM_ORDER_LINES
  add constraint HAP_OM_ORDER_LINES_PK primary key (LINE_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HAP_ORG_COMPANYS
prompt ===============================
prompt
create table HAP_DEV2.HAP_ORG_COMPANYS
(
  company_id        NUMBER not null,
  company_number    VARCHAR2(60) not null,
  company_name      VARCHAR2(240) not null,
  enabled_flag      VARCHAR2(1) default 'Y' not null,
  creation_date     DATE default sysdate not null,
  created_by        NUMBER default -1 not null,
  last_updated_by   NUMBER default -1 not null,
  last_update_date  DATE default sysdate not null,
  last_update_login NUMBER
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.HAP_ORG_COMPANYS
  is '公司主数据';
comment on column HAP_DEV2.HAP_ORG_COMPANYS.company_id
  is '公司ID';
comment on column HAP_DEV2.HAP_ORG_COMPANYS.company_number
  is '公司编号';
comment on column HAP_DEV2.HAP_ORG_COMPANYS.company_name
  is '公司名称';
comment on column HAP_DEV2.HAP_ORG_COMPANYS.enabled_flag
  is '启用标识';

prompt
prompt Creating table QRTZ_JOB_DETAILS
prompt ===============================
prompt
create table HAP_DEV2.QRTZ_JOB_DETAILS
(
  sched_name        VARCHAR2(120) not null,
  job_name          VARCHAR2(200) not null,
  job_group         VARCHAR2(200) not null,
  description       VARCHAR2(250),
  job_class_name    VARCHAR2(250) not null,
  is_durable        VARCHAR2(1) not null,
  is_nonconcurrent  VARCHAR2(1) not null,
  is_update_data    VARCHAR2(1) not null,
  requests_recovery VARCHAR2(1) not null,
  job_data          BLOB
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_J_GRP on HAP_DEV2.QRTZ_JOB_DETAILS (SCHED_NAME, JOB_GROUP)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_J_REQ_RECOVERY on HAP_DEV2.QRTZ_JOB_DETAILS (SCHED_NAME, REQUESTS_RECOVERY)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
alter table HAP_DEV2.QRTZ_JOB_DETAILS
  add constraint QRTZ_JOB_DETAILS_PK primary key (SCHED_NAME, JOB_NAME, JOB_GROUP)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table QRTZ_TRIGGERS
prompt ============================
prompt
create table HAP_DEV2.QRTZ_TRIGGERS
(
  sched_name     VARCHAR2(120) not null,
  trigger_name   VARCHAR2(200) not null,
  trigger_group  VARCHAR2(200) not null,
  job_name       VARCHAR2(200) not null,
  job_group      VARCHAR2(200) not null,
  description    VARCHAR2(250),
  next_fire_time NUMBER(13),
  prev_fire_time NUMBER(13),
  priority       NUMBER(13),
  trigger_state  VARCHAR2(16) not null,
  trigger_type   VARCHAR2(8) not null,
  start_time     NUMBER(13) not null,
  end_time       NUMBER(13),
  calendar_name  VARCHAR2(200),
  misfire_instr  NUMBER(2),
  job_data       BLOB
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_T_C on HAP_DEV2.QRTZ_TRIGGERS (SCHED_NAME, CALENDAR_NAME)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_T_G on HAP_DEV2.QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_GROUP)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_T_J on HAP_DEV2.QRTZ_TRIGGERS (SCHED_NAME, JOB_NAME, JOB_GROUP)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_T_JG on HAP_DEV2.QRTZ_TRIGGERS (SCHED_NAME, JOB_GROUP)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_T_NEXT_FIRE_TIME on HAP_DEV2.QRTZ_TRIGGERS (SCHED_NAME, NEXT_FIRE_TIME)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_T_NFT_MISFIRE on HAP_DEV2.QRTZ_TRIGGERS (SCHED_NAME, MISFIRE_INSTR, NEXT_FIRE_TIME)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_T_NFT_ST on HAP_DEV2.QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_STATE, NEXT_FIRE_TIME)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_T_NFT_ST_MISFIRE on HAP_DEV2.QRTZ_TRIGGERS (SCHED_NAME, MISFIRE_INSTR, NEXT_FIRE_TIME, TRIGGER_STATE)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_T_NFT_ST_MISFIRE_GRP on HAP_DEV2.QRTZ_TRIGGERS (SCHED_NAME, MISFIRE_INSTR, NEXT_FIRE_TIME, TRIGGER_GROUP, TRIGGER_STATE)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_T_N_G_STATE on HAP_DEV2.QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_GROUP, TRIGGER_STATE)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_T_N_STATE on HAP_DEV2.QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP, TRIGGER_STATE)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_T_STATE on HAP_DEV2.QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_STATE)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
alter table HAP_DEV2.QRTZ_TRIGGERS
  add constraint QRTZ_TRIGGERS_PK primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
alter table HAP_DEV2.QRTZ_TRIGGERS
  add constraint QRTZ_TRIGGER_TO_JOBS_FK foreign key (SCHED_NAME, JOB_NAME, JOB_GROUP)
  references HAP_DEV2.QRTZ_JOB_DETAILS (SCHED_NAME, JOB_NAME, JOB_GROUP);

prompt
prompt Creating table QRTZ_BLOB_TRIGGERS
prompt =================================
prompt
create table HAP_DEV2.QRTZ_BLOB_TRIGGERS
(
  sched_name    VARCHAR2(120) not null,
  trigger_name  VARCHAR2(200) not null,
  trigger_group VARCHAR2(200) not null,
  blob_data     BLOB
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
alter table HAP_DEV2.QRTZ_BLOB_TRIGGERS
  add constraint QRTZ_BLOB_TRIG_PK primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
alter table HAP_DEV2.QRTZ_BLOB_TRIGGERS
  add constraint QRTZ_BLOB_TRIG_TO_TRIG_FK foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  references HAP_DEV2.QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table QRTZ_CALENDARS
prompt =============================
prompt
create table HAP_DEV2.QRTZ_CALENDARS
(
  sched_name    VARCHAR2(120) not null,
  calendar_name VARCHAR2(200) not null,
  calendar      BLOB not null
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
alter table HAP_DEV2.QRTZ_CALENDARS
  add constraint QRTZ_CALENDARS_PK primary key (SCHED_NAME, CALENDAR_NAME)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table QRTZ_CRON_TRIGGERS
prompt =================================
prompt
create table HAP_DEV2.QRTZ_CRON_TRIGGERS
(
  sched_name      VARCHAR2(120) not null,
  trigger_name    VARCHAR2(200) not null,
  trigger_group   VARCHAR2(200) not null,
  cron_expression VARCHAR2(120) not null,
  time_zone_id    VARCHAR2(80)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
alter table HAP_DEV2.QRTZ_CRON_TRIGGERS
  add constraint QRTZ_CRON_TRIG_PK primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
alter table HAP_DEV2.QRTZ_CRON_TRIGGERS
  add constraint QRTZ_CRON_TRIG_TO_TRIG_FK foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  references HAP_DEV2.QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table QRTZ_FIRED_TRIGGERS
prompt ==================================
prompt
create table HAP_DEV2.QRTZ_FIRED_TRIGGERS
(
  sched_name        VARCHAR2(120) not null,
  entry_id          VARCHAR2(95) not null,
  trigger_name      VARCHAR2(200) not null,
  trigger_group     VARCHAR2(200) not null,
  instance_name     VARCHAR2(200) not null,
  fired_time        NUMBER(13) not null,
  sched_time        NUMBER(13) not null,
  priority          NUMBER(13) not null,
  state             VARCHAR2(16) not null,
  job_name          VARCHAR2(200),
  job_group         VARCHAR2(200),
  is_nonconcurrent  VARCHAR2(1),
  requests_recovery VARCHAR2(1)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_FT_INST_JOB_REQ_RCVRY on HAP_DEV2.QRTZ_FIRED_TRIGGERS (SCHED_NAME, INSTANCE_NAME, REQUESTS_RECOVERY)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_FT_JG on HAP_DEV2.QRTZ_FIRED_TRIGGERS (SCHED_NAME, JOB_GROUP)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_FT_J_G on HAP_DEV2.QRTZ_FIRED_TRIGGERS (SCHED_NAME, JOB_NAME, JOB_GROUP)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_FT_TG on HAP_DEV2.QRTZ_FIRED_TRIGGERS (SCHED_NAME, TRIGGER_GROUP)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_FT_TRIG_INST_NAME on HAP_DEV2.QRTZ_FIRED_TRIGGERS (SCHED_NAME, INSTANCE_NAME)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create index HAP_DEV2.IDX_QRTZ_FT_T_G on HAP_DEV2.QRTZ_FIRED_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
alter table HAP_DEV2.QRTZ_FIRED_TRIGGERS
  add constraint QRTZ_FIRED_TRIGGER_PK primary key (SCHED_NAME, ENTRY_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table QRTZ_LOCKS
prompt =========================
prompt
create table HAP_DEV2.QRTZ_LOCKS
(
  sched_name VARCHAR2(120) not null,
  lock_name  VARCHAR2(40) not null
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAP_DEV2.QRTZ_LOCKS
  add constraint QRTZ_LOCKS_PK primary key (SCHED_NAME, LOCK_NAME)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QRTZ_PAUSED_TRIGGER_GRPS
prompt =======================================
prompt
create table HAP_DEV2.QRTZ_PAUSED_TRIGGER_GRPS
(
  sched_name    VARCHAR2(120) not null,
  trigger_group VARCHAR2(200) not null
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
alter table HAP_DEV2.QRTZ_PAUSED_TRIGGER_GRPS
  add constraint QRTZ_PAUSED_TRIG_GRPS_PK primary key (SCHED_NAME, TRIGGER_GROUP)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table QRTZ_SCHEDULER_STATE
prompt ===================================
prompt
create table HAP_DEV2.QRTZ_SCHEDULER_STATE
(
  sched_name        VARCHAR2(120) not null,
  instance_name     VARCHAR2(200) not null,
  last_checkin_time NUMBER(13) not null,
  checkin_interval  NUMBER(13) not null
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAP_DEV2.QRTZ_SCHEDULER_STATE
  add constraint QRTZ_SCHEDULER_STATE_PK primary key (SCHED_NAME, INSTANCE_NAME)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QRTZ_SIMPLE_TRIGGERS
prompt ===================================
prompt
create table HAP_DEV2.QRTZ_SIMPLE_TRIGGERS
(
  sched_name      VARCHAR2(120) not null,
  trigger_name    VARCHAR2(200) not null,
  trigger_group   VARCHAR2(200) not null,
  repeat_count    NUMBER(7) not null,
  repeat_interval NUMBER(12) not null,
  times_triggered NUMBER(10) not null
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
alter table HAP_DEV2.QRTZ_SIMPLE_TRIGGERS
  add constraint QRTZ_SIMPLE_TRIG_PK primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
alter table HAP_DEV2.QRTZ_SIMPLE_TRIGGERS
  add constraint QRTZ_SIMPLE_TRIG_TO_TRIG_FK foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  references HAP_DEV2.QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table QRTZ_SIMPROP_TRIGGERS
prompt ====================================
prompt
create table HAP_DEV2.QRTZ_SIMPROP_TRIGGERS
(
  sched_name    VARCHAR2(120) not null,
  trigger_name  VARCHAR2(200) not null,
  trigger_group VARCHAR2(200) not null,
  str_prop_1    VARCHAR2(512),
  str_prop_2    VARCHAR2(512),
  str_prop_3    VARCHAR2(512),
  int_prop_1    NUMBER(10),
  int_prop_2    NUMBER(10),
  long_prop_1   NUMBER(13),
  long_prop_2   NUMBER(13),
  dec_prop_1    NUMBER(13,4),
  dec_prop_2    NUMBER(13,4),
  bool_prop_1   VARCHAR2(1),
  bool_prop_2   VARCHAR2(1)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
alter table HAP_DEV2.QRTZ_SIMPROP_TRIGGERS
  add constraint QRTZ_SIMPROP_TRIG_PK primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
alter table HAP_DEV2.QRTZ_SIMPROP_TRIGGERS
  add constraint QRTZ_SIMPROP_TRIG_TO_TRIG_FK foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  references HAP_DEV2.QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table SYS_ACCOUNT_RETRIEVE
prompt ===================================
prompt
create table HAP_DEV2.SYS_ACCOUNT_RETRIEVE
(
  account_id            NUMBER(20),
  retrieve_type         NVARCHAR2(30),
  retrieve_date         DATE,
  object_version_number NUMBER,
  request_id            NUMBER(20),
  program_id            NUMBER(20),
  creation_date         DATE,
  created_by            NUMBER,
  last_updated_by       NUMBER,
  last_update_date      DATE,
  last_update_login     NUMBER
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column HAP_DEV2.SYS_ACCOUNT_RETRIEVE.account_id
  is '其他表做外键';
comment on column HAP_DEV2.SYS_ACCOUNT_RETRIEVE.retrieve_date
  is '时间';

prompt
prompt Creating table SYS_ATTACHMENT
prompt =============================
prompt
create table HAP_DEV2.SYS_ATTACHMENT
(
  attachment_id         NUMBER(20) not null,
  category_id           NUMBER(20),
  name                  NVARCHAR2(40),
  source_type           NVARCHAR2(30),
  source_key            NVARCHAR2(30),
  status                NVARCHAR2(1),
  start_active_date     DATE,
  end_active_date       DATE,
  object_version_number NUMBER,
  request_id            NUMBER(20),
  program_id            NUMBER(20),
  creation_date         DATE,
  created_by            NUMBER,
  last_updated_by       NUMBER,
  last_update_date      DATE,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30 CHAR),
  attribute1            VARCHAR2(240 CHAR),
  attribute2            VARCHAR2(240 CHAR),
  attribute3            VARCHAR2(240 CHAR),
  attribute4            VARCHAR2(240 CHAR),
  attribute5            VARCHAR2(240 CHAR),
  attribute6            VARCHAR2(240 CHAR),
  attribute7            VARCHAR2(240 CHAR),
  attribute8            VARCHAR2(240 CHAR),
  attribute9            VARCHAR2(240 CHAR),
  attribute10           VARCHAR2(240 CHAR),
  attribute11           VARCHAR2(240 CHAR),
  attribute12           VARCHAR2(240 CHAR),
  attribute13           VARCHAR2(240 CHAR),
  attribute14           VARCHAR2(240 CHAR),
  attribute15           VARCHAR2(240 CHAR)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column HAP_DEV2.SYS_ATTACHMENT.attachment_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_ATTACHMENT.category_id
  is '分类ID';
comment on column HAP_DEV2.SYS_ATTACHMENT.start_active_date
  is '开始生效日期';
comment on column HAP_DEV2.SYS_ATTACHMENT.end_active_date
  is '失效时间';
comment on column HAP_DEV2.SYS_ATTACHMENT.object_version_number
  is '行版本号，用来处理锁';
comment on column HAP_DEV2.SYS_ATTACHMENT.request_id
  is '对Record最后一次操作的系统内部请求id';
comment on column HAP_DEV2.SYS_ATTACHMENT.program_id
  is '对Record最后一次操作的系统内部程序id';
create index HAP_DEV2.SYS_ATTACHMENT_N1 on HAP_DEV2.SYS_ATTACHMENT (CATEGORY_ID)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index HAP_DEV2.SYS_ATTACHMENT_N2 on HAP_DEV2.SYS_ATTACHMENT (SOURCE_TYPE, SOURCE_KEY)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAP_DEV2.SYS_ATTACHMENT
  add primary key (ATTACHMENT_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_ATTACH_CATEGORY_B
prompt ====================================
prompt
create table HAP_DEV2.SYS_ATTACH_CATEGORY_B
(
  category_id           NUMBER(20) not null,
  category_name         NVARCHAR2(40),
  leaf_flag             NVARCHAR2(1),
  description           NVARCHAR2(240),
  status                NVARCHAR2(1),
  parent_category_id    NUMBER(20),
  path                  VARCHAR2(200 CHAR),
  source_type           NVARCHAR2(30),
  allowed_file_type     NVARCHAR2(30),
  allowed_file_size     NUMBER,
  category_path         NVARCHAR2(255),
  is_unique             NVARCHAR2(1),
  object_version_number NUMBER,
  request_id            NUMBER(20),
  program_id            NUMBER(20),
  creation_date         DATE,
  created_by            NUMBER,
  last_updated_by       NUMBER,
  last_update_date      DATE,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30 CHAR),
  attribute1            VARCHAR2(240 CHAR),
  attribute2            VARCHAR2(240 CHAR),
  attribute3            VARCHAR2(240 CHAR),
  attribute4            VARCHAR2(240 CHAR),
  attribute5            VARCHAR2(240 CHAR),
  attribute6            VARCHAR2(240 CHAR),
  attribute7            VARCHAR2(240 CHAR),
  attribute8            VARCHAR2(240 CHAR),
  attribute9            VARCHAR2(240 CHAR),
  attribute10           VARCHAR2(240 CHAR),
  attribute11           VARCHAR2(240 CHAR),
  attribute12           VARCHAR2(240 CHAR),
  attribute13           VARCHAR2(240 CHAR),
  attribute14           VARCHAR2(240 CHAR),
  attribute15           VARCHAR2(240 CHAR)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column HAP_DEV2.SYS_ATTACH_CATEGORY_B.path
  is '层级路径';
alter table HAP_DEV2.SYS_ATTACH_CATEGORY_B
  add primary key (CATEGORY_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_ATTACH_CATEGORY_TL
prompt =====================================
prompt
create table HAP_DEV2.SYS_ATTACH_CATEGORY_TL
(
  category_id           NUMBER(20) not null,
  category_name         NVARCHAR2(40),
  description           NVARCHAR2(240),
  lang                  NVARCHAR2(10) not null,
  object_version_number NUMBER,
  request_id            NUMBER(20),
  program_id            NUMBER(20),
  creation_date         DATE,
  created_by            NUMBER,
  last_updated_by       NUMBER,
  last_update_date      DATE,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30 CHAR),
  attribute1            VARCHAR2(240 CHAR),
  attribute2            VARCHAR2(240 CHAR),
  attribute3            VARCHAR2(240 CHAR),
  attribute4            VARCHAR2(240 CHAR),
  attribute5            VARCHAR2(240 CHAR),
  attribute6            VARCHAR2(240 CHAR),
  attribute7            VARCHAR2(240 CHAR),
  attribute8            VARCHAR2(240 CHAR),
  attribute9            VARCHAR2(240 CHAR),
  attribute10           VARCHAR2(240 CHAR),
  attribute11           VARCHAR2(240 CHAR),
  attribute12           VARCHAR2(240 CHAR),
  attribute13           VARCHAR2(240 CHAR),
  attribute14           VARCHAR2(240 CHAR),
  attribute15           VARCHAR2(240 CHAR)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column HAP_DEV2.SYS_ATTACH_CATEGORY_TL.category_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_ATTACH_CATEGORY_TL.object_version_number
  is '行版本号，用来处理锁';
comment on column HAP_DEV2.SYS_ATTACH_CATEGORY_TL.request_id
  is '对Record最后一次操作的系统内部请求id';
comment on column HAP_DEV2.SYS_ATTACH_CATEGORY_TL.program_id
  is '对Record最后一次操作的系统内部程序id';
alter table HAP_DEV2.SYS_ATTACH_CATEGORY_TL
  add primary key (CATEGORY_ID, LANG)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_CODE_B
prompt =========================
prompt
create table HAP_DEV2.SYS_CODE_B
(
  code_id               NUMBER not null,
  code                  VARCHAR2(30) not null,
  description           VARCHAR2(240),
  object_version_number NUMBER default 1 not null,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.SYS_CODE_B
  is '快码类型表';
comment on column HAP_DEV2.SYS_CODE_B.code_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_CODE_B.code
  is '快码类型';
comment on column HAP_DEV2.SYS_CODE_B.description
  is '快码类型描述';
create unique index HAP_DEV2.SYS_CODE_B_U1 on HAP_DEV2.SYS_CODE_B (CODE)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAP_DEV2.SYS_CODE_B
  add primary key (CODE_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_CODE_TL
prompt ==========================
prompt
create table HAP_DEV2.SYS_CODE_TL
(
  code_id               NUMBER not null,
  lang                  VARCHAR2(10) not null,
  description           VARCHAR2(240),
  object_version_number NUMBER default 1 not null,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.SYS_CODE_TL
  is '快码类型表(多语言)';
comment on column HAP_DEV2.SYS_CODE_TL.code_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_CODE_TL.lang
  is '语言';
comment on column HAP_DEV2.SYS_CODE_TL.description
  is '快码描述';
alter table HAP_DEV2.SYS_CODE_TL
  add primary key (CODE_ID, LANG)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_CODE_VALUE_B
prompt ===============================
prompt
create table HAP_DEV2.SYS_CODE_VALUE_B
(
  code_value_id         NUMBER not null,
  code_id               NUMBER not null,
  value                 VARCHAR2(150) not null,
  meaning               VARCHAR2(150),
  description           VARCHAR2(240),
  object_version_number NUMBER default 1 not null,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.SYS_CODE_VALUE_B
  is '快码值表';
comment on column HAP_DEV2.SYS_CODE_VALUE_B.code_value_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_CODE_VALUE_B.value
  is '快码值';
comment on column HAP_DEV2.SYS_CODE_VALUE_B.meaning
  is '快码意思';
comment on column HAP_DEV2.SYS_CODE_VALUE_B.description
  is '快码描述';
create unique index HAP_DEV2.SYS_CODE_VALUE_B_U1 on HAP_DEV2.SYS_CODE_VALUE_B (CODE_ID, VALUE)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAP_DEV2.SYS_CODE_VALUE_B
  add primary key (CODE_VALUE_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_CODE_VALUE_TL
prompt ================================
prompt
create table HAP_DEV2.SYS_CODE_VALUE_TL
(
  code_value_id         NUMBER not null,
  lang                  VARCHAR2(10) not null,
  meaning               VARCHAR2(150),
  description           VARCHAR2(240),
  object_version_number NUMBER default 1 not null,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.SYS_CODE_VALUE_TL
  is '快码值表(多语言)';
comment on column HAP_DEV2.SYS_CODE_VALUE_TL.code_value_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_CODE_VALUE_TL.lang
  is '语言';
comment on column HAP_DEV2.SYS_CODE_VALUE_TL.meaning
  is '快码意思';
comment on column HAP_DEV2.SYS_CODE_VALUE_TL.description
  is '快码描述';
alter table HAP_DEV2.SYS_CODE_VALUE_TL
  add primary key (CODE_VALUE_ID, LANG)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_FILE
prompt =======================
prompt
create table HAP_DEV2.SYS_FILE
(
  file_id               NUMBER(20) not null,
  attachment_id         NUMBER(20),
  file_name             NVARCHAR2(255),
  file_path             NVARCHAR2(255),
  file_size             NUMBER,
  file_type             NVARCHAR2(240),
  upload_date           DATE,
  object_version_number NUMBER,
  request_id            NUMBER(20),
  program_id            NUMBER(20),
  creation_date         DATE,
  created_by            NUMBER,
  last_updated_by       NUMBER,
  last_update_date      DATE,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30 CHAR),
  attribute1            VARCHAR2(240 CHAR),
  attribute2            VARCHAR2(240 CHAR),
  attribute3            VARCHAR2(240 CHAR),
  attribute4            VARCHAR2(240 CHAR),
  attribute5            VARCHAR2(240 CHAR),
  attribute6            VARCHAR2(240 CHAR),
  attribute7            VARCHAR2(240 CHAR),
  attribute8            VARCHAR2(240 CHAR),
  attribute9            VARCHAR2(240 CHAR),
  attribute10           VARCHAR2(240 CHAR),
  attribute11           VARCHAR2(240 CHAR),
  attribute12           VARCHAR2(240 CHAR),
  attribute13           VARCHAR2(240 CHAR),
  attribute14           VARCHAR2(240 CHAR),
  attribute15           VARCHAR2(240 CHAR)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column HAP_DEV2.SYS_FILE.file_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_FILE.attachment_id
  is '附件ID';
comment on column HAP_DEV2.SYS_FILE.file_size
  is '文件大小';
comment on column HAP_DEV2.SYS_FILE.upload_date
  is '上传时间';
comment on column HAP_DEV2.SYS_FILE.object_version_number
  is '行版本号，用来处理锁';
comment on column HAP_DEV2.SYS_FILE.request_id
  is '对Record最后一次操作的系统内部请求id';
comment on column HAP_DEV2.SYS_FILE.program_id
  is '对Record最后一次操作的系统内部程序id';
alter table HAP_DEV2.SYS_FILE
  add constraint SYS_FILE_PK primary key (FILE_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_FUNCTION_B
prompt =============================
prompt
create table HAP_DEV2.SYS_FUNCTION_B
(
  function_id           NUMBER not null,
  module_code           VARCHAR2(30),
  function_icon         VARCHAR2(100),
  function_code         VARCHAR2(30) not null,
  function_name         VARCHAR2(150),
  function_description  VARCHAR2(240),
  resource_id           NUMBER,
  type                  VARCHAR2(30),
  parent_function_id    NUMBER,
  enabled_flag          VARCHAR2(1) default 'Y' not null,
  function_sequence     NUMBER default 1 not null,
  object_version_number NUMBER default 1,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.SYS_FUNCTION_B
  is '功能表';
comment on column HAP_DEV2.SYS_FUNCTION_B.function_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_FUNCTION_B.module_code
  is '模块编码';
comment on column HAP_DEV2.SYS_FUNCTION_B.function_icon
  is '功能图标';
comment on column HAP_DEV2.SYS_FUNCTION_B.function_code
  is '功能编码';
comment on column HAP_DEV2.SYS_FUNCTION_B.function_name
  is '功能名称';
comment on column HAP_DEV2.SYS_FUNCTION_B.function_description
  is '描述';
comment on column HAP_DEV2.SYS_FUNCTION_B.resource_id
  is '功能入口';
comment on column HAP_DEV2.SYS_FUNCTION_B.type
  is '功能类型';
comment on column HAP_DEV2.SYS_FUNCTION_B.parent_function_id
  is '父功能';
comment on column HAP_DEV2.SYS_FUNCTION_B.enabled_flag
  is '是否启用';
comment on column HAP_DEV2.SYS_FUNCTION_B.function_sequence
  is '排序号';
create index HAP_DEV2.SYS_FUNCTION_B_N1 on HAP_DEV2.SYS_FUNCTION_B (PARENT_FUNCTION_ID)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index HAP_DEV2.SYS_FUNCTION_B_U1 on HAP_DEV2.SYS_FUNCTION_B (FUNCTION_CODE)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAP_DEV2.SYS_FUNCTION_B
  add constraint SYS_FUNCTION_B_PK primary key (FUNCTION_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_FUNCTION_RESOURCE
prompt ====================================
prompt
create table HAP_DEV2.SYS_FUNCTION_RESOURCE
(
  func_src_id           NUMBER not null,
  function_id           NUMBER not null,
  resource_id           NUMBER not null,
  object_version_number NUMBER default 1 not null,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.SYS_FUNCTION_RESOURCE
  is '功能资源关联表';
comment on column HAP_DEV2.SYS_FUNCTION_RESOURCE.func_src_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_FUNCTION_RESOURCE.function_id
  is '外键，功能 ID';
comment on column HAP_DEV2.SYS_FUNCTION_RESOURCE.request_id
  is '外键，资源 ID';
create unique index HAP_DEV2.SYS_FUNCTION_RESOURCE_U1 on HAP_DEV2.SYS_FUNCTION_RESOURCE (FUNCTION_ID, RESOURCE_ID)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAP_DEV2.SYS_FUNCTION_RESOURCE
  add constraint SYS_FUNCTION_RESOURCE_PK primary key (FUNC_SRC_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_FUNCTION_TL
prompt ==============================
prompt
create table HAP_DEV2.SYS_FUNCTION_TL
(
  function_id           NUMBER not null,
  lang                  VARCHAR2(10) not null,
  function_name         VARCHAR2(150),
  function_description  VARCHAR2(240),
  object_version_number NUMBER default 1,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.SYS_FUNCTION_TL
  is '功能表（多语言）';
comment on column HAP_DEV2.SYS_FUNCTION_TL.function_id
  is '功能ID';
comment on column HAP_DEV2.SYS_FUNCTION_TL.lang
  is '语言';
comment on column HAP_DEV2.SYS_FUNCTION_TL.function_name
  is '功能名';
comment on column HAP_DEV2.SYS_FUNCTION_TL.function_description
  is '功能描述';
alter table HAP_DEV2.SYS_FUNCTION_TL
  add constraint SYS_FUNCTION_TL_PK primary key (FUNCTION_ID, LANG)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_JOB_RUNNING_INFO
prompt ===================================
prompt
create table HAP_DEV2.SYS_JOB_RUNNING_INFO
(
  job_running_info_id   NUMBER(20) not null,
  job_name              VARCHAR2(255),
  job_group             VARCHAR2(255),
  job_result            VARCHAR2(255),
  job_status            VARCHAR2(255),
  job_status_message    VARCHAR2(4000),
  trigger_name          VARCHAR2(255),
  trigger_group         VARCHAR2(255),
  previous_fire_time    DATE,
  fire_time             DATE,
  next_fire_time        DATE,
  refire_count          NUMBER(20) default 0,
  fire_instance_id      VARCHAR2(255),
  scheduler_instance_id VARCHAR2(255),
  scheduled_fire_time   DATE,
  execution_summary     VARCHAR2(4000),
  object_version_number NUMBER default 1 not null,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
alter table HAP_DEV2.SYS_JOB_RUNNING_INFO
  add constraint SYS_JOB_RUNING_INFO_PK primary key (JOB_RUNNING_INFO_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SYS_LANG_B
prompt =========================
prompt
create table HAP_DEV2.SYS_LANG_B
(
  lang_code             VARCHAR2(10) not null,
  base_lang             VARCHAR2(10),
  description           VARCHAR2(240),
  object_version_number NUMBER default 1 not null,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.SYS_LANG_B
  is '语言表';
comment on column HAP_DEV2.SYS_LANG_B.lang_code
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_LANG_B.base_lang
  is '基语言';
comment on column HAP_DEV2.SYS_LANG_B.description
  is '描述';
alter table HAP_DEV2.SYS_LANG_B
  add constraint SYS_LANG_B_PK primary key (LANG_CODE)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_LOV
prompt ======================
prompt
create table HAP_DEV2.SYS_LOV
(
  lov_id                NUMBER not null,
  code                  VARCHAR2(80) not null,
  description           VARCHAR2(240),
  sql_id                VARCHAR2(255) not null,
  value_field           VARCHAR2(80) not null,
  text_field            VARCHAR2(80) not null,
  title                 VARCHAR2(255),
  width                 NUMBER,
  height                NUMBER,
  placeholder           VARCHAR2(80),
  delay_load            VARCHAR2(1) default 'N' not null,
  need_query_param      VARCHAR2(1) default 'N' not null,
  editable              VARCHAR2(1) default 'N' not null,
  can_popup             VARCHAR2(1) default 'Y' not null,
  object_version_number NUMBER default 1 not null,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.SYS_LOV
  is '通用lov配置';
comment on column HAP_DEV2.SYS_LOV.lov_id
  is '表ID，主键';
comment on column HAP_DEV2.SYS_LOV.code
  is 'LOV的code';
comment on column HAP_DEV2.SYS_LOV.description
  is '描述';
comment on column HAP_DEV2.SYS_LOV.sql_id
  is 'SQL ID';
comment on column HAP_DEV2.SYS_LOV.value_field
  is 'VALUE_FIELD';
comment on column HAP_DEV2.SYS_LOV.text_field
  is 'TEXT_FIELD';
comment on column HAP_DEV2.SYS_LOV.title
  is '标题';
comment on column HAP_DEV2.SYS_LOV.width
  is '宽度';
comment on column HAP_DEV2.SYS_LOV.height
  is '高度';
comment on column HAP_DEV2.SYS_LOV.placeholder
  is '提示';
comment on column HAP_DEV2.SYS_LOV.delay_load
  is '是否延迟加载';
comment on column HAP_DEV2.SYS_LOV.need_query_param
  is '是否需要查询条件';
comment on column HAP_DEV2.SYS_LOV.editable
  is '是否可编辑';
comment on column HAP_DEV2.SYS_LOV.can_popup
  is '是否可弹出';
create unique index HAP_DEV2.SYS_LOV_U1 on HAP_DEV2.SYS_LOV (CODE)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAP_DEV2.SYS_LOV
  add constraint SYS_LOV_PK primary key (LOV_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_LOV_ITEM
prompt ===========================
prompt
create table HAP_DEV2.SYS_LOV_ITEM
(
  lov_item_id                 NUMBER not null,
  lov_id                      NUMBER not null,
  display                     VARCHAR2(255) not null,
  is_autocomplete             VARCHAR2(1) default 'N' not null,
  condition_field             VARCHAR2(1) default 'N' not null,
  condition_field_width       NUMBER,
  condition_field_type        VARCHAR2(30),
  condition_field_name        VARCHAR2(80),
  condition_field_newline     VARCHAR2(1),
  condition_field_select_code VARCHAR2(80),
  condition_field_lov_code    VARCHAR2(80),
  condition_field_sequence    NUMBER,
  condition_field_select_url  VARCHAR2(255),
  condition_field_select_vf   VARCHAR2(80),
  condition_field_select_tf   VARCHAR2(80),
  condition_field_textfield   VARCHAR2(80),
  autocomplete_field          VARCHAR2(1) default 'Y' not null,
  grid_field                  VARCHAR2(1) default 'Y' not null,
  grid_field_name             VARCHAR2(80),
  grid_field_sequence         NUMBER default 1 not null,
  grid_field_width            NUMBER,
  grid_field_align            VARCHAR2(10) default 'center',
  object_version_number       NUMBER default 1 not null,
  request_id                  NUMBER default -1,
  program_id                  NUMBER default -1,
  creation_date               DATE default sysdate not null,
  created_by                  NUMBER default -1 not null,
  last_updated_by             NUMBER default -1 not null,
  last_update_date            DATE default sysdate not null,
  last_update_login           NUMBER,
  attribute_category          VARCHAR2(30),
  attribute1                  VARCHAR2(240),
  attribute2                  VARCHAR2(240),
  attribute3                  VARCHAR2(240),
  attribute4                  VARCHAR2(240),
  attribute5                  VARCHAR2(240),
  attribute6                  VARCHAR2(240),
  attribute7                  VARCHAR2(240),
  attribute8                  VARCHAR2(240),
  attribute9                  VARCHAR2(240),
  attribute10                 VARCHAR2(240),
  attribute11                 VARCHAR2(240),
  attribute12                 VARCHAR2(240),
  attribute13                 VARCHAR2(240),
  attribute14                 VARCHAR2(240),
  attribute15                 VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column HAP_DEV2.SYS_LOV_ITEM.lov_item_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_LOV_ITEM.lov_id
  is '头表ID';
comment on column HAP_DEV2.SYS_LOV_ITEM.display
  is '描述字段';
comment on column HAP_DEV2.SYS_LOV_ITEM.is_autocomplete
  is '是否autocomplete';
comment on column HAP_DEV2.SYS_LOV_ITEM.condition_field
  is '是否查询字段';
comment on column HAP_DEV2.SYS_LOV_ITEM.condition_field_width
  is '查询字段宽度';
comment on column HAP_DEV2.SYS_LOV_ITEM.condition_field_type
  is '查询字段组件类型';
comment on column HAP_DEV2.SYS_LOV_ITEM.condition_field_name
  is '查询字段名';
comment on column HAP_DEV2.SYS_LOV_ITEM.condition_field_newline
  is '查询字段新一行';
comment on column HAP_DEV2.SYS_LOV_ITEM.condition_field_select_code
  is '查询字段combobox对应的快码值';
comment on column HAP_DEV2.SYS_LOV_ITEM.condition_field_lov_code
  is '查询字段lov对应的通用lov编码';
comment on column HAP_DEV2.SYS_LOV_ITEM.condition_field_sequence
  is '查询字段排序号';
comment on column HAP_DEV2.SYS_LOV_ITEM.condition_field_select_url
  is '查询字段combobox对应的URL';
comment on column HAP_DEV2.SYS_LOV_ITEM.condition_field_select_vf
  is '查询字段combobox对应的valueField';
comment on column HAP_DEV2.SYS_LOV_ITEM.condition_field_select_tf
  is '查询字段combobox对应的textField';
comment on column HAP_DEV2.SYS_LOV_ITEM.condition_field_textfield
  is '查询字段对应的textField';
comment on column HAP_DEV2.SYS_LOV_ITEM.autocomplete_field
  is 'autocomplete显示列';
comment on column HAP_DEV2.SYS_LOV_ITEM.grid_field
  is '是否显示表格列';
comment on column HAP_DEV2.SYS_LOV_ITEM.grid_field_name
  is '表格列字段名';
comment on column HAP_DEV2.SYS_LOV_ITEM.grid_field_sequence
  is '表格列排序号';
comment on column HAP_DEV2.SYS_LOV_ITEM.grid_field_width
  is '表格列宽';
comment on column HAP_DEV2.SYS_LOV_ITEM.grid_field_align
  is '表格列布局';
create index HAP_DEV2.SYS_LOV_ITEM_N1 on HAP_DEV2.SYS_LOV_ITEM (LOV_ID)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAP_DEV2.SYS_LOV_ITEM
  add constraint SYS_LOV_ITEM_PK primary key (LOV_ITEM_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_MESSAGE
prompt ==========================
prompt
create table HAP_DEV2.SYS_MESSAGE
(
  message_id            NUMBER(20) not null,
  message_type          VARCHAR2(10) not null,
  message_host          VARCHAR2(255),
  message_from          VARCHAR2(255),
  subject               VARCHAR2(255),
  content               CLOB not null,
  priority_level        VARCHAR2(25),
  send_flag             VARCHAR2(1) default 'N' not null,
  message_source        VARCHAR2(255),
  object_version_number NUMBER(20) default 1 not null,
  request_id            NUMBER(20) default -1 not null,
  program_id            NUMBER(20) default -1 not null,
  created_by            NUMBER(20) default -1 not null,
  creation_date         DATE default sysdate not null,
  last_updated_by       NUMBER(20) default -1 not null,
  last_update_date      DATE default sysdate not null,
  attribute1            VARCHAR2(255),
  attribute2            VARCHAR2(255),
  attribute3            VARCHAR2(255),
  attribute4            VARCHAR2(255),
  attribute5            VARCHAR2(255),
  attribute6            VARCHAR2(255),
  attribute7            VARCHAR2(255),
  attribute8            VARCHAR2(255),
  attribute9            VARCHAR2(255),
  attribute10           VARCHAR2(255),
  attribute11           VARCHAR2(255),
  attribute12           VARCHAR2(255),
  attribute13           VARCHAR2(255),
  attribute14           VARCHAR2(255),
  attribute15           VARCHAR2(255)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table HAP_DEV2.SYS_MESSAGE
  is '消息表';
comment on column HAP_DEV2.SYS_MESSAGE.message_id
  is '主键';
comment on column HAP_DEV2.SYS_MESSAGE.message_type
  is '信息类型,email/sms';
comment on column HAP_DEV2.SYS_MESSAGE.message_host
  is '消息服务器';
comment on column HAP_DEV2.SYS_MESSAGE.message_from
  is '消息发出人';
comment on column HAP_DEV2.SYS_MESSAGE.subject
  is '标题';
comment on column HAP_DEV2.SYS_MESSAGE.content
  is '内容';
comment on column HAP_DEV2.SYS_MESSAGE.priority_level
  is '优先级';
comment on column HAP_DEV2.SYS_MESSAGE.send_flag
  is '发送标记';
comment on column HAP_DEV2.SYS_MESSAGE.message_source
  is '消息来源';
create index HAP_DEV2.SYS_MESSAGE_N1 on HAP_DEV2.SYS_MESSAGE (MESSAGE_TYPE)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
alter table HAP_DEV2.SYS_MESSAGE
  add constraint SYS_MESSAGE_PK primary key (MESSAGE_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SYS_MESSAGE_ACCOUNT
prompt ==================================
prompt
create table HAP_DEV2.SYS_MESSAGE_ACCOUNT
(
  account_id            NUMBER(20) not null,
  account_type          VARCHAR2(50) not null,
  account_code          VARCHAR2(50) not null,
  user_name             VARCHAR2(240) not null,
  password              VARCHAR2(240) not null,
  description           VARCHAR2(240),
  object_version_number NUMBER default 1 not null,
  request_id            NUMBER default -1 not null,
  program_id            NUMBER default -1 not null,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table HAP_DEV2.SYS_MESSAGE_ACCOUNT
  is '邮件账号表';
comment on column HAP_DEV2.SYS_MESSAGE_ACCOUNT.account_id
  is '主键';
comment on column HAP_DEV2.SYS_MESSAGE_ACCOUNT.account_type
  is '账号类型';
comment on column HAP_DEV2.SYS_MESSAGE_ACCOUNT.account_code
  is '编号';
comment on column HAP_DEV2.SYS_MESSAGE_ACCOUNT.user_name
  is '用户名';
comment on column HAP_DEV2.SYS_MESSAGE_ACCOUNT.password
  is '密码';
comment on column HAP_DEV2.SYS_MESSAGE_ACCOUNT.description
  is '描述';
alter table HAP_DEV2.SYS_MESSAGE_ACCOUNT
  add constraint SYS_MESSAGE_ACCOUNT_PK primary key (ACCOUNT_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SYS_MESSAGE_ATTACHMENT
prompt =====================================
prompt
create table HAP_DEV2.SYS_MESSAGE_ATTACHMENT
(
  attachment_id         NUMBER(20) not null,
  message_id            NUMBER(20),
  file_id               NUMBER(20),
  object_version_number NUMBER(20),
  request_id            NUMBER(20),
  program_id            NUMBER(20),
  created_by            NUMBER(20),
  creation_date         DATE,
  last_updated_by       NUMBER(20),
  last_update_date      DATE,
  attribute1            VARCHAR2(255 CHAR),
  attribute2            VARCHAR2(255 CHAR),
  attribute3            VARCHAR2(255 CHAR),
  attribute4            VARCHAR2(255 CHAR),
  attribute5            VARCHAR2(255 CHAR),
  attribute6            VARCHAR2(255 CHAR),
  attribute7            VARCHAR2(255 CHAR),
  attribute8            VARCHAR2(255 CHAR),
  attribute9            VARCHAR2(255 CHAR),
  attribute10           VARCHAR2(255 CHAR),
  attribute11           VARCHAR2(255 CHAR),
  attribute12           VARCHAR2(255 CHAR),
  attribute13           VARCHAR2(255 CHAR),
  attribute14           VARCHAR2(255 CHAR),
  attribute15           VARCHAR2(255 CHAR)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column HAP_DEV2.SYS_MESSAGE_ATTACHMENT.attachment_id
  is '主键';
comment on column HAP_DEV2.SYS_MESSAGE_ATTACHMENT.message_id
  is '消息id';
comment on column HAP_DEV2.SYS_MESSAGE_ATTACHMENT.file_id
  is '附件id';
create index HAP_DEV2.SYS_MESSAGE_ATTACHMENT_N1 on HAP_DEV2.SYS_MESSAGE_ATTACHMENT (MESSAGE_ID)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create index HAP_DEV2.SYS_MESSAGE_ATTACHMENT_N2 on HAP_DEV2.SYS_MESSAGE_ATTACHMENT (FILE_ID)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
alter table HAP_DEV2.SYS_MESSAGE_ATTACHMENT
  add constraint SYS_MESSAGE_ATTACHMENT_PK primary key (ATTACHMENT_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SYS_MESSAGE_EMAIL_ACCOUNT
prompt ========================================
prompt
create table HAP_DEV2.SYS_MESSAGE_EMAIL_ACCOUNT
(
  account_id            NUMBER(20) not null,
  account_code          NVARCHAR2(50),
  config_id             NUMBER(20),
  user_name             NVARCHAR2(240),
  password              NVARCHAR2(240),
  description           NVARCHAR2(240),
  object_version_number NUMBER,
  request_id            NUMBER(20),
  program_id            NUMBER(20),
  creation_date         DATE,
  created_by            NUMBER,
  last_updated_by       NUMBER,
  last_update_date      DATE,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30 CHAR),
  attribute1            VARCHAR2(240 CHAR),
  attribute2            VARCHAR2(240 CHAR),
  attribute3            VARCHAR2(240 CHAR),
  attribute4            VARCHAR2(240 CHAR),
  attribute5            VARCHAR2(240 CHAR),
  attribute6            VARCHAR2(240 CHAR),
  attribute7            VARCHAR2(240 CHAR),
  attribute8            VARCHAR2(240 CHAR),
  attribute9            VARCHAR2(240 CHAR),
  attribute10           VARCHAR2(240 CHAR),
  attribute11           VARCHAR2(240 CHAR),
  attribute12           VARCHAR2(240 CHAR),
  attribute13           VARCHAR2(240 CHAR),
  attribute14           VARCHAR2(240 CHAR),
  attribute15           VARCHAR2(240 CHAR)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index HAP_DEV2.SYS_MESSAGE_EMAIL_ACCOUNT_U1 on HAP_DEV2.SYS_MESSAGE_EMAIL_ACCOUNT (ACCOUNT_CODE)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAP_DEV2.SYS_MESSAGE_EMAIL_ACCOUNT
  add constraint SYS_MESSAGE_EMAIL_ACCOUNT_PK primary key (ACCOUNT_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_MESSAGE_EMAIL_CONFIG
prompt =======================================
prompt
create table HAP_DEV2.SYS_MESSAGE_EMAIL_CONFIG
(
  config_id             NUMBER(20) not null,
  config_code           NVARCHAR2(50),
  host                  NVARCHAR2(50),
  port                  NVARCHAR2(10),
  try_times             NUMBER,
  description           NVARCHAR2(240),
  use_white_list        NVARCHAR2(1),
  user_name             NVARCHAR2(240),
  password              NVARCHAR2(240),
  enable                NVARCHAR2(1),
  object_version_number NUMBER,
  request_id            NUMBER(20),
  program_id            NUMBER(20),
  creation_date         DATE,
  created_by            NUMBER,
  last_updated_by       NUMBER,
  last_update_date      DATE,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30 CHAR),
  attribute1            VARCHAR2(240 CHAR),
  attribute2            VARCHAR2(240 CHAR),
  attribute3            VARCHAR2(240 CHAR),
  attribute4            VARCHAR2(240 CHAR),
  attribute5            VARCHAR2(240 CHAR),
  attribute6            VARCHAR2(240 CHAR),
  attribute7            VARCHAR2(240 CHAR),
  attribute8            VARCHAR2(240 CHAR),
  attribute9            VARCHAR2(240 CHAR),
  attribute10           VARCHAR2(240 CHAR),
  attribute11           VARCHAR2(240 CHAR),
  attribute12           VARCHAR2(240 CHAR),
  attribute13           VARCHAR2(240 CHAR),
  attribute14           VARCHAR2(240 CHAR),
  attribute15           VARCHAR2(240 CHAR)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column HAP_DEV2.SYS_MESSAGE_EMAIL_CONFIG.config_id
  is '主键';
comment on column HAP_DEV2.SYS_MESSAGE_EMAIL_CONFIG.try_times
  is '重试次数';
comment on column HAP_DEV2.SYS_MESSAGE_EMAIL_CONFIG.object_version_number
  is 'Record的版本号，每发生update则自增';
comment on column HAP_DEV2.SYS_MESSAGE_EMAIL_CONFIG.request_id
  is '对Record最后一次操作的系统内部请求id';
comment on column HAP_DEV2.SYS_MESSAGE_EMAIL_CONFIG.program_id
  is '对Record最后一次操作的系统内部程序id';
create unique index HAP_DEV2.SYS_MESSAGE_EMAIL_CONFIG_U1 on HAP_DEV2.SYS_MESSAGE_EMAIL_CONFIG (CONFIG_CODE)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAP_DEV2.SYS_MESSAGE_EMAIL_CONFIG
  add constraint SYS_MESSAGE_EMAIL_CONFIG_PK primary key (CONFIG_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_MESSAGE_EMAIL_WHITE_LT
prompt =========================================
prompt
create table HAP_DEV2.SYS_MESSAGE_EMAIL_WHITE_LT
(
  id                    NUMBER(20) not null,
  address               VARCHAR2(240 CHAR),
  config_id             NUMBER(20),
  description           VARCHAR2(240 CHAR),
  object_version_number NUMBER,
  request_id            NUMBER(20),
  program_id            NUMBER(20),
  creation_date         DATE,
  created_by            NUMBER,
  last_updated_by       NUMBER,
  last_update_date      DATE,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30 CHAR),
  attribute1            VARCHAR2(240 CHAR),
  attribute2            VARCHAR2(240 CHAR),
  attribute3            VARCHAR2(240 CHAR),
  attribute4            VARCHAR2(240 CHAR),
  attribute5            VARCHAR2(240 CHAR),
  attribute6            VARCHAR2(240 CHAR),
  attribute7            VARCHAR2(240 CHAR),
  attribute8            VARCHAR2(240 CHAR),
  attribute9            VARCHAR2(240 CHAR),
  attribute10           VARCHAR2(240 CHAR),
  attribute11           VARCHAR2(240 CHAR),
  attribute12           VARCHAR2(240 CHAR),
  attribute13           VARCHAR2(240 CHAR),
  attribute14           VARCHAR2(240 CHAR),
  attribute15           VARCHAR2(240 CHAR)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column HAP_DEV2.SYS_MESSAGE_EMAIL_WHITE_LT.id
  is '主键';
comment on column HAP_DEV2.SYS_MESSAGE_EMAIL_WHITE_LT.address
  is '白名单地址';
comment on column HAP_DEV2.SYS_MESSAGE_EMAIL_WHITE_LT.config_id
  is '邮箱配置id';
comment on column HAP_DEV2.SYS_MESSAGE_EMAIL_WHITE_LT.description
  is '描述';
alter table HAP_DEV2.SYS_MESSAGE_EMAIL_WHITE_LT
  add constraint SYS_MESSAGE_EMAIL_WHITE_LT_PK primary key (ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SYS_MESSAGE_RECEIVER
prompt ===================================
prompt
create table HAP_DEV2.SYS_MESSAGE_RECEIVER
(
  receiver_id           NUMBER(20) not null,
  message_id            NUMBER(20),
  message_type          NVARCHAR2(25),
  message_address       NVARCHAR2(255),
  object_version_number NUMBER(20),
  request_id            NUMBER(20),
  program_id            NUMBER(20),
  created_by            NUMBER(20),
  creation_date         DATE,
  last_updated_by       NUMBER(20),
  last_update_date      DATE,
  attribute1            VARCHAR2(255 CHAR),
  attribute2            VARCHAR2(255 CHAR),
  attribute3            VARCHAR2(255 CHAR),
  attribute4            VARCHAR2(255 CHAR),
  attribute5            VARCHAR2(255 CHAR),
  attribute6            VARCHAR2(255 CHAR),
  attribute7            VARCHAR2(255 CHAR),
  attribute8            VARCHAR2(255 CHAR),
  attribute9            VARCHAR2(255 CHAR),
  attribute10           VARCHAR2(255 CHAR),
  attribute11           VARCHAR2(255 CHAR),
  attribute12           VARCHAR2(255 CHAR),
  attribute13           VARCHAR2(255 CHAR),
  attribute14           VARCHAR2(255 CHAR),
  attribute15           VARCHAR2(255 CHAR)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column HAP_DEV2.SYS_MESSAGE_RECEIVER.receiver_id
  is '主键';
comment on column HAP_DEV2.SYS_MESSAGE_RECEIVER.message_id
  is '消息id';
create index HAP_DEV2.SYS_MESSAGE_RECEIVER_N1 on HAP_DEV2.SYS_MESSAGE_RECEIVER (MESSAGE_ID)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
alter table HAP_DEV2.SYS_MESSAGE_RECEIVER
  add constraint SYS_MESSAGE_RECEIVER_PK primary key (RECEIVER_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SYS_MESSAGE_TEMPLATE
prompt ===================================
prompt
create table HAP_DEV2.SYS_MESSAGE_TEMPLATE
(
  template_id           NUMBER(20) not null,
  subject               CLOB,
  content               CLOB,
  account_id            NUMBER(20),
  template_code         NVARCHAR2(50),
  template_type         NVARCHAR2(50),
  priority_level        NVARCHAR2(50),
  description           NVARCHAR2(240),
  object_version_number NUMBER,
  request_id            NUMBER(20),
  program_id            NUMBER(20),
  creation_date         DATE,
  created_by            NUMBER,
  last_updated_by       NUMBER,
  last_update_date      DATE,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30 CHAR),
  attribute1            VARCHAR2(240 CHAR),
  attribute2            VARCHAR2(240 CHAR),
  attribute3            VARCHAR2(240 CHAR),
  attribute4            VARCHAR2(240 CHAR),
  attribute5            VARCHAR2(240 CHAR),
  attribute6            VARCHAR2(240 CHAR),
  attribute7            VARCHAR2(240 CHAR),
  attribute8            VARCHAR2(240 CHAR),
  attribute9            VARCHAR2(240 CHAR),
  attribute10           VARCHAR2(240 CHAR),
  attribute11           VARCHAR2(240 CHAR),
  attribute12           VARCHAR2(240 CHAR),
  attribute13           VARCHAR2(240 CHAR),
  attribute14           VARCHAR2(240 CHAR),
  attribute15           VARCHAR2(240 CHAR)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column HAP_DEV2.SYS_MESSAGE_TEMPLATE.template_id
  is '主键';
comment on column HAP_DEV2.SYS_MESSAGE_TEMPLATE.subject
  is '模板标题';
comment on column HAP_DEV2.SYS_MESSAGE_TEMPLATE.content
  is '模板内容';
comment on column HAP_DEV2.SYS_MESSAGE_TEMPLATE.account_id
  is '账号id';
create unique index HAP_DEV2.SYS_MESSAGE_TEMPLATE_U1 on HAP_DEV2.SYS_MESSAGE_TEMPLATE (TEMPLATE_CODE)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAP_DEV2.SYS_MESSAGE_TEMPLATE
  add constraint SYS_MESSAGE_TEMPLATE_PK primary key (TEMPLATE_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_MESSAGE_TRANSACTION
prompt ======================================
prompt
create table HAP_DEV2.SYS_MESSAGE_TRANSACTION
(
  transaction_id        NUMBER(20) not null,
  message_id            NUMBER(20),
  transaction_status    NVARCHAR2(25),
  transaction_message   CLOB,
  message_address       NVARCHAR2(255),
  object_version_number NUMBER(20),
  request_id            NUMBER(20),
  program_id            NUMBER(20),
  created_by            NUMBER(20),
  creation_date         DATE,
  last_updated_by       NUMBER(20),
  last_update_date      DATE,
  attribute1            VARCHAR2(255 CHAR),
  attribute2            VARCHAR2(255 CHAR),
  attribute3            VARCHAR2(255 CHAR),
  attribute4            VARCHAR2(255 CHAR),
  attribute5            VARCHAR2(255 CHAR),
  attribute6            VARCHAR2(255 CHAR),
  attribute7            VARCHAR2(255 CHAR),
  attribute8            VARCHAR2(255 CHAR),
  attribute9            VARCHAR2(255 CHAR),
  attribute10           VARCHAR2(255 CHAR),
  attribute11           VARCHAR2(255 CHAR),
  attribute12           VARCHAR2(255 CHAR),
  attribute13           VARCHAR2(255 CHAR),
  attribute14           VARCHAR2(255 CHAR),
  attribute15           VARCHAR2(255 CHAR)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column HAP_DEV2.SYS_MESSAGE_TRANSACTION.transaction_id
  is '主键';
comment on column HAP_DEV2.SYS_MESSAGE_TRANSACTION.message_id
  is '消息id';
comment on column HAP_DEV2.SYS_MESSAGE_TRANSACTION.transaction_message
  is '返回信息';
create index HAP_DEV2.SYS_MESSAGE_TRANSACTION_N1 on HAP_DEV2.SYS_MESSAGE_TRANSACTION (TRANSACTION_STATUS)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create index HAP_DEV2.SYS_MESSAGE_TRANSACTION_N2 on HAP_DEV2.SYS_MESSAGE_TRANSACTION (MESSAGE_ID)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
alter table HAP_DEV2.SYS_MESSAGE_TRANSACTION
  add constraint SYS_MESSAGE_TRANSACTION_PK primary key (TRANSACTION_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SYS_PREFERENCES
prompt ==============================
prompt
create table HAP_DEV2.SYS_PREFERENCES
(
  preferences_id        NUMBER(20) not null,
  preferences           NVARCHAR2(30),
  preferences_level     NUMBER,
  preferences_value     NVARCHAR2(80),
  user_id               NUMBER(20),
  object_version_number NUMBER,
  request_id            NUMBER(20),
  program_id            NUMBER(20),
  creation_date         DATE,
  created_by            NUMBER,
  last_updated_by       NUMBER,
  last_update_date      DATE,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30 CHAR),
  attribute1            VARCHAR2(240 CHAR),
  attribute2            VARCHAR2(240 CHAR),
  attribute3            VARCHAR2(240 CHAR),
  attribute4            VARCHAR2(240 CHAR),
  attribute5            VARCHAR2(240 CHAR),
  attribute6            VARCHAR2(240 CHAR),
  attribute7            VARCHAR2(240 CHAR),
  attribute8            VARCHAR2(240 CHAR),
  attribute9            VARCHAR2(240 CHAR),
  attribute10           VARCHAR2(240 CHAR),
  attribute11           VARCHAR2(240 CHAR),
  attribute12           VARCHAR2(240 CHAR),
  attribute13           VARCHAR2(240 CHAR),
  attribute14           VARCHAR2(240 CHAR),
  attribute15           VARCHAR2(240 CHAR)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column HAP_DEV2.SYS_PREFERENCES.preferences_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_PREFERENCES.preferences_level
  is '逻辑分类：10 DSIS首选项, 20 MWS首选项';
comment on column HAP_DEV2.SYS_PREFERENCES.user_id
  is '账号ID';
alter table HAP_DEV2.SYS_PREFERENCES
  add constraint SYS_PREFERENCES_PK primary key (PREFERENCES_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_PROFILE
prompt ==========================
prompt
create table HAP_DEV2.SYS_PROFILE
(
  profile_id            VARCHAR2(32) not null,
  profile_name          VARCHAR2(40) not null,
  description           VARCHAR2(240),
  object_version_number NUMBER default 1 not null,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table HAP_DEV2.SYS_PROFILE
  is '配置文件';
comment on column HAP_DEV2.SYS_PROFILE.profile_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_PROFILE.profile_name
  is '配置文件名称';
comment on column HAP_DEV2.SYS_PROFILE.description
  is '描述';
alter table HAP_DEV2.SYS_PROFILE
  add constraint SYS_PROFILE_PK primary key (PROFILE_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SYS_PROFILE_VALUE
prompt ================================
prompt
create table HAP_DEV2.SYS_PROFILE_VALUE
(
  profile_value_id      NUMBER not null,
  profile_id            VARCHAR2(32) not null,
  level_id              VARCHAR2(32),
  level_value           VARCHAR2(40),
  profile_value         VARCHAR2(80),
  object_version_number NUMBER default 1 not null,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table HAP_DEV2.SYS_PROFILE_VALUE
  is '配置文件值';
comment on column HAP_DEV2.SYS_PROFILE_VALUE.profile_value_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_PROFILE_VALUE.profile_id
  is '配置文件ID';
comment on column HAP_DEV2.SYS_PROFILE_VALUE.level_id
  is '层次ID';
comment on column HAP_DEV2.SYS_PROFILE_VALUE.level_value
  is '层次值';
comment on column HAP_DEV2.SYS_PROFILE_VALUE.profile_value
  is '配置文件值';
alter table HAP_DEV2.SYS_PROFILE_VALUE
  add constraint SYS_PROFILE_VALUE_PK primary key (PROFILE_VALUE_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SYS_PROMPTS
prompt ==========================
prompt
create table HAP_DEV2.SYS_PROMPTS
(
  prompt_id             NUMBER not null,
  prompt_code           VARCHAR2(300),
  lang                  VARCHAR2(10),
  description           VARCHAR2(240),
  object_version_number NUMBER default 1,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.SYS_PROMPTS
  is '界面显示文本表';
comment on column HAP_DEV2.SYS_PROMPTS.prompt_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_PROMPTS.prompt_code
  is '文本编码';
comment on column HAP_DEV2.SYS_PROMPTS.lang
  is '语言';
comment on column HAP_DEV2.SYS_PROMPTS.description
  is '描述';
create unique index HAP_DEV2.SYS_PROMPTS_U1 on HAP_DEV2.SYS_PROMPTS (PROMPT_CODE, LANG)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAP_DEV2.SYS_PROMPTS
  add constraint SYS_PROMPTS_PK primary key (PROMPT_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_RESOURCE_B
prompt =============================
prompt
create table HAP_DEV2.SYS_RESOURCE_B
(
  resource_id           NUMBER not null,
  url                   VARCHAR2(400) not null,
  type                  VARCHAR2(15),
  name                  VARCHAR2(40) not null,
  description           VARCHAR2(240),
  login_require         VARCHAR2(1) default 'Y' not null,
  access_check          VARCHAR2(1) default 'Y' not null,
  object_version_number NUMBER default 1 not null,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.SYS_RESOURCE_B
  is '功能资源表';
comment on column HAP_DEV2.SYS_RESOURCE_B.resource_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_RESOURCE_B.url
  is 'URL';
comment on column HAP_DEV2.SYS_RESOURCE_B.type
  is '资源类型';
comment on column HAP_DEV2.SYS_RESOURCE_B.name
  is '资源名称';
comment on column HAP_DEV2.SYS_RESOURCE_B.description
  is '描述';
comment on column HAP_DEV2.SYS_RESOURCE_B.login_require
  is '是否需要登录';
comment on column HAP_DEV2.SYS_RESOURCE_B.access_check
  is '是否权限校验';
create unique index HAP_DEV2.SYS_RESOURCE_B_U1 on HAP_DEV2.SYS_RESOURCE_B (URL)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAP_DEV2.SYS_RESOURCE_B
  add constraint SYS_RESOURCE_B_PK primary key (RESOURCE_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_RESOURCE_ITEM_B
prompt ==================================
prompt
create table HAP_DEV2.SYS_RESOURCE_ITEM_B
(
  resource_item_id      NUMBER not null,
  owner_resource_id     NUMBER not null,
  target_resource_id    NUMBER,
  item_id               VARCHAR2(50) not null,
  item_name             VARCHAR2(50),
  description           VARCHAR2(240),
  item_type             VARCHAR2(10),
  object_version_number NUMBER default 1 not null,
  request_id            NUMBER default -1 not null,
  program_id            NUMBER default -1 not null,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table HAP_DEV2.SYS_RESOURCE_ITEM_B
  is '功能控件表';
comment on column HAP_DEV2.SYS_RESOURCE_ITEM_B.resource_item_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_RESOURCE_ITEM_B.owner_resource_id
  is '功能资源ID';
comment on column HAP_DEV2.SYS_RESOURCE_ITEM_B.target_resource_id
  is '目标资源ID';
comment on column HAP_DEV2.SYS_RESOURCE_ITEM_B.item_id
  is 'HTML中控件ID';
comment on column HAP_DEV2.SYS_RESOURCE_ITEM_B.item_name
  is '控件名称';
comment on column HAP_DEV2.SYS_RESOURCE_ITEM_B.description
  is '描述';
comment on column HAP_DEV2.SYS_RESOURCE_ITEM_B.item_type
  is '控件类型';
comment on column HAP_DEV2.SYS_RESOURCE_ITEM_B.object_version_number
  is '行版本号，用来处理锁';
comment on column HAP_DEV2.SYS_RESOURCE_ITEM_B.request_id
  is '对Record最后一次操作的系统内部请求id';
comment on column HAP_DEV2.SYS_RESOURCE_ITEM_B.program_id
  is '对Record最后一次操作的系统内部程序id';
create index HAP_DEV2.SYS_RESOURCE_ITEM_B_N1 on HAP_DEV2.SYS_RESOURCE_ITEM_B (OWNER_RESOURCE_ID)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create unique index HAP_DEV2.SYS_RESOURCE_ITEM_B_U1 on HAP_DEV2.SYS_RESOURCE_ITEM_B (ITEM_ID, OWNER_RESOURCE_ID)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
alter table HAP_DEV2.SYS_RESOURCE_ITEM_B
  add constraint SYS_RESOURCE_ITEM_B_PK primary key (RESOURCE_ITEM_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SYS_RESOURCE_ITEM_TL
prompt ===================================
prompt
create table HAP_DEV2.SYS_RESOURCE_ITEM_TL
(
  resource_item_id      NUMBER not null,
  lang                  VARCHAR2(10) not null,
  item_name             VARCHAR2(150),
  description           VARCHAR2(240),
  object_version_number NUMBER default 1 not null,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table HAP_DEV2.SYS_RESOURCE_ITEM_TL
  is '功能控件表(多语言)';
comment on column HAP_DEV2.SYS_RESOURCE_ITEM_TL.resource_item_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_RESOURCE_ITEM_TL.lang
  is '语言';
comment on column HAP_DEV2.SYS_RESOURCE_ITEM_TL.item_name
  is '控件名称';
comment on column HAP_DEV2.SYS_RESOURCE_ITEM_TL.description
  is '描述';
alter table HAP_DEV2.SYS_RESOURCE_ITEM_TL
  add constraint SYS_RESOURCE_ITEM_TL_PK primary key (RESOURCE_ITEM_ID, LANG)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SYS_RESOURCE_TL
prompt ==============================
prompt
create table HAP_DEV2.SYS_RESOURCE_TL
(
  resource_id           NUMBER not null,
  lang                  VARCHAR2(10) not null,
  name                  VARCHAR2(40) not null,
  description           VARCHAR2(240),
  object_version_number NUMBER default 1 not null,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.SYS_RESOURCE_TL
  is '功能资源表(多语言)';
comment on column HAP_DEV2.SYS_RESOURCE_TL.resource_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_RESOURCE_TL.lang
  is '语言';
comment on column HAP_DEV2.SYS_RESOURCE_TL.name
  is '资源名称';
comment on column HAP_DEV2.SYS_RESOURCE_TL.description
  is '描述';
alter table HAP_DEV2.SYS_RESOURCE_TL
  add constraint SYS_RESOURCE_TL_PK primary key (RESOURCE_ID, LANG)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_ROLE_B
prompt =========================
prompt
create table HAP_DEV2.SYS_ROLE_B
(
  role_id               NUMBER not null,
  role_code             VARCHAR2(40) not null,
  role_name             VARCHAR2(150),
  role_description      VARCHAR2(240),
  object_version_number NUMBER default 1,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.SYS_ROLE_B
  is '角色表';
comment on column HAP_DEV2.SYS_ROLE_B.role_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_ROLE_B.role_code
  is '角色编码';
comment on column HAP_DEV2.SYS_ROLE_B.role_name
  is '角色名称';
comment on column HAP_DEV2.SYS_ROLE_B.role_description
  is '角色描述';
create unique index HAP_DEV2.SYS_ROLE_B_U1 on HAP_DEV2.SYS_ROLE_B (ROLE_CODE)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAP_DEV2.SYS_ROLE_B
  add constraint SYS_ROLE_B_PK primary key (ROLE_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_ROLE_FUNCTION
prompt ================================
prompt
create table HAP_DEV2.SYS_ROLE_FUNCTION
(
  srf_id                NUMBER not null,
  role_id               NUMBER not null,
  function_id           NUMBER not null,
  object_version_number NUMBER default 1,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.SYS_ROLE_FUNCTION
  is '角色功能表';
comment on column HAP_DEV2.SYS_ROLE_FUNCTION.srf_id
  is 'ID';
comment on column HAP_DEV2.SYS_ROLE_FUNCTION.role_id
  is '角色ID';
comment on column HAP_DEV2.SYS_ROLE_FUNCTION.function_id
  is '功能ID';
create unique index HAP_DEV2.SYS_ROLE_FUNCTION_U1 on HAP_DEV2.SYS_ROLE_FUNCTION (ROLE_ID, FUNCTION_ID)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAP_DEV2.SYS_ROLE_FUNCTION
  add constraint SYS_ROLE_FUNCTION_PK primary key (SRF_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_ROLE_RESOURCE_ITEM
prompt =====================================
prompt
create table HAP_DEV2.SYS_ROLE_RESOURCE_ITEM
(
  rsi_id                NUMBER(20) not null,
  role_id               NUMBER not null,
  resource_item_id      NUMBER not null,
  object_version_number NUMBER default 1 not null,
  request_id            NUMBER default -1 not null,
  program_id            NUMBER default -1 not null,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table HAP_DEV2.SYS_ROLE_RESOURCE_ITEM
  is '角色功能控件表，用于对控件控制';
comment on column HAP_DEV2.SYS_ROLE_RESOURCE_ITEM.rsi_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_ROLE_RESOURCE_ITEM.role_id
  is '角色ID';
comment on column HAP_DEV2.SYS_ROLE_RESOURCE_ITEM.resource_item_id
  is '功能控件ID';
create index HAP_DEV2.SYS_ROLE_RESOURCE_ITEM_N1 on HAP_DEV2.SYS_ROLE_RESOURCE_ITEM (ROLE_ID)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
create unique index HAP_DEV2.SYS_ROLE_RESOURCE_ITEM_U1 on HAP_DEV2.SYS_ROLE_RESOURCE_ITEM (ROLE_ID, RESOURCE_ITEM_ID)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;
alter table HAP_DEV2.SYS_ROLE_RESOURCE_ITEM
  add constraint SYS_ROLE_RESOURCE_ITEM_PK primary key (RSI_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SYS_ROLE_TL
prompt ==========================
prompt
create table HAP_DEV2.SYS_ROLE_TL
(
  role_id               NUMBER not null,
  lang                  VARCHAR2(10) not null,
  role_name             VARCHAR2(150),
  role_description      VARCHAR2(240),
  object_version_number NUMBER default 1,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.SYS_ROLE_TL
  is '角色表(多语言)';
comment on column HAP_DEV2.SYS_ROLE_TL.role_id
  is '角色ID';
comment on column HAP_DEV2.SYS_ROLE_TL.lang
  is '语言';
comment on column HAP_DEV2.SYS_ROLE_TL.role_name
  is '角色名称';
comment on column HAP_DEV2.SYS_ROLE_TL.role_description
  is '角色描述';
alter table HAP_DEV2.SYS_ROLE_TL
  add constraint SYS_ROLE_TL_PK primary key (ROLE_ID, LANG)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_USER
prompt =======================
prompt
create table HAP_DEV2.SYS_USER
(
  user_id               NUMBER not null,
  user_type             VARCHAR2(30),
  user_name             VARCHAR2(40),
  password_encrypted    VARCHAR2(80) not null,
  email                 VARCHAR2(150),
  phone                 VARCHAR2(40),
  start_active_date     DATE,
  end_active_date       DATE,
  status                VARCHAR2(30),
  object_version_number NUMBER default 1,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.SYS_USER
  is '用户表';
comment on column HAP_DEV2.SYS_USER.user_id
  is '表ID，主键，供其他表做外键';
comment on column HAP_DEV2.SYS_USER.user_type
  is '用户类型';
comment on column HAP_DEV2.SYS_USER.user_name
  is '用户名';
comment on column HAP_DEV2.SYS_USER.password_encrypted
  is '加密过的密码';
comment on column HAP_DEV2.SYS_USER.email
  is '邮箱地址';
comment on column HAP_DEV2.SYS_USER.phone
  is '电话号码';
comment on column HAP_DEV2.SYS_USER.start_active_date
  is '有效期从';
comment on column HAP_DEV2.SYS_USER.end_active_date
  is '有效期至';
comment on column HAP_DEV2.SYS_USER.status
  is '状态';
alter table HAP_DEV2.SYS_USER
  add constraint SYS_USER_PK primary key (USER_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_USER_ROLE
prompt ============================
prompt
create table HAP_DEV2.SYS_USER_ROLE
(
  sur_id                NUMBER not null,
  user_id               NUMBER not null,
  role_id               NUMBER not null,
  object_version_number NUMBER default 1,
  request_id            NUMBER default -1,
  program_id            NUMBER default -1,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240)
)
tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HAP_DEV2.SYS_USER_ROLE
  is '用户角色表';
comment on column HAP_DEV2.SYS_USER_ROLE.user_id
  is '用户ID';
comment on column HAP_DEV2.SYS_USER_ROLE.role_id
  is '角色ID';
create unique index HAP_DEV2.SYS_USER_ROLE_U1 on HAP_DEV2.SYS_USER_ROLE (USER_ID, ROLE_ID)
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAP_DEV2.SYS_USER_ROLE
  add constraint SYS_USER_ROLE_PK primary key (SUR_ID)
  using index 
  tablespace TBS_PERM_HAP2
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating sequence FRUIT_B_S
prompt ===========================
prompt
create sequence HAP_DEV2.FRUIT_B_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10021
increment by 1
cache 20;

prompt
prompt Creating sequence HAP_OM_ORDER_HEADERS_S
prompt ========================================
prompt
create sequence HAP_DEV2.HAP_OM_ORDER_HEADERS_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence HAP_OM_ORDER_LINES_S
prompt ======================================
prompt
create sequence HAP_DEV2.HAP_OM_ORDER_LINES_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_ATTACHMENT_S
prompt ==================================
prompt
create sequence HAP_DEV2.SYS_ATTACHMENT_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10021
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_ATTACH_CATEGORY_B_S
prompt =========================================
prompt
create sequence HAP_DEV2.SYS_ATTACH_CATEGORY_B_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10021
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_CODE_B_S
prompt ==============================
prompt
create sequence HAP_DEV2.SYS_CODE_B_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_CODE_VALUE_B_S
prompt ====================================
prompt
create sequence HAP_DEV2.SYS_CODE_VALUE_B_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_FILE_S
prompt ============================
prompt
create sequence HAP_DEV2.SYS_FILE_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10021
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_FUNCTION_B_S
prompt ==================================
prompt
create sequence HAP_DEV2.SYS_FUNCTION_B_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10061
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_FUNCTION_RESOURCE_S
prompt =========================================
prompt
create sequence HAP_DEV2.SYS_FUNCTION_RESOURCE_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10041
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_JOB_RUNNING_INFO_S
prompt ========================================
prompt
create sequence HAP_DEV2.SYS_JOB_RUNNING_INFO_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_LOV_ITEM_S
prompt ================================
prompt
create sequence HAP_DEV2.SYS_LOV_ITEM_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_LOV_S
prompt ===========================
prompt
create sequence HAP_DEV2.SYS_LOV_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_MESSAGE_ACCOUNT_S
prompt =======================================
prompt
create sequence HAP_DEV2.SYS_MESSAGE_ACCOUNT_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_MESSAGE_ATTACHMENT_S
prompt ==========================================
prompt
create sequence HAP_DEV2.SYS_MESSAGE_ATTACHMENT_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_MESSAGE_EMAIL_ACCOUNT_S
prompt =============================================
prompt
create sequence HAP_DEV2.SYS_MESSAGE_EMAIL_ACCOUNT_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_MESSAGE_EMAIL_CONFIG_S
prompt ============================================
prompt
create sequence HAP_DEV2.SYS_MESSAGE_EMAIL_CONFIG_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_MESSAGE_EMAIL_WHITE_LT_S
prompt ==============================================
prompt
create sequence HAP_DEV2.SYS_MESSAGE_EMAIL_WHITE_LT_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_MESSAGE_RECEIVER_S
prompt ========================================
prompt
create sequence HAP_DEV2.SYS_MESSAGE_RECEIVER_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_MESSAGE_S
prompt ===============================
prompt
create sequence HAP_DEV2.SYS_MESSAGE_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_MESSAGE_TEMPLATE_S
prompt ========================================
prompt
create sequence HAP_DEV2.SYS_MESSAGE_TEMPLATE_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_MESSAGE_TRANSACTION_S
prompt ===========================================
prompt
create sequence HAP_DEV2.SYS_MESSAGE_TRANSACTION_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_PREFERENCES_S
prompt ===================================
prompt
create sequence HAP_DEV2.SYS_PREFERENCES_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_PROFILE_S
prompt ===============================
prompt
create sequence HAP_DEV2.SYS_PROFILE_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_PROFILE_VALUE_S
prompt =====================================
prompt
create sequence HAP_DEV2.SYS_PROFILE_VALUE_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_PROMPTS_S
prompt ===============================
prompt
create sequence HAP_DEV2.SYS_PROMPTS_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10021
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_RESOURCE_B_S
prompt ==================================
prompt
create sequence HAP_DEV2.SYS_RESOURCE_B_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10041
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_RESOURCE_ITEM_B_S
prompt =======================================
prompt
create sequence HAP_DEV2.SYS_RESOURCE_ITEM_B_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_ROLE_B_S
prompt ==============================
prompt
create sequence HAP_DEV2.SYS_ROLE_B_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10021
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_ROLE_FUNCTION_S
prompt =====================================
prompt
create sequence HAP_DEV2.SYS_ROLE_FUNCTION_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10461
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_ROLE_RESOURCE_ITEM_S
prompt ==========================================
prompt
create sequence HAP_DEV2.SYS_ROLE_RESOURCE_ITEM_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_USER_ROLE_S
prompt =================================
prompt
create sequence HAP_DEV2.SYS_USER_ROLE_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_USER_S
prompt ============================
prompt
create sequence HAP_DEV2.SYS_USER_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 10001
increment by 1
cache 20;


spool off
