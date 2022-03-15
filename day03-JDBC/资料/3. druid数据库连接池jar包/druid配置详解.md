### druid配置详解




|                   属性                   |                             说明                             |          建议值           |
| :--------------------------------------: | :----------------------------------------------------------: | :-----------------------: |
|                   url                    |   数据库的jdbc连接地址。一般为连接oracle/mysql。示例如下：   |                           |
|                                          |    mysql : jdbc:mysql://ip:port/dbname?option1&option2&…     |                           |
|                                          |        oracle : jdbc:oracle:thin:@ip:port:oracle_sid         |                           |
|                                          |                                                              |                           |
|                 username                 |                      登录数据库的用户名                      |                           |
|                 password                 |                     登录数据库的用户密码                     |                           |
|               initialSize                |            启动程序时，在连接池中初始化多少个连接            |        10-50已足够        |
|                maxActive                 |                连接池中最多支持多少个活动会话                |                           |
|                 maxWait                  | 程序向连接池中请求连接时,超过maxWait的值后，认为本次请求失败，即连接池 |            100            |
|                                          |         没有可用连接，单位毫秒，设置-1时表示无限等待         |                           |
|        minEvictableIdleTimeMillis        | 池中某个连接的空闲时长达到 N 毫秒后, 连接池在下次检查空闲连接时，将 |        见说明部分         |
|                                          |               回收该连接,要小于防火墙超时设置                |                           |
|                                          |   net.netfilter.nf_conntrack_tcp_timeout_established的设置   |                           |
|      timeBetweenEvictionRunsMillis       |    检查空闲连接的频率，单位毫秒, 非正整数时表示不进行检查    |                           |
|                keepAlive                 | 程序没有close连接且空闲时长超过 minEvictableIdleTimeMillis,则会执 |           true            |
|                                          | 行validationQuery指定的SQL,以保证该程序连接不会池kill掉,其范围不超 |                           |
|                                          |                  过minIdle指定的连接个数。                   |                           |
|                 minIdle                  |          回收空闲连接时，将保证至少有minIdle个连接.          |     与initialSize相同     |
|             removeAbandoned              | 要求程序从池中get到连接后, N 秒后必须close,否则druid 会强制回收该 |   false,当发现程序有未    |
|                                          | 连接,不管该连接中是活动还是空闲, 以防止进程不会进行close而霸占连接。 | 正常close连接时设置为true |
|          removeAbandonedTimeout          | 设置druid 强制回收连接的时限，当程序从池中get到连接开始算起，超过此 |  应大于业务运行最长时间   |
|                                          |            值后，druid将强制回收该连接，单位秒。             |                           |
|               logAbandoned               |    当druid强制回收连接后，是否将stack trace 记录到日志中     |           true            |
|              testWhileIdle               | 当程序请求连接，池在分配连接时，是否先检查该连接是否有效。(高效) |           true            |
|             validationQuery              | 检查池中的连接是否仍可用的 SQL 语句,drui会连接到数据库执行该SQL, 如果 |                           |
|                                          |         正常返回，则表示连接可用，否则表示连接不可用         |                           |
|               testOnBorrow               |  程序 **申请** 连接时,进行连接有效性检查（低效，影响性能）   |           false           |
|               testOnReturn               |  程序 **返还** 连接时,进行连接有效性检查（低效，影响性能）   |           false           |
|          poolPreparedStatements          |                缓存通过以下两个方法发起的SQL:                |           true            |
|                                          |    public PreparedStatement prepareStatement(String sql)     |                           |
|                                          |    public PreparedStatement prepareStatement(String sql,     |                           |
|                                          |         int resultSetType, int resultSetConcurrency)         |                           |
| maxPoolPrepareStatementPerConnectionSize |                  每个连接最多缓存多少个SQL                   |            20             |
|                 filters                  |                这里配置的是插件,常用的插件有:                |      stat,wall,slf4j      |
|                                          |                    监控统计: filter:stat                     |                           |
|                                          |              日志监控: filter:log4j 或者 slf4j               |                           |
|                                          |                   防御SQL注入: filter:wall                   |                           |
|            connectProperties             |         连接属性。比如设置一些连接池统计方面的配置。         |                           |
|                                          |    druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000    |                           |
|                                          |                 比如设置一些数据库连接属性:                  |                           |
|                                          |                                                              |                           |