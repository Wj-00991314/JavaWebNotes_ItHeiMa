<%@ page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page import="com.itheima.util.SqlSessionFactoryUtils" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.itheima.mapper.UserMapper" %>
<%@ page import="com.itheima.pojo.User" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<%
    //1. 接收用户名和密码
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    //2. 调用MyBatis完成查询
    //2.1 获取SqlSessionFactory对象
       /* String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);*/

    SqlSessionFactory sqlSessionFactory = SqlSessionFactoryUtils.getSqlSessionFactory();
    //2.2 获取SqlSession对象
    SqlSession sqlSession = sqlSessionFactory.openSession();
    //2.3 获取Mapper
    UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
    //2.4 调用方法
    User user = userMapper.select(username, password);
    //2.5 释放资源
    sqlSession.close();
    //获取字符输出流，并设置content type
    response.setContentType("text/html;charset=utf-8");
    PrintWriter writer = response.getWriter();
    //3. 判断user释放为null
    if(user != null){
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf8" version='1'/>
    <title>京东(JD.COM)-正品低价、品质保障、配送及时、轻松购物！</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes"/>
    <meta name="description"
          content="京东JD.COM-专业的综合网上购物商城，为您提供正品低价的购物选择、优质便捷的服务体验。商品来自全球数十万品牌商家，囊括家电、手机、电脑、服装、居家、母婴、美妆、个护、食品、生鲜等丰富品类，满足各种购物需求。"/>
    <meta name="Keywords" content="网上购物,网上商城,家电,手机,电脑,服装,居家,母婴,美妆,个护,食品,生鲜,京东"/>
    <script type="text/javascript">
        window.point = {}
        window.point.start = new Date().getTime()
    </script>
    <link rel="dns-prefetch" href="//static.360buyimg.com"/>
    <link rel="dns-prefetch" href="//misc.360buyimg.com"/>
    <link rel="dns-prefetch" href="//img10.360buyimg.com"/>
    <link rel="dns-prefetch" href="//img11.360buyimg.com"/>
    <link rel="dns-prefetch" href="//img12.360buyimg.com"/>
    <link rel="dns-prefetch" href="//img13.360buyimg.com"/>
    <link rel="dns-prefetch" href="//img14.360buyimg.com"/>
    <link rel="dns-prefetch" href="//img20.360buyimg.com"/>
    <link rel="dns-prefetch" href="//img30.360buyimg.com"/>
    <link rel="dns-prefetch" href="//d.3.cn"/>
    <link rel="dns-prefetch" href="//d.jd.com"/>
    <link rel="icon" href="//www.jd.com/favicon.ico" mce_href="//www.jd.com/favicon.ico" type="image/x-icon"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>

    <!--[if lte IE 6]>
    <script src="//misc.360buyimg.com/mtd/pc/index/home/ie6tip.min.js"></script>
    <![endif]-->
    <!--[if IE 8]>
    <script src="//misc.360buyimg.com/mtd/pc/index_2019/1.0.0/static/lib/polyfill/index.js"></script>
    <![endif]-->

    <link href="//misc.360buyimg.com/mtd/pc/index_2019/1.0.0/static/css/first-screen.chunk.css" rel="stylesheet"/>

    <link href="//misc.360buyimg.com/mtd/pc/index_2019/1.0.0/static/css/index.chunk.css" rel="stylesheet"/>
    <script type="text/javascript">
        window.point.css = new Date().getTime()
    </script>
    <script type="text/javascript">
        window.pageConfig = {};
        //灰度区间统一配置
        window.pageConfig.hashList ={"research":[{"start":"0","end":"10000"},{"start":"10000","end":"10000"}],"navitems":[{"start":"0","end":"0"},{"start":"0","end":"10000"}],"treasure":[{"start":"0","end":"10000"},{"start":"10000","end":"10000"}],"floor":[{"start":"0","end":"10000"},{"start":"10000","end":"10000"}],"schoolFloor":[{"start":"0","end":"10000"},{"start":"10000","end":"10000"}],"top":[{"start":"0","end":"10000"},{"start":"10000","end":"10000"}],"recommend":[{"start":"0","end":"10000"},{"start":"10000","end":"10000"}],"channels":[{"start":"0","end":"10000"},{"start":"10000","end":"10000"}]};
        // 大促配置
        window.promotional = {};
        window.promotional.enableShowToolbar = false;
        window.pageConfig.enableShowSpecialTop = false;
        window.promotional.enableShowTop = false;
        window.promotional.actTimeStart = new Date('2021/05/24 00:00:00').getTime();
        window.promotional.actTimeEnd = new Date('2021/06/20 23:59:59').getTime();
        window.promotional.atmosphere = {};
        window.promotional.atmosphere.background = 'jfs/t1/176936/21/4586/754/60a20f82Eaa2168e2/b51953e00fc6f2bd.png';
        window.promotional.atmosphere.desc = 'jfs/t1/195861/13/3592/15237/60a20f87E5423ff49/97a945a15c5e3aba.png';
        window.promotional.newEnjoyType = 'S2';
        // 兜底数据
        window.backup = {};
        //logo
        window.pageConfig.logo = {};
        //直通车
        window.pageConfig.treasure = {"name":"","desc":"","href":"https:\/\/pro.jd.com\/mall\/active\/3dG3iRTrGPqFhJ224nuE4DWKwwW3\/index.html","src":"https:\/\/m.360buyimg.com\/babel\/jfs\/t1\/192091\/38\/16285\/82424\/6108a93dEcd35363a\/15da5dbb5cca1732.png"};
        window.pageConfig.treasureb = {};
        //企业定投直通车
        window.pageConfig.treasureEnterprise  = {"name":"","desc":"","href":"https:\/\/pro.jd.com\/mall\/active\/2obbFKSWKX7TR2cpbcaVUq21TX3Z\/index.html","src":"https:\/\/m.360buyimg.com\/babel\/jfs\/t1\/196358\/15\/17501\/20818\/61123234E6bfeeef7\/3d338bd34ae42365.png"};
        //背板
        window.pageConfig.background = {};
        window.pageConfig.cateType="default";
        window.pageConfig.headServiceType="default";
        window.pageConfig.headSiteNavType="default";
        window.pageConfig.enableJquerySwitch="true";
        //企业背板
        window.pageConfig.backgroundEnterprise = {"bothBgPic":"https:\/\/m.360buyimg.com\/babel\/jfs\/t1\/182927\/4\/18584\/360132\/61122fa4E706bd2f4\/732c6ecf4066f205.png","href":"https:\/\/pro.jd.com\/mall\/active\/2obbFKSWKX7TR2cpbcaVUq21TX3Z\/index.html"};
        // 页面配置
        window.pageConfig.enableActMark = false;
        window.pageConfig.clstagPrefix = 'h|keycount|';
        window.pageConfig.O2_REPORT = 100;
        window.pageConfig.serverTime = new Date('2021/08/11 21:33:02').getTime();
        window.pageConfig.actStart = new Date('2019/10/18 00:00:00').getTime();
        window.pageConfig.actEnd = new Date('2019/11/15 23:59:59').getTime();
        // 手机京东
        window.pageConfig.shortcutMobileData=[{"title":"\u624b\u673a\u4eac\u4e1c","desc":"\u65b0\u4eba\u4e13\u4eab\u5927\u793c\u5305","img":"jfs\/t1\/67481\/15\/565\/28110\/5cec9234E71c47244\/dc4cf353fd96922e.png","url":"","devices":[{"type":"iphone","src":"https:\/\/itunes.apple.com\/cn\/app\/id414245413"},{"type":"android","src":"https:\/\/storage.jd.com\/jdmobile\/JDMALL-PC2.apk"},{"type":"ipad","src":"https:\/\/itunes.apple.com\/cn\/app\/jing-dong-hd\/id434374726"}]},{"title":"\u5173\u6ce8\u4eac\u4e1cJD.COM","desc":"\u62a25\u5143\u7ea2\u5305","img":"jfs\/t1\/133427\/32\/6189\/44062\/5f2a5467Efff804d1\/7cbc252ed5993190.png","url":"","devices":[]},{"title":"\u4eac\u4e1c\u91d1\u878d\u5ba2\u6237\u7aef","desc":"\u65b0\u4eba\u4e13\u4eab\u5927\u793c\u5305","img":"jfs\/t1\/36947\/5\/10895\/15408\/5cec924bE6c038530\/5cf21582b416c186.jpg","url":"https:\/\/m.jr.jd.com\/integrate\/download\/html\/pc.html","devices":[{"type":"iphone","src":"https:\/\/itunes.apple.com\/cn\/app\/jing-dong-jin-rong-hui-li\/id895682747?mt=8"},{"type":"android","src":"http:\/\/211.151.9.66\/downapp\/jrapp_jr188.apk"}]},{"title":"\u4eac\u4e1c\u5065\u5eb7\u5ba2\u6237\u7aef","desc":"","img":"jfs\/t1\/93019\/8\/17752\/28300\/5e8c23b8E4c6c7c13\/9c45c518ad785873.png","url":"","devices":[{"type":"iphone","src":"https:\/\/hlc.m.jd.com\/download\/?downloadSource=jdh_JDcom"},{"type":"android","src":"https:\/\/hlc.m.jd.com\/download\/?downloadSource=jdh_JDcom"}]},{"title":"\u5173\u6ce8\u4eac\u4e1c\u5c0f\u7a0b\u5e8f","desc":"\u65b0\u4eba0.1\u5143\u8d2d","img":"jfs\/t1\/170279\/40\/10824\/19657\/6045bf7dE610d6258\/3e925badd90757a3.jpg","url":"","devices":[]}];
        //今日推荐
        window.backup.today=[{"alt":"\u590f\u5b63\u4f01\u4e1a\u8fd0\u52a8\u4f1a","ext_columns":{"biclk":"1#28ba5dffeb6ef71c377039a950b5b8f84436147e-103-619066#34524718","focustype":"s","ap":"PSsZg4+EnPTxJtKHplggjg==","mcinfo":"03652902-15754595-3501537885-M#0-2-1--59--#1-tb-#102-34524718#pc-home","url":"\/\/pro.jd.com\/mall\/active\/34x5jJY9t9RmEB9R2kj68NUbgqWw\/index.html","desc":"","text":"\u590f\u5b63\u4f01\u4e1a\u8fd0\u52a8\u4f1a"},"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/172970\/35\/20403\/41768\/60f7c505Eb755ff39\/040dfa156468a02d.jpg","gid":"03652902","href":"\/\/pro.jd.com\/mall\/active\/34x5jJY9t9RmEB9R2kj68NUbgqWw\/index.html","srcB":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/172970\/35\/20403\/41768\/60f7c505Eb755ff39\/040dfa156468a02d.jpg","type":"material"},{"alt":"","ext_columns":{"biclk":"1#28ba5dffeb6ef71c377039a950b5b8f84436147e-103-619066#34524718","focustype":"s","ap":"yxgo8R761YABBlITEyBAiQ==","mcinfo":"03652902-15754595-3501538558-M#0-2-1--59--#1-tb-#102-34524718#pc-home","url":"\/\/pro.jd.com\/mall\/active\/4EwYUR4dmxiRpX5zZPPLRsVtT8FF\/index.html","desc":"","text":""},"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/184033\/11\/15215\/93064\/60fa9e48E857975c6\/3fb18d7504d1688e.jpg","gid":"03652902","href":"\/\/pro.jd.com\/mall\/active\/4EwYUR4dmxiRpX5zZPPLRsVtT8FF\/index.html","srcB":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/184033\/11\/15215\/93064\/60fa9e48E857975c6\/3fb18d7504d1688e.jpg","type":"material"},{"ext_columns":{"focustype":"g"},"type":"ad","href":"\/\/ccc-x.jd.com\/dsp\/nc?ext=aHR0cHM6Ly9jaGFubmVsLW0uamQuY29tL3BjL3BzcC8xMDAwMTE4NTc5ODA_aW11cD1DZzhLQ1hsaGJtZG9kV2t5T1JJQUdBQVNHQWk4c0tfSjlBSVE5YV9yM0FNYUJHOTFlbWdncWswb0FSamFJU0FBS2g5cFlpeDFaU3g0WjJZc1oybGhMR05wWlN4bVgySmhYMlpzWDJ3ME9UTTVNZ0pwWWtxVkFVbDhVMGhWVGxSZlNVSXNTVjlCWDBaTVgwSXNTVjlCWDFKRlgwSXNTVjlCWDFCTVgwSXNTVjlCWDFOTVgwSXNTVjlCWDBOVFgwSXNTVjlWWDBaTVgwSXNTVjlUWDBaTVgwSXNTVjlTWDBaTVgwSXNTVjlRWDBaTVgwSXNTVjlIWDFoSFgxSXNTVjlDWDBaTVgweERMRWRKUVN4WVIwWXNWVVY4TzBaOFRVbFlWRUZIWDBaU0xFWmZRa0ZmUmt4ZlREUTVNemw4&log=xeTX5bmvhdZVtbVDALrLFb2P0i9hHlr4LRPy26g5u25MwpbCHIpJY0O-te6Si8IXAPGwo2PB7ZkZsh9hqbdkaUwg9ho3sL8SEQ178YVD-OwlKvrsAE0fMCdZxTvo5PFrZUt3eZdgSF-isAUwlRvXKq7P1_E8z2M0huoxCXRgEVYjKx6PcvC9nQrr3Rd2SmwZxOcMrjKALFzOnupwhMP5wlsxjbDMBlRpZusjAa0fq-5C5RqUX5aHSek_CM5lsj2PX7iq9MRLLzByCoKvi7XuxF14lj7eVZuLtKHGhi6n4bAfBj4W1sMUipGbWDDTQ7YABhHVsC6uaxt4ZKszbY_ZTQeui4gZ2Nl3HSIY5qSAb8obhjNYj5iAqqeyZiqRmpj4yXZuS5u1qfttPbClKTXAGDE9PJrpEOVnqtNUQCW_YhUK-W6hrTy_0edWKgkyFWiYhMZVy6vhPCyBDCldTj0l_h5-Wy8jjqq88VPyXfjlMMeVnOsbkbcVABJwV39a37LSL_rE-9n8tH-dnyOLLP7oyVODPf-HGy3a7BTUtbtZl1rsn8YcFiHdlfxACybLhXl_IRB08z3OhZiiVNqBLrfWc2_uh7dSrv-r-5kuR3wDJ3YqgqaGAeMAXCS-tK2asvgfSBbbNsNA_Nt5EP67qevxo5sSppdztHGZl2AoB6cp-4F-bsInIzTXVSk3q1sVF7sEcC35GmWG5wlY0EAgEbRsHcyhLt_crhPczlPAGGjOEcHyTyR3n_RHz72pybajzMiQcJVb4TM7MCNy-ihRjENZo2TlBz0c4PNWms8E1Ip7n-b9hCV_YGVNcZkIgGgXuRl9Hoa-Z6O3U0JJLTHHztr3c-DUhA1gqL4jl801_lczWCFR4b6uNOB8wpqAsXbN9f5YeL5pM7fl1UnlyhRN0VcRb2J5PO2ttSKpiqO-v71jWAsAdlwGixdHAc_XVyPQUUEqYIF4sKlj_oOfRbbE431pIoKK7eYbpphnDI8yCkhdohTVDRbqtTsW0uoV9okLWalPNmpSGx3UFGnT1dpyZDQDahvunhhIHF75VjwJrSbTukE&v=404","src":"\/\/img1.360buyimg.com\/da\/jfs\/t1\/108087\/35\/14065\/31055\/5ea43e89E3cc7fd92\/b969140a6540f9b3.png","clog":"\/\/im-x.jd.com\/dsp\/np?log=xeTX5bmvhdZVtbVDALrLFb2P0i9hHlr4LRPy26g5u25MwpbCHIpJY0O-te6Si8IXAPGwo2PB7ZkZsh9hqbdkaUwg9ho3sL8SEQ178YVD-OwlKvrsAE0fMCdZxTvo5PFrZUt3eZdgSF-isAUwlRvXKq7P1_E8z2M0huoxCXRgEVYjKx6PcvC9nQrr3Rd2SmwZxOcMrjKALFzOnupwhMP5wt8mLmC6eTnNylQjgkOoiek-ob11xmDVtM2T-2cK9caUW6QSSweynveFlrJ3wYbjE3y-wUemCXTwZdJT4VMXPkMLbXiIdX2odWU9Odr9TUbVWktY38Y98iFbVV5YoF8PmAgaSUZJa8Rord1XEYcvUhv4cMfh7Eu2YVRy1xSa1YKppZwvIsV1mK9yH0knrcVpofjum3UPwxWZEu3sogQ4yk3wFZNV0n_1eVx2AQ0c6ehWWn7NTJpNJNC1K045k7uCqBYk1yTwHBOkhhvC_qpqiccREZOfscStV8jUMHzHgCbNbgEPo0oiJdV2__npWDSKFuuxifGECTb6L7fCUsNmXssigJmLXhLePFn0ZkdpTpAr_8LpgGEGGjV7o-oVL3g8HlB47rWmmL6LXezBCgkvGsKfrohlVok_tgy3PrM6_u-xmdS0culZ3JzdozZ3Az_-uRf8SaBWzXrC9cIJ0pAtQo7kGOE2KKYkC2Nt6sTs7UoK7uMh5CRpGre-JMJalsno9CIjpndGp11oOiOnqIxA9hJ8iwj8KrasCEk1UlkJBIhtwrJ74TiONKlnTrX7Zvs2l_aUWpzA0IywESjPVhI4jeNiBgJSV-vmnq6o_7_Fnnl_JmL-QossFPrrSO2j-WVIxDZ7u0RlDGNLJbVxsIF6Cuq88yE1dOmBxlsqXbbtQkutpRgbKBUN_pxQvj2hyGYS1C_yrA_3deiqv_PY9O6PRENotQ1JEbQEcUUaBBGY1iXkUPUHyytXxbz29UUbSvnx92qU5IbQJ-Z9hRTpQYBDtO_J17Cjqn9iDTrhOHLd_b57MIapFaALHe7IITCGuNRM6A&v=404&seq=1"},{"ext_columns":{"focustype":"g"},"type":"ad","href":"\/\/ccc-x.jd.com\/dsp\/nc?ext=aHR0cHM6Ly9zYWxlLmpkLmNvbS9tYWxsL0puV2tFd1BNeWgzbGVzUy5odG1s&log=xeTX5bmvhdZVtbVDALrLFb2P0i9hHlr4LRPy26g5u26Z_kwpRYppaj3bOuqgbKIh9NY-JPmWuPuKxSzETR_INTfELTPfDFRzZpYg-qtqS18vvImzQ2Krb-yRsl4Z91gzncABxAxx_Ek6-JHjA_fmbXNwO84rMQPCaJoe8y1kJ-VQ59eymlKYK0PhYNEuDbqWCbp73BNIj93UQhfA3NH3qOAL5Kg7dEB9hVUPS7kZtrjhSSbcki0rOmpMf3BknA-BdewrodQx2Z7GN2knlA0khRSw3lBBSSa9nZFjqyJ32kURQeAzdXe_xY4H1k0cCxucwypeyOaQClT7tspj3EXI3I5xVfRyITER5dcaGtiJtXskan07a24iHvfeU5o59R_Yggl0WI6BJ1iU0-fnI6xRb9M4G1g5CvbONADwdifsmmkj6NmuM_zj_O3VsGQxXyT2M0kVfAQkwxSm-tBfQWMfNX-4hKmjhsxhjhqZ9qQotDyEZJtkGhviv3eyY7l3MNOYvjh3w5ygQ3E_T_Lqk-iW9GhHJ5krlwx7VgZN3rbKdFRJ4F-y3uUutM5bVefEEH6ux-ZxCj-QC0m7H-ywS6PjA_bWmDxRP7-v0KTCfWE6MZ_QgPFwyPQNWL4AjR80WNYOg73QDWJg4lGVu4vGQK_GrHyUBPmCIS8ndSWypDC1xDd_aZMMlhtQqmOqzwSUo_7X80JYC1UFFncWD93pk80KEkDGIOojZTUTUCgrtF-BwjQ7_eAeyYy3ODORCVhQV6iZ6SuiXrYG45pJOU5faVnl73dzYpPzKdUIl37bzgnmHgfLxhipL01oTEfdhi_J7BtnC8MEOppZfcXOXrHhakSQfC274dmzUMXLP0ygvwcMNxgKSZU-U2DIZ1df88KHFgziv8YJ81gOrsAAYtPcPoYmdQtDpu1PjuW2qL_4vAykVZwi1I_UFvHlBx-Rhu3Diz23prlsd7vnblwLU7-WrdoQwg&v=404","src":"\/\/img1.360buyimg.com\/pop\/jfs\/t1\/174371\/26\/20727\/57669\/60f91c7aE9bf1b037\/d05148f8246c1f24.jpg","clog":"\/\/im-x.jd.com\/dsp\/np?log=xeTX5bmvhdZVtbVDALrLFb2P0i9hHlr4LRPy26g5u26Z_kwpRYppaj3bOuqgbKIh9NY-JPmWuPuKxSzETR_INTfELTPfDFRzZpYg-qtqS18vvImzQ2Krb-yRsl4Z91gzncABxAxx_Ek6-JHjA_fmbXNwO84rMQPCaJoe8y1kJ-VQ59eymlKYK0PhYNEuDbqWCbp73BNIj93UQhfA3NH3qC5h6xQjejfkvAWwQIK2KhcEwqDXksgpYugpwzZGAKexroK4s9EsqHX1_k2g14y4S54xoMrC0Z6m0TlGIj_V6PVhN1bYQtZSQ0kWIqPjfCwnnEuXHH9vv_ohE3mBHFfGJE4OtcBZrEx6ABSUjNwrPEXLWpEA6Sd8VUi1KE6brjZfpCaznxKDY45vQ_6LZt3RSRiGZ1RW30v36wzamx99eNUkEuNAeAyAtVJjW_KATyrPrR2IALhfBMnNvPxm1cedBh_IT1GCms1rZ64T5QdOX42e3fJAz2UvcO-fuqtu6Q8ZoEEi28Xs9Db1YQm2hX1b8oGjDVV4RXsh1IqhmyM-lmlCjnPrswbJ5i9NSILpm7BQDyntJ0-rIOQ7YJ-Gr0VZUhaISQZqrBfbiSqK1s737JjGDo1JnzbM-NpXHoE2rv1DHQKrwi5gVcj1n9nq4HOQ7iaKr3uHwDmzF1bTw0W_qP7fDMy8JKZYbymE2h1CthFjoux4i3w3QqzGku782hREEyr-wXMzXWcANgnJzEdLwf40jHg6b4l5wM9KnqGdlnsjJfxpDsIr7A-bVR4u4RGP8-6eMSVB7DS9NgOzDOGVcsM_PwnFaERd43GlcRxkyZE3bBOVxL0ub0kKQlQM1bAnLd-EjysB85sA0UiNwkMerFgVU9b_DqNKzECCHz3b3BxoIWduZT4OGQBZD8-FdvdID5b3OdFXYioqT4gQ2fuidGkeQpZvUtzrsboRCcEq7ZU9s8ZtJwyI5lDhvjFd9KTaaA&v=404&seq=2"},{"alt":"","ext_columns":{"biclk":"1#28ba5dffeb6ef71c377039a950b5b8f84436147e-103-619066#34524718","focustype":"s","ap":"9\/cXohv2lvg=","mcinfo":"03652902-15754595-3501539601-M#0-2-1--59--#1-tb-#102-34524718#pc-home","url":"\/\/pro.jd.com\/mall\/active\/2S8V4Vp7CbTw7m4UgiPjxMuo6sqF\/index.html","desc":"","text":""},"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/181176\/33\/16592\/61586\/6101082dEd1822c6e\/acd8cc9b85d04149.jpg","gid":"03652902","href":"\/\/pro.jd.com\/mall\/active\/2S8V4Vp7CbTw7m4UgiPjxMuo6sqF\/index.html","srcB":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/181176\/33\/16592\/61586\/6101082dEd1822c6e\/acd8cc9b85d04149.jpg","type":"material"},{"alt":"","ext_columns":{"biclk":"1#28ba5dffeb6ef71c377039a950b5b8f84436147e-103-619066#34524718","focustype":"s","ap":"eDYurb081mnXfVTB\/FhCFw==","mcinfo":"03652902-15754595-3501538000-M#0-2-1--59--#1-tb-#102-34524718#pc-home","url":"\/\/pro.jd.com\/mall\/active\/439NmgKSS2GShPnkRV9HaxupVw7a\/index.html?babelChannel=ttt2","desc":"","text":""},"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/177906\/27\/15199\/119108\/60f8ceddE4cc222ce\/e77b23030b85ec3c.jpg","gid":"03652902","href":"\/\/pro.jd.com\/mall\/active\/439NmgKSS2GShPnkRV9HaxupVw7a\/index.html?babelChannel=ttt2","srcB":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/177906\/27\/15199\/119108\/60f8ceddE4cc222ce\/e77b23030b85ec3c.jpg","type":"material"},{"ext_columns":{"focustype":"g"},"type":"ad","href":"\/\/ccc-x.jd.com\/dsp\/nc?ext=aHR0cHM6Ly9jaGFubmVsLW0uamQuY29tL3BjL3BzcC8xMDAwMDUwMDI2MDI_aW11cD1DZzhLQ1hsaGJtZG9kV2t5T1JJQUdBQVNHQWpxLW96RzlBSVFfcGJ4M0FNYUJITjRaR2dnNUFVb0FSamFJU0FBS2g5cFlpeDFaU3g0WjJZc1oybGhMR05wWlN4bVgySmhYMlpzWDJ3ME9UTTVNZ0pwWWtxVkFVbDhVMGhWVGxSZlNVSXNTVjlCWDBaTVgwSXNTVjlCWDFKRlgwSXNTVjlCWDFCTVgwSXNTVjlCWDFOTVgwSXNTVjlCWDBOVFgwSXNTVjlWWDBaTVgwSXNTVjlUWDBaTVgwSXNTVjlTWDBaTVgwSXNTVjlRWDBaTVgwSXNTVjlIWDFoSFgxSXNTVjlDWDBaTVgweERMRWRKUVN4WVIwWXNWVVY4TzBaOFRVbFlWRUZIWDBaU0xFWmZRa0ZmUmt4ZlREUTVNemw4&log=xeTX5bmvhdZVtbVDALrLFb2P0i9hHlr4LRPy26g5u2669ZoRqLUGkKmWd17t-pZ5sUP-CxTvvCILIHYpwfutTZH8fS6jyRTfw9SZ5BS8cEs4s9EPye6f5BX7TEvgcVQ8-IqkGsFSv5ylVG2PZco0FxC0uSEbIt44J6xCGpScZy8Ra69AhcSnQDVbg_NicNyLlNJE03quECl9wJqAscY_yqKhmlTAMy3J7WNWYyDg01NafKsb-6cosFvPinDYm33vXzvV1wgdOPjMyLtAQK5CcTe67OmwxiluN1yeM4aeZJfO5cR-V6owWy_zPaVdMb9-cf3BIkTcrldVMGjYze-LycJ1s7ryEOWTH8dPe6dKAXOS9rLdOz4pWwQRGcni6zGJxS1y5vCWj46NXhzfxcJzu-zGhK_JNZFUrjbMT973BGWQpipNuBwKAU2qO7pQiWVPwrhIstA4-TWBO8Phb54gjYivVupGtugVXbvuzv8I9RxqGBYS4-LxH8nPjujkdMJXRKHAdYGPnbsG0Zz4WWXg25Bnpp_lLZQb2a6o6utunaHUwV3sxW-Ur0Pq_E25Azz8JiXfSVUyUhTxj0dkcohaZpl-C7TOluxFhwX3dN3Jv1WR10mlJNMHS4At_-VDpSD4btKvA_TUwMaM1RiJ08XWKb8RoTKdX8eelPDnpCJKN7FOJbqWfHdIAe_LV72udK5TwLO0dsh7v3crK259YDzSoWMmZXTnDFLzQPDaFZx5d8flWw6b9Ra-_Owk9jisI13TVI28zhq2stSzSrplPatvXg85mesmzGa_1EkMrbGU7-drIlFB7DH4vV7KT-YVDm_ftPzV3btQEpNtViTb8bHKWFYMpQ2gBAVJP77gSDkBeYbZZNqofco97DKMeGK9ILrJCnF97LBHCnBfqHMVUtkPZjKh0ufyLqbhyzDGV2bH1LixPQ7AoLQG4-Q-rmAcAX1tIkMBRg460U5049Ryv9chrTpV0QsqHDHEe9IBpf1AlAevYG2WdWlpxw89f2FudHieoVh88bSLZk_sYbDk32qWtLH0tHBiv_5v5r0yowXXxdiD-0b1Hjy5K57k6kDryHrq&v=404","src":"\/\/img1.360buyimg.com\/da\/jfs\/t1\/115084\/26\/2311\/43120\/5ea1390fE331e06c1\/2f30e77d3512bd5a.png","clog":"\/\/im-x.jd.com\/dsp\/np?log=xeTX5bmvhdZVtbVDALrLFb2P0i9hHlr4LRPy26g5u2669ZoRqLUGkKmWd17t-pZ5sUP-CxTvvCILIHYpwfutTZH8fS6jyRTfw9SZ5BS8cEs4s9EPye6f5BX7TEvgcVQ8-IqkGsFSv5ylVG2PZco0FxC0uSEbIt44J6xCGpScZy8Ra69AhcSnQDVbg_NicNyLlNJE03quECl9wJqAscY_ylqEtTV9zHXewuco3UW_ZeaIFrp8jxrT6KZwXetEGeSoWk7iClKNw_RTh3VIShFcgnVEPbouCn_h6Pk6Ezbn-1DS32aiu99WqlpDTPj4Xi4NWXNg9PQVj6LtGsjolNqy-6JkhuSM77CEqCE1VrAQXyS96X3gn_uIXwfJUUhAHuFahXyi3LYmReyjfE7UhguZCimD-YtA5dOA7115c6-29vAXpz7q6lykpiZJHYEqyGnwWQ8EViHSSr4-PSGFI_fNjVrGcGxISDAjvd2xqQG8WEd945ebFqeHiad_48MQ23yJXpnU4cifYO_-CSX3hCIAq7DjDBWXNkbjOfUSuIEKO2hvP9YddnlYPO-YpG_WnArxj0Dv2kXNpzJBaS-BvlDoiHc2ZgF3LD0rIv1OvldJVWbHteqNmn8WsIupunGb4qidAjQqza65PTTDQvj5ISDjIzP6YT3cQBzpS_vvZFOKrttxaNGVgalmM9fo62VKnBtaeMQBeHxdtWpuPuWVyn_T-SqHbnc7GHuqvjGnhSUwJP3H6eBII-fOlZqIG85efZkmMhOeyFP9LjmAvBP5LsHmLrQcj8fpnD9EnbZ_MrJzERlIyyyOu0ZdiMfpJONJAn7_4OJ9bS4GceQCOLEw1PtOJSmuMP7l7aQbN3vSMw1It4Za3M56OP9SSU6Q2LsAlD4pleQqiFdTvKxtJa7m-SeSYzfe2-na9wvH6QLhLosrRYw6etfmxHgUtq7xbmOKSzY7KZ0hPSOAVRmbeEKL2A0wydjej29Dxkk5tbTDSQZgkwwwwmaD1uzVnMjqnpU3pQQiD-g8WJt0Tb64bTlMNX57195w_NF4wS_9nNconyGGRI8&v=404&seq=3"},{"alt":"oppo\u65b0\u54c1","ext_columns":{"biclk":"1#28ba5dffeb6ef71c377039a950b5b8f84436147e-103-619066#34524718","focustype":"s","ap":"Cwm2dpG4Vb2apqfSB8\/3Mw==","mcinfo":"03652902-15754595-3501539651-M#0-2-1--59--#1-tb-#102-34524718#pc-home","url":"\/\/mall.jd.com\/index-1000362603.html","desc":"","text":"oppo\u65b0\u54c1"},"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/177180\/18\/16529\/44783\/610121e4E87533a30\/0759d92fa30ab518.jpg","gid":"03652902","href":"\/\/mall.jd.com\/index-1000362603.html","srcB":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/177180\/18\/16529\/44783\/610121e4E87533a30\/0759d92fa30ab518.jpg","type":"material"},{"alt":"","ext_columns":{"biclk":"1#28ba5dffeb6ef71c377039a950b5b8f84436147e-103-619066#34524718","focustype":"s","ap":"SgKo7umK0RpIMKklC5Vtgw==","mcinfo":"03652902-15754595-3501539587-M#0-2-1--59--#1-tb-#102-34524718#pc-home","url":"\/\/pro.jd.com\/mall\/active\/DvUAQsnWBkjDqX5ehMYWkRD98vK\/index.html","desc":"","text":""},"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/180062\/8\/16149\/78595\/60ffa3c8Eda5d1204\/8cd64dab1b810303.jpg","gid":"03652902","href":"\/\/pro.jd.com\/mall\/active\/DvUAQsnWBkjDqX5ehMYWkRD98vK\/index.html","srcB":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/180062\/8\/16149\/78595\/60ffa3c8Eda5d1204\/8cd64dab1b810303.jpg","type":"material"}];
        //首焦兜底(新)
        window.backup.focusbak=[[{"alt":"8.11\u96c5\u8bd7\u5170\u9edb\u8d85\u54c1\u65e5","type":"material","srcB":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/197124\/4\/1326\/267718\/6108af21E06e3216a\/4b423f94b533f232.jpg","gid":"01143922","href":"\/\/pro.jd.com\/mall\/active\/3dG3iRTrGPqFhJ224nuE4DWKwwW3\/index.html","ext_columns":{"biclk":"2","focustype":"s","ap":"34Tl6qhS17YrSBsj+Qcibw==","mcinfo":"01143922-15862532-3601546491-M#0-2-1--1001--#1-tb-#1-#pc-home","url":"\/\/pro.jd.com\/mall\/active\/3dG3iRTrGPqFhJ224nuE4DWKwwW3\/index.html","desc":"8.11\u96c5\u8bd7\u5170\u9edb\u8d85\u54c1\u65e5","text":"8.11\u96c5\u8bd7\u5170\u9edb\u8d85\u54c1\u65e5"},"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/197124\/4\/1326\/267718\/6108af21E06e3216a\/4b423f94b533f232.jpg"}],[{"sourceTag":"0","id":"3503","extension_id":"{\"ad\":\"3503\",\"ch\":\"2\",\"sku\":\"23851862117\",\"ts\":\"1628688782\",\"uniqid\":\"{\\\"material_id\\\":\\\"8870438170049359106\\\",\\\"pos_id\\\":\\\"3503\\\",\\\"sid\\\":\\\"1da606a8-8d3a-4155-aab9-c878fc56fade\\\"}\"}","ad_billing_type":0,"src":"\/\/imgcps.jd.com\/img-cubic\/creative_server_cia\/v2\/2000366\/23851862117\/FocusFullshop\/CkRqZnMvdDEvMTg0MTM0LzM3LzEzMjU4LzEyMTk0OC82MGU2OTllZkUxMzRiZDIzZi8xMmQ3ZmRjYThmYTljMjE5LnBuZxIJMi10eV8wXzUzMAI47ot6QhcKE1BhdWxtYW5uIFDlkIrnur_nga8QAEIZChXlpb3lk4HniYzlgLzlvpfkv6HotZYQAUIQCgznq4vljbPmiqLotK0QAkIKCgbotoXlgLwQB1jlkLrtWA\/cr\/s\/q.jpg","ext_columns":{"desc":"0:cpc","focustype":"g"},"href":"\/\/ccc-x.jd.com\/dsp\/nc?ext=aHR0cHM6Ly9jaGFubmVsLW0uamQuY29tL3BjL3BzcC8yMzg1MTg2MjExNz9pbXVwPUNnWUtBQklBR0FBU0VRamxrTHJ0V0JDdDB3Y2FBQ0N5VFNnQkdLOGJJQUFxSDJscExIVmpMSGhuWVN4bmFXUXNZMmxqTEdaZlltRmZabXhmYkRRNU16Z3lBbWxwU3FNQlNYeFRTRlZPVkY5SlNTeEpYMEZmUmt4ZlNTeEpYMEZmVWtWZlNTeEpYMEZmVUV4ZlNTeEpYMEZmVTB4ZlNTeEpYMEZmUTFOZlNTeEpYMVZmUmt4ZlNTeEpYMU5mUmt4ZlNTeEpYMUpmUmt4ZlNTeEpYMUJmUmt4ZlNTeEpYMGRmV0VkZlVpeEpYMEpmUmt4ZlVpeEhTVVFzV0VkQkxGVkRmRWNxU1Y5VlgwWk1YMHd4TWpnMU5UdEdmRTFKV0ZSQlIxOUdVaXhHWDBKQlgwWk1YMHcwT1RNNGZB&log=vkqtBuhG_JnnwDoREnznCHJAdGH2SExujMMCyqIuPV_t0lq4n31oiqrKSdU3qrCCSLF8WjcP2d36lB9t8ww9pab4AQwBG2yPktHXX2bEImtADTThMElufcIX2pGRMy4Icxif1-DHlWdz4Uhj7cxKkNcdsWZ-0_cjLkzwVl4sU3AQi-0Xj3QqYSZfzAfBi3s27OaT9wDQDhlaZxy6x5WG05CIu8BIiuJhmK_UG_dnszEz2oyO-cqr373I9PswH7J3OKqDm8HrTBCov6fVzCFeAVnxiDOOxfhIxFJjQFno6X_HOHo22VWlaUF5ngnmU7LUcYSrMT9KA3TgJZ5OTMDq_rK56zhCXWrvCrClNCnJQSk6DUxw791UEXOCXApIEjs-IQZK2Oq-ZktF29F5Rnf59et5YF0fSvCS6hxSp60VhIUgDaLWBfLYhU5LJBMXsv8CBbDIgc2QkcCftmXURirrRoHRGZc1pQDnB-W1zZwQnWeK4s2UrYP5dipZik0ZHRGMzvMHgwyqYalpRW0A11aOL2gcyIxeR5pqIfZWWHXpboJDPc068c038uOxV1QyOBMO8MhJwnbGj8DKDPD3orW5RUAcHWGHr1baURkUkFvDN1zbEm88bIdZiWmW5qrK30WvW0yc3J0rLle1F2TNdXvALhr00Rj2fkkhtks_h1LOzLRXKmlWuR01bQA6boEz0eliRpwdXyFU-OCuardFnOlQ1QDRAZgoy0MNiNcft-SMb-RU2GMf9euXaQYXEoI6RgwC1eaYV8CsjLapKr09J4DB7CQWLtDxGfCvCdd_MqKlccPfNFVkNU4iTnLkMknChaNIIAX4AEHl0lrip4y-qcQzrlouGYc7DhERNHbt3agcGKsZExEBsYxW543WhRN1nNB-Po1DTcAltUKYucQhlLebjX5f5FbhX-DQ_bAzzZVTj8Q&v=404","clog":"\/\/im-x.jd.com\/dsp\/np?log=vkqtBuhG_JnnwDoREnznCHJAdGH2SExujMMCyqIuPV_t0lq4n31oiqrKSdU3qrCCSLF8WjcP2d36lB9t8ww9pab4AQwBG2yPktHXX2bEImtADTThMElufcIX2pGRMy4Icxif1-DHlWdz4Uhj7cxKkNcdsWZ-0_cjLkzwVl4sU3CVMtD1An-YM8Gx1h8oV2wMkCfBubr1VaKBiqHgbaggMl4r1YFozK_E7QNIuWbWkFQsalfEQpaW8x1AFkY0_48x_Kqo7c9ddDMCWTTiXLfjITZRh7lFsTPwsUKtw_cNYH2l9QGP6UNsS2lxYekm6n8U3wYsuri7nMMHaEEjto8iLtz6WqXH0odTYp0HnsTlg7sTmY15xoHkjKaNqTCKGjWn90yl4-DIrNxQBVreE7304MJUdO5JpR5cFB965fFwB_7schkiGRVYbDALuu5HVzgsnC2W9H6wVTgS_tMjty1-WSYHYgk1HNFSxkpc7h8welFjfi96WpGOwfIsMEsOAL2rgLzVp3LtRecwu3qDiz9c2-mfH_zOoiqaHEl6VKZuDmDu9VPhh6I7Xo_a4lGWE4tOmGcAvTLYD-Y_VHZfQHzeu7kx_zFcuFCeg7-y9y91QW84Ctcl61tzQZDUTfgaSG6YqkoG_0r4RgK4w5sT5Om8OtLcfpV_ZvLIt7lAHaYgRElRq8DDhH4lbXTlpvLFiFOH2iVigpVcemsayVZ1KaeWaX8Qpnq13B7Bopn-eJwzJZlKRCB_Im_Mes3jxoDpvEb4Bv_geicUvjIQsuWUWVSs8XwnsuSiIgoL9JXwZpMzuhVsGwv3tiiD96BQNtSpuQzUwefvzUzSsrdKFdHy5pkuSHIDxjfazyyLgU02ZnC3iWwGm7_h5GYCz2TghQTuC4W9BOE-qv6RE0yREAHC4PjE750UJxFJXcG1ThrXkL_WEV0&v=404&seq=1","type":"ad"}],[{"sourceTag":"0","id":"3504","extension_id":"{\"ad\":\"3504\",\"ch\":\"2\",\"sku\":\"100009779201\",\"ts\":\"1628688782\",\"uniqid\":\"{\\\"material_id\\\":\\\"4469069355\\\",\\\"pos_id\\\":\\\"3504\\\",\\\"sid\\\":\\\"05b5ed56-3395-4156-b580-461809fe1bc5\\\"}\"}","ad_billing_type":0,"src":"\/\/imgcps.jd.com\/img-cubic\/creative_server_cic\/v2\/2000366\/100009779201\/FocusFullshop\/CkRqZnMvdDEvMTc5NTEwLzM3LzEzMjIyLzMxMzczMy82MGU2YjZiMUViZTA4MzM5ZC9jMzJmZjk3NTAzZmJmYjk5LnBuZxIJNS10eV8wXzU2MAI47ot6QhMKD-iSmeeJm-ebiueUn-iPjBAAQg4KCua7oTY55YePMTUQAUIQCgznq4vljbPmiqLotK0QAkIKCgbnp43ojYkQB1iBwLDI9AI\/cr\/s\/q.jpg","ext_columns":{"desc":"0:cpc","focustype":"g"},"href":"\/\/ccc-x.jd.com\/dsp\/nc?ext=aHR0cHM6Ly9pdGVtLmpkLmNvbS8xMDAwMDk3NzkyMDEuaHRtbA&log=mniBk-pbIsYc5r4zsfhNaryT8lEznGsu-4h6YtVxOlkHlG_ZDHWkMSKEPNuiTu1L1En24HzOZk0tRXHQtKKJ2ET4NXIzS1zWVF4pVGQgZwFE3Bey_v2PkH7MHXXPBRKSoe9Rr8ZcpZEJDQs-hA6SoEj95y7vJ4aWhIWdIiwHTdPfuMvhXq0pzhKpQU8YR_jdeTssc0RXwHxlTDNW1oo64b5VPeWrQip4XftjbGKaK3VKA8Jjz5uGFRZ5cswPpN1_LpV72iDJawc4ARrey_co7HP5HmL296XWsAtP9NKrCpwzWUBOJXvjCYAg_oTk8xu8ddPulOeWRunnSqQwi3umr_eMH_A74rXlk9PH5TvvugVoJpLaoLLeAWSynK6UUQOjF_cMsHzFifUlgnhqALUby61iACGhPtIY5URzN-msv02LFHKUwfM3RyHzfBg1sqGKEtrrDs8afQFhlQ0KQYZ1-xWTs-DJQnCdm48nfhAufVGxlPVM1TIIu5gDJ86WOmCsmaJfJfndD-uv0U1KmXcAzPEhQ2eBneybojIHGLjov5YFbTJZeISkfXZV2g-vSqqn43r39HyH66hjUBwQChcT0ldEHHR_H6_DQNj4ZvyYLpRvIFNV8IxJs0AUuFvHzBsCuZ1HvdYuGxW_Rbbne7oiVpK7bMIneD7s9wL-ppHhgI1-YGECom8unDeHKchkNeKUO88NbG_MB0OxqfhnB-0wSMliDSnyAilXdsJDaRlKWMQdsZfm1d95vqDArkzW_1m37aYXKb_Cg9995uX3Eq7IBOZzKV-lr4KJOz5md0hpDKc5K7aitgqBYTUhReDuL7U12aiwp9eIs2q7MNBfQFlnAHzN1-qaIZmhNvXidEecrJviZMjmWecushR_Xj_a7lExJih2IqueSVpbYcG8TqomJ1W-9kPy4h0qOSJIHN1_DabcB6leaBPoZwEyR-Vgi87RuA-NGEIa03yXCdJ-xHzy_wOwSH0PwAqZoO47OOZMkqM&v=404","clog":"\/\/im-x.jd.com\/dsp\/np?log=mniBk-pbIsYc5r4zsfhNaryT8lEznGsu-4h6YtVxOlkHlG_ZDHWkMSKEPNuiTu1L1En24HzOZk0tRXHQtKKJ2ET4NXIzS1zWVF4pVGQgZwFE3Bey_v2PkH7MHXXPBRKSoe9Rr8ZcpZEJDQs-hA6SoEj95y7vJ4aWhIWdIiwHTdPfuMvhXq0pzhKpQU8YR_jdzfbTrfSsygu0-ib1s2TrUj3dZpBzJ2nQtCu3glzxrw6055pfuopki7K8bk-_7qbE65lbehzEjbJ3jbKN9KG0NdQ-rj7U4UOBzJSqLBy6srMW9vjBFFzpiW5As2IgHOnnym6tf317sqwtxo_ftTv_xwtB5D4K1Jn2pnjmxeLcsoI_tVOpwkMXc2WJxmfKOuY5Jc5L1cN_JXjou6I25Zjyw62OTK8wR16MDJg0VrW2gvZ6dCj7ASdmS-GhevHCqaon6N5miUulipoMyw_cp-CwKy2KZmB7deKDue98vXUF-bKpjIWuRnwdoBOwu8LmuLcVhwxNKNa2Oze_yHCwqb5p4tDE2qzk1r0u72Cf3UfZbx_SDW6etYNGSQounDNdx58NdK38DDCThMJJCCuS8mjOwjnqm5ANAmz4wWvoJLcInvRwE1_WhTtgvMiBBIiAXGk2yyyilmqf7RNKCCNVLog25AkQYDYsB80kFRpBkLRrq6CnNp_fgN5Z3QRyY7KFYn7P0xrtbWGwfHVSFlYo6S4DZ1oFG5ElBUJo5g43qYVcg5vcUKSDxWL7ePuRqp2HpErilgPcJzpezd5dn49IpBx__lI_biEzrBY4IqyYFMF7_Oellu_GW2BUHY0W381AlMgoOeZXP6t8d-SFPGY7tuKiVJIfyieH7O3eKwzIO5J7H-qpsqohXjWY1vICktQ7gMYWB2kHs1QBLQod6-FluykG7-dnFSAO3urYEmAkBlceS7CyORuYeG1-R0gNijbqxR78grBCZPLONRQ_ywYlAM_2SSSdKjPC1hBK1hAUhvXsiSk&v=404&seq=1","type":"ad"}],[{"sku":"100020542894","did":41,"src":"\/\/imgcps.jd.com\/ling4\/100020542894\/54eD5r2u54OtOOi0reeJqeWtow\/5aW956S85L2O6IezNeaKmA\/p-5bd8253082acdd181d02f9d8\/670dc001\/cr\/s\/q.jpg","href":"\/\/pro.jd.com\/mall\/active\/PaZr2W1vSg5CtxBQnC2gCbRAQXc\/index.html?innerAnchor=100020542894&focus=4","type":"delivery","ext_columns":{"link":"\/\/pro.jd.com\/mall\/active\/PaZr2W1vSg5CtxBQnC2gCbRAQXc\/index.html?innerAnchor=100020542894&focus=4","sku":"100020542894","playImpr":"1#13#300002-4___","mcinfo":"null","rt":"2","text":"\u71c3\u6f6e\u70ed8\u8d2d\u7269\u5b63#100020542894","focustype":"t","desc":"\u597d\u793c\u4f4e\u81f35\u6298","biclk":"1#13#esm:2-B0054876-1-100020542894-esm:2-0#378#B0054876#41##5bd8253082acdd181d02f9d8-0-"}}],[{"sourceTag":"0","id":"3505","extension_id":"{\"ad\":\"\",\"ch\":\"\",\"shop\":\"\",\"sku\":\"\",\"ts\":\"\",\"uniqid\":\"{\\\"material_id\\\":\\\"8470296728046739389\\\",\\\"pos_id\\\":\\\"3505\\\",\\\"sid\\\":\\\"0d2549b4-e4da-44b4-8344-790f7cd00afc\\\"}\"}","ad_billing_type":0,"src":"\/\/imgcps.jd.com\/img-cubic\/creative_server_cia\/v2\/2000366\/56260009421\/FocusFullshop\/CkRqZnMvdDEvMTgxMjAwLzE4LzEzMjgzLzMzNzcwNC82MGU2YzVjZUU2ZWY2OWE1My82MWI2YzM1Yjk3ZGJiMzUxLnBuZxIJMy10eV8wXzU0MAI47ot6Qg0KCVRTVOmdouiGnBAAQhkKFeeJqee-juminOmrmOS7t-abtOW7iRABQhAKDOeri-WNs-aKoui0rRACQgoKBuenjeiNiRAHWM277srRAQ\/cr\/s\/q.jpg","ext_columns":{"desc":"0:cpc","focustype":"g"},"href":"\/\/ccc-x.jd.com\/dsp\/nc?ext=aHR0cHM6Ly9jaGFubmVsLW0uamQuY29tL3BjL3BzcC81NjI2MDAwOTQyMT9pbXVwPUNnWUtBQklBR0FBU0V3ak51LTdLMFFFUWdwTG9CQm9BSVBRS0tBRVlzUnNnQUNvZmFXVXNkV01zZUdkbExHZHBaQ3hqYVdNc1psOWlZVjltYkY5c05Ea3pPRElDYVdVNk9nb1NWRk5VNWJxdDZJbXo1TGlUNVkyVzVicVhFT0txVVJnQ0lMMl9oSXZ5djZMR2RTam9nTk9TQVREbmdOT1NBVGdUUUlDQUlHQUNhQUpLb3dGSmZGTklWVTVVWDBsRkxFbGZRVjlHVEY5RkxFbGZRVjlTUlY5RkxFbGZRVjlRVEY5RkxFbGZRVjlUVEY5RkxFbGZRVjlEVTE5RkxFbGZWVjlHVEY5RkxFbGZVMTlHVEY5RkxFbGZVbDlHVEY5RkxFbGZVRjlHVEY5RkxFbGZSMTlZUjE5U0xFbGZRbDlHVEY5U0xFZEpSQ3hZUjBVc1ZVTjhSeXBKWDFWZlJreGZUREV5T0RVMU8wWjhUVWxZVkVGSFgwWlNMRVpmUWtGZlJreGZURFE1TXpoOA&log=AtlEFRvbjNnTBRE_8lveJQJmo4lb5i40AqkEVp1jzZhydoMCbGWvs8fno_fAMu9ilm_r8JJHUAZ3Z4DWbqt5KQR35eE4l3ncamPAIn-i2Yd_2yAavrNVvNUW0U6X0_D8ku8-Y5hr7HTeMT2IsP-Kz20vSdJHGISyR37NzLvLHKLR4jME6znStOk73ofmKF4uyWUUNhB_sM6FU-sUlF85DfsQQgiDpsVZq6mdN4ylMlWGp7FA6R_8noBrmOUDyoRPUp5wNQqP8ph7wXfHAMUbPfXoyZ-eun38-Akd6D2oleN19NuqijJQZeKJ89HFeL15J6_S6UPQpbSfkowbdcJgwTBEAnY9aBrANP-rWRCLQSla0_X7G1nyDdUIQKWcd9iJD6hxr75OuAOUS7jSQ0MA0nnuTKTjdeY4M0wOEHrvmcnmCPgHGpEf7P0bgR0GqaQknLhWpdEHGof8b-GUhwUc7z7laFvfXzQ9gxDZ0J5pg-LUT6vWuwPgVaE2gq1xr_zs1-pkfgXnDIEIbWC_G6SKdIgyG2whrqcMRU9hususHFVnKi8UZEULzs5nh7j0eD0gXS0tA2O2BlZeVgPjzCvDLaG4PS3QpRCHW-VKn_1x8FgCW47iFb_zBvvXxQh4wUCUo1kUk-UhtJTRzRwijWWuizFHxxq3t2Omxu84HVd9NcLd2d92yqRIwNpctuLsyuTow4rDu3SmpH520VTBvFGGaokUB3PMQtCExU_GphVKZtYdB2nAeQ60f0NI93LNFjztzE1dZXBG4RAdpWi-Yu3zSeJ5F5hbkr2SZTYudPgFNv3UeFODyVzrPaVjMiaws3CZV9QFOhsYU8En0ktFvjzlxLHh-UZXwyw6AbHxPmqX9z39gpH2-DFYz9WrIck1croXHZwPdXUFQf9E8M_eOUeq9R5gpOj-5CCoLTXU1JMggvRecntz9OALiRx0rC4TFi9M3i0LIjFBchFEx2iVObbCCA&v=404","clog":"\/\/im-x.jd.com\/dsp\/np?log=AtlEFRvbjNnTBRE_8lveJQJmo4lb5i40AqkEVp1jzZhydoMCbGWvs8fno_fAMu9ilm_r8JJHUAZ3Z4DWbqt5KQR35eE4l3ncamPAIn-i2Yd_2yAavrNVvNUW0U6X0_D8ku8-Y5hr7HTeMT2IsP-Kz20vSdJHGISyR37NzLvLHKLR4jME6znStOk73ofmKF4uM2ZEb8osCPFpvPlVjcsVYBQ1a29BqtFtQx4x6MIRCavT5xcp7vQNTGW8fpKBb456Tlv1K4Gym-ScjVsRq_QB00C2jNxsgXql8iQK7LXmTHD6bHi3EP6XfGH1dYZhlJ1shRuLhk-QzdBg3VQf3YeUuTfyeo4QT6Z-fuxKlnQGaGbJ7t4ttWG1jWNNuJG6a3S5gduFqj29zH6k8FmFysnmzIw_hAhtbdlqBBk7HGrvQ73OFt4RM9xdmGc1izXRIXxg-_-r-RhJKcgOiV7WzvodXMJJlscpWyLh0aidjecbBpHKnCVGrNSZYT8vClNYp-o30bhavcD8bwfZD_GZyrlQSq9-IQYB8sNznP_ZYP6JAudCCrOZndcnwjDpmdQlxYMkI5Jm4Ei7H4yVl0ol1ng_J1p_76E9Sbw8RnLT863sl4dXqKSO-senK0zsJjOJeO6PApT84u0dlUqGLpgLn9TeQOV1o_olKQUOc6LavMDyn7xJ8_7yQoVDvXT80PrDGTHvJTJLQXyC13bBiKJeYKGzlCn2DZ9Co-SJc27XBNEn8flHKl3lDr510eFZDkBY-TKmCqma5gI9_Aw8_hn_e8VIw1u-YFMJWOIE1AJCK1a6ypuu3h7MO3UmpoSJMbXHo-l8ghzMXTYy67iBuH7COUkXJvm1jW3OvdvKKcEOSiKl3n53_JEzYVl8cTX29zEB5mF2dc8Wdky3vDtzCQWNY7biIKJu0JmW3RMyMOlJXduR-aeuiaBYQvTTKmJDh4foE-gXLTpqMvNAkhH2EGCsr4BMIVb2nXCKyfRQIpv1jskCndA&v=404&seq=1","type":"ad"}],[{"sourceTag":"0","id":"4272","extension_id":"{\"ad\":\"\",\"ch\":\"\",\"shop\":\"\",\"sku\":\"\",\"ts\":\"\",\"uniqid\":\"{\\\"material_id\\\":\\\"4494154857\\\",\\\"pos_id\\\":\\\"4272\\\",\\\"sid\\\":\\\"e839a163-9b07-4c21-8694-3c5c634997a1\\\",\\\"type\\\":\\\"1\\\"}\"}","ad_billing_type":1,"src":"\/\/img1.360buyimg.com\/pop\/jfs\/t1\/199548\/37\/1592\/91108\/610b90a2E8bf35b53\/b4466c51dd22bca7.jpg","ext_columns":{"desc":"1:cpm","focustype":"h"},"href":"\/\/ccc-x.jd.com\/dsp\/nc?ext=aHR0cHM6Ly9wcm8uamQuY29tL21hbGwvYWN0aXZlLzNBdllGdFdIeUg2Q2pCNnk0ZjQzRGpKRXFNd0wvaW5kZXguaHRtbA&log=xZNjWbk31ZTXYeHfyLbdkntye0TcxLbze7iphxg5N31ONdQWhC6r556_tu_AGJi5XLJ5U9ISXHmKYkIpvKurtclLqtzs9sROoWz3jPnrOd_5mALo5PL4zTMj7sP3I1LdREGSOjtsQ6HDoWtypohi1-GCQ7_yOdSvgXGLSDtUlohPzuGrrnM0eARGCphsXokmuX8MFqph-LrUvEb3_ySxPjyx4rHEbgTuwu6XHYLJ3hVg9-D-8imHkD8HK-TKcBnt_PoDQjGX6Ryq7b0ITjNfLssIDUrtvYOl_U44-LgyGHeH84_gw5vjNvMQBlFPqnIedCvbvTyytxSJnytlbWn2uErlAO2bTRioo32Ck25Q_6ZkmIj3hpQlpsMaNwDovds8W-Rjau7flqrgHTCCIxv9AqJ6h4ihFP2SQb3IWRt8CrWHDf9kNHGrt8JDAosWBxWaOBmj1h_-xoF0SfyE872xMBfo_zfmKoGp7cl-uV-vlrK58i6KGhB1tzEzOVsd72vSAd9KvJnmQQvTNMEUrJdkzyXqMiUAoOudewMb0V3DIkV2KPmBYzNmS2uKZ7KRPEiBpCu4MIWmQmlWB77S8niJx3TUhctcxp5RP9ub3vPgkWNLkDdQjdTnbswfJ9JBslUURUNgUIo3W2Mx8I9C_z769zMYMaHFS-3kxXqieHt8OhREFIDlAti1jYWzNNMtCOZgydBeKekXSgHtfdiGTif0SrTcwzWipH0J68jmArUIwB6YCI7P2LSIqeJltG_NaqcYjk-xkWxe5p_RsqZTqowP13XWPoerHQ91ULAiyjWa5vjh1W82tiupk1GhkOa6kZeDd6OV6e3I5kdDT8j2GTzwzhbcjo8HnSDi65ksYXcSxWxY12JC3-gn8VcQ0NC_rXgChOQiNbP9ZA1f5l17gfM3nLFdHikJNvFk28BBjuwWJOQ&v=404","clog":"\/\/im-x.jd.com\/dsp\/np?log=xZNjWbk31ZTXYeHfyLbdkntye0TcxLbze7iphxg5N31ONdQWhC6r556_tu_AGJi5XLJ5U9ISXHmKYkIpvKurtclLqtzs9sROoWz3jPnrOd_5mALo5PL4zTMj7sP3I1LdREGSOjtsQ6HDoWtypohi1-GCQ7_yOdSvgXGLSDtUloh8gW6z8AQXNpuN0k3NY4BGmOpf5AkRgz4oOq4Iq7Mr763J1lfzr39UP8x329bJRzeRrHYTNPflEAvJnDYp0Uz2h5f-bXhyKqn7LbfJdU5kAWZ10iVOZUnJiOGOJxMdYofhR_stGxdRAmyhKxOzMkMcGfyppygvEon1gr2AKEkXd_q9UCKA6MoUQmIQEmvSaIZSnbWVMxNl79O3He7wo_Y_QgzNmPy07tim_uFluSDSSK7_eU0ebXdyILyLY5uft6QdrvbJnMgExQSByYWqeE7ZiUllREGXP7jb5NmQljBV9xMxKNmPpC3C5m-kXoVCXQspVTqIhTtKQ_fARGNzs5AVn67npIUc3Ht6w8CLZbaZCbkpjlntZT-2ZqDztDQ1OnClSpGpE2YXu3Gq4cL8HYzPJKvZUaqU6WBAG2KFpOaglFB42FnZ7upK0Z6azL2ZTMr5-pjkG1Mz-56tAHaj9VVNW-ghhMThY_HAR6vq618AwvfeMhumwcLAMwIO42uJngQhBi7aHJ1k4QkD2oKshJ4LBpnZKSczKGqoZuld0XusIBOBxbwLPpAzmvlHkwDo5FQsRZdps5-EVQYou2T_apCliepDTnQT_uWjwWXztx97Qc66Xb5ouMkycxNwsd37mjdcwdlsqR1SweYvkSPq5ItfNc-LHm-I9d0LqcqyQ9xFPGsZ15iJni-DQZcRe3DOgydkCfqIL5T-xLXekysLG3XG0WTp-OzTv4kJwru8RlDkUZsu4-KVLAoZ2jhsKOT3wps&v=404&seq=1","type":"ad"}],[{"sku":"100008492922","did":41,"src":"\/\/imgcps.jd.com\/ling4\/100008492922\/5Y2O5Li65a2m5Lmg5pm65oWn5bGP\/6ZmQ6YeP6LWg5YS_56ul5Lmm5YyF\/p-5bd81f3682acdd181dfeb407\/80ffb3f3\/cr\/s\/q.jpg","href":"\/\/pro.jd.com\/mall\/active\/2giWc4t1FCk5Xsr2QU4G6AZGrvXr\/index.html?innerAnchor=100008492922&focus=4","type":"delivery","ext_columns":{"link":"\/\/pro.jd.com\/mall\/active\/2giWc4t1FCk5Xsr2QU4G6AZGrvXr\/index.html?innerAnchor=100008492922&focus=4","sku":"100008492922","playImpr":"1#13#300002-4___","mcinfo":"null","rt":"2","text":"\u534e\u4e3a\u5b66\u4e60\u667a\u6167\u5c4f#100008492922","focustype":"t","desc":"\u9650\u91cf\u8d60\u513f\u7ae5\u4e66\u5305","biclk":"1#13#esm:14-B0054847-1-100008492922-esm:14-1#378#B0054847#41##5bd81f3682acdd181dfeb407-0-"}}],[{"sku":"3560752","did":41,"src":"\/\/imgcps.jd.com\/ling4\/3560752\/5LiD5aSV5YGl5bq35aW956S8\/6aKG5Yi45ruhMzAw5YePMzA\/p-5bd8253082acdd181d02f9d0\/996a8599\/cr\/s\/q.jpg","href":"\/\/pro.jd.com\/mall\/active\/2j8en3VE8FvSJFrepxePFvESP4FY\/index.html?innerAnchor=3560752&focus=4","type":"delivery","ext_columns":{"link":"\/\/pro.jd.com\/mall\/active\/2j8en3VE8FvSJFrepxePFvESP4FY\/index.html?innerAnchor=3560752&focus=4","sku":"3560752","playImpr":"1#13#300002-4___","mcinfo":"null","rt":"2","text":"\u4e03\u5915\u5065\u5eb7\u597d\u793c#3560752","focustype":"t","desc":"\u9886\u5238\u6ee1300\u51cf30","biclk":"1#13#esm:40-B0054843-1-3560752-esm:40-2#378#B0054843#41##5bd8253082acdd181d02f9d0-0-"}}]];
        //首焦兜底
        window.backup.focus=[{"recommend":[{"alt":"","position":1,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/160427\/8\/216\/44383\/5fea8b3cEa4deb858\/fe57a084e88526f3.jpg","href":"\/\/pro.jd.com\/mall\/active\/26AGXsmM6AChBJXAvFuMKZ8h5T9E\/index.html?babelChannel=ttt18","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"Zag\/g9b0Dld+fkfVf4Suog==","mcinfo":"03294000-13573946-8801423632-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/26AGXsmM6AChBJXAvFuMKZ8h5T9E\/index.html?babelChannel=ttt18","desc":"","text":""},"type":"ace"},{"alt":"\u8fd0\u52a8\u6237\u5916","position":2,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/160199\/26\/187\/69636\/5fea04ceE5abe2994\/d12a85889d01cd15.jpg","href":"\/\/prodev.jd.com\/mall\/active\/3X6GiZeEUSw1zfbYxzhVfQpFXbWu\/index.html?babelChannel=tt9","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"5+Gcq+Ev\/0h5o09w5iB1hQ==","mcinfo":"03294000-13573946-8801423635-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/prodev.jd.com\/mall\/active\/3X6GiZeEUSw1zfbYxzhVfQpFXbWu\/index.html?babelChannel=tt9","desc":"","text":"\u8fd0\u52a8\u6237\u5916"},"type":"ace"},{"alt":"","position":3,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/151690\/5\/12181\/71606\/5fe9bf3bE80b775d9\/d67be1ff0b8fa2a6.jpg!q90","href":"\/\/pro.jd.com\/mall\/active\/2tRyWk6vGETjF5aPtAZoXxdnddYA\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"gIoMIiWo0D\/LhPR2RJZQ2g==","mcinfo":"03294000-13573946-8801423636-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/2tRyWk6vGETjF5aPtAZoXxdnddYA\/index.html","desc":"","text":""},"type":"ace"}],"banner":[{"alt":"8.11\u96c5\u8bd7\u5170\u9edb\u8d85\u54c1\u65e5","type":"ace","href":"\/\/pro.jd.com\/mall\/active\/3dG3iRTrGPqFhJ224nuE4DWKwwW3\/index.html","ext_columns":{"biclk":"2","focustype":"s","ap":"34Tl6qhS17YrSBsj+Qcibw==","mcinfo":"01143922-15862532-3601546491-M#0-2-1--1001--#1-tb-#1-#pc-home","url":"\/\/pro.jd.com\/mall\/active\/3dG3iRTrGPqFhJ224nuE4DWKwwW3\/index.html","desc":"8.11\u96c5\u8bd7\u5170\u9edb\u8d85\u54c1\u65e5","text":"8.11\u96c5\u8bd7\u5170\u9edb\u8d85\u54c1\u65e5"},"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/197124\/4\/1326\/267718\/6108af21E06e3216a\/4b423f94b533f232.jpg"}]},{"recommend":[{"alt":"","position":4,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/151106\/13\/12106\/70958\/5fe5669fEeb4a53c5\/ff4c2841360b1db2.jpg","href":"\/\/prodev.jd.com\/mall\/active\/2KS7qX4VEn8pt5atxK5W1jGAvrc5\/index.html?babelChannel=ttt32","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"IRwFC2C28awBBlITEyBAiQ==","mcinfo":"03294000-13573946-8801422732-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/prodev.jd.com\/mall\/active\/2KS7qX4VEn8pt5atxK5W1jGAvrc5\/index.html?babelChannel=ttt32","desc":"","text":""},"type":"ace"},{"alt":"","position":5,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/144093\/37\/19883\/83175\/5fe407c2E1b76b792\/68ed75dabb686375.jpg","href":"\/\/prodev.jd.com\/mall\/active\/37ThKCmK6tFnWd3V8PqwMJ1SE3TK\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"qGh6sTt79QoBBlITEyBAiQ==","mcinfo":"03294000-13573946-8801422298-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/prodev.jd.com\/mall\/active\/37ThKCmK6tFnWd3V8PqwMJ1SE3TK\/index.html","desc":"","text":""},"type":"ace"},{"alt":"","position":6,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/138772\/31\/20178\/39292\/5fe5cd5fEfce38cdd\/375bf42ad6dedfad.jpg","href":"\/\/pro.jd.com\/mall\/active\/46Vsus7SpKRgDbyAUitFHeBJnthu\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"PMS5koVkFfmNOxwMgDd+Yw==","mcinfo":"03294000-13573946-8801422822-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/46Vsus7SpKRgDbyAUitFHeBJnthu\/index.html","desc":"","text":""},"type":"ace"}],"banner":[{"sourceTag":"0","ext_columns":{"desc":"0:cpc","focustype":"g"},"src":"\/\/imgcps.jd.com\/img-cubic\/creative_server_cia\/v2\/2000366\/3028834\/FocusFullshop\/CkNqZnMvdDEvMTc3ODgzLzIvMTMxMjMvMTAxOTg0LzYwZTY5YTc2RWVkZTJlZWM5LzJmNjUzMTQ2YWM1Y2U5ZTAucG5nEgkyLXR5XzBfNTMwAjjui3pCEwoP5rSB56Kn5Yay54mZ5ZmoEABCGQoV6LaF5YC857K-5ZOB5aSn6IGa5LyaEAFCEAoM56uL5Y2z5oqi6LStEAJCCgoG5LyY6YCJEAdY4u64AQ\/cr\/s\/q.jpg","href":"\/\/ccc-x.jd.com\/dsp\/nc?ext=aHR0cHM6Ly9jaGFubmVsLW0uamQuY29tL3BjL3BzcC8zMDI4ODM0P2ltdXA9Q2dZS0FCSUFHQUFTR3dqaTdyZ0JFSVNDOGR3REdnaGlhbWRrYW1wcmFpRDlod0VvQVJpdkd5QUFLaDlwYWl4MVlTeDRaMlVzWjJsaExHTnBZaXhtWDJKaFgyWnNYMncwT1RNNE1nSnBha3FrQVVsOFUwaFZUbFJmU1Vvc1NWOUJYMFpNWDBvc1NWOUJYMUpGWDBvc1NWOUJYMUJNWDBvc1NWOUJYMU5NWDBvc1NWOUJYME5UWDBvc1NWOVZYMFpNWDBvc1NWOVRYMFpNWDBvc1NWOVNYMFpNWDBvc1NWOVFYMFpNWDBvc1NWOUhYMWhIWDFJc1NWOUNYMFpNWDB4RExFZEpRU3hZUjBVc1ZVRjhSeXBKWDFWZlJreGZUREV5T0RVMU8wWjhUVWxZVkVGSFgwWlNMRVpmUWtGZlJreGZURFE1TXpoOA&log=eW5S9YmxJJDJIL95s0XVHLtqwzdVXvU_HmZGEiIOwChFCMhkExe40LVTaV3IdSD_rq9WHbpkbohlpVGhqmzKiG5BJCql5sdQNGJdJDW8863VBlrug5gkAS0rZ7DjuVrkTdzxk-xOeTtyF-RXUaXzyRDAMV1zxn6mO30emGwcl7CsXk93JKSQ4ocfUtp7jV77N5fnqT0pP2rBb36LLacJ499N9IAR5YMfpC7r8T_gHf-sHdi82hsX68TiBUO2SFCSr--JBnpcORWG6mvUOzEJupzoKBznKcIMB2PIa1sGDMlZpgVDpuyO_mC1g8eItzEW0F8fvG5KDjC3KhvPqnS8t7-77NQNvs14RwRf-4s1Ar0BfrkecXQ7UgIyckr1v4uKzR0vshLKArG1HfJJmkYq6GveMryEa-IagnukyRER2ei1RJ5hVwxWBl9b-LPEoM9waQ3Rad1F0XS_3HLMK3VXAqsVZHe_aFk_xXYsU071bPnPvDWdiWOyx1_OVXStcE9sa7mrHQ8lw13_NochDJibx0JK-S7ceotx4KxecwP0Kj8zlV0l6bXFgJ04QIfHGAYtNE313w0HsFF45mZFq8z78wepDawOzwQ0faG3JQhBQeuX05sUQhOrT--vlFNfgd6q_XSLEHsqefv_aZNv-MzDV85Fq99Wj4JDJbBy9zJ3_xI-EcX06fQFs91Jkb6VQgqv_WsMEX4fcIwgL5__H3AMwmpoDxsfNG1eQvyG8jxwQ3AFbf59-LITLmyjNELWS2hZzI7MGO7VEfXtkolhQOw4E2Hiz7N7XTLaFEro0a7qZnQg1n_G_PaLP72FOdNmWfmPFmd1T-uefigHSLMaiS3P4yJlC3yndVkv0JJ13XPaYdVFavna879AYvW7pPfcwXFS1sk0aZpQy8Wvn9wfV7p5ZjTpeRZEq6fyO3YLSqstwuhhwZiS-ubklKN_8kaJDsVr6grA4mBIMKAGI-ZMvVG2bg&v=404","clog":"\/\/im-x.jd.com\/dsp\/np?log=eW5S9YmxJJDJIL95s0XVHLtqwzdVXvU_HmZGEiIOwChFCMhkExe40LVTaV3IdSD_rq9WHbpkbohlpVGhqmzKiG5BJCql5sdQNGJdJDW8863VBlrug5gkAS0rZ7DjuVrkTdzxk-xOeTtyF-RXUaXzyRDAMV1zxn6mO30emGwcl7CsXk93JKSQ4ocfUtp7jV77RTdj3F7qfSm5Kd33hAdn5Uj9sKjdlED9HwWlfws-aTWzx6v5yENELmIUUsAyI6P68UMPGed5VgDY8JJbg0dQfrd_D49vxJSIGbTp0-qSriD6xV-kt9X227T-Wchm1tFRWioxdjYhglTeA1gO9H7ZTRkEctB9pnziyAmbQ_Xvi84JtW9aevh8yA0Z0DZF9qg9anQAY1p9hf2LnmOnzXoaphW3m7TB5565t-4IxrZOCbUiAn-5WkkqMYMfHZ3AEE4MhkZ7dW1M0IEEkyjg7V9g-qeGrE-DAZ2NStgUCynvLUaQiffAON5ElZkricoPCKWKb3Dnge-IQSdf0pl_pCC0sx4La-jEmVDMuiY2zCjs4slWBvHwYbsR7hHMQeYII3t6_6hdPlJ5DAYtkg02P4PZhNkY-al11IHRWvXbFTvbG1NuHNUFOGP_oj_9QTXYTOf0YkiHw83cajvahhIyUJzH-nQvl2WOVgEAciUFyMuMMs4Q6PpZDU9fLjDRXrqCf7rGbdX0tVMGiMZVIrpT5mOpc7ELJbiEq0sfw6fjDKjLw48yMI3xh1zE7vNP73HegTPLBc2EAIS68EMhhTBLcdTmBjtIEO9q1wZFYCL6RqFMfFNs7eszG-opiiQ-DbToNuhdhQKynACsBHYpRge_h8cY-EvhQ0gvR6i6gkwe4Afnev3hxk5Gdhf5hrjpRdG9hc6FHLEDp9u3qxyMpzMyhW5tHUGdn6RYfWA2TuDwUWkQq08h3S8XOE5LrTl5bGL1upnPi1FfmT-0WBMrFHQicz9pyhF0EQbwEAHbusTngzCBIFg&v=404&seq=1","type":"ad"}]},{"recommend":[{"alt":"","position":7,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/129709\/30\/17733\/53433\/5fc20ebaE16d5e08d\/bba7d0a8e8e7fb10.jpg","href":"\/\/prodev.jd.com\/mall\/active\/zGwAUzL3pVGjptBBGeYfpKjYdtX\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"+BuvoFpWY12V+3PXLySUMQ==","mcinfo":"03294000-13573946-8801420745-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/prodev.jd.com\/mall\/active\/zGwAUzL3pVGjptBBGeYfpKjYdtX\/index.html","desc":"","text":""},"type":"ace"},{"alt":"","position":8,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/153447\/39\/11074\/46465\/5fe2e757E465bdd19\/a3db919bd4cd1490.jpg","href":"\/\/pro.jd.com\/mall\/active\/G6dB2UyBBfwfTVCBp3iMQQQ6GHi\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"rGjgT8k0RWIilVEYymoeQg==","mcinfo":"03294000-13573946-8801422515-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/G6dB2UyBBfwfTVCBp3iMQQQ6GHi\/index.html","desc":"","text":""},"type":"ace"},{"alt":"","position":9,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/147490\/11\/20231\/58763\/5fe554d2Ed968d82d\/0e749fd6e3e38af1.jpg","href":"\/\/pro.jd.com\/mall\/active\/3XjkyqALMxPUtxHp3VPvPzR2USqK\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"gGIXsI7ZKj4cCPOFSR5xbw==","mcinfo":"03294000-13573946-8801422820-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/3XjkyqALMxPUtxHp3VPvPzR2USqK\/index.html","desc":"","text":""},"type":"ace"}],"banner":[{"sourceTag":"0","ext_columns":{"desc":"0:cpc","focustype":"g"},"src":"\/\/imgcps.jd.com\/img-cubic\/creative_server_cia\/v2\/2000366\/11281902053\/FocusFullshop\/CkNqZnMvdDEvMTc5MTUxLzcvMTMxNjMvNTI0NzI1LzYwZTY5NjUxRTczMzkwNGYzLzUxYTM3ZDE0NzIwOGEyMzEucG5nEgk1LXR5XzBfNTYwAjjui3pCGQoV5oGS5rqQ56Wl5LyR6Zey5qOJ6KKcEABCEAoM5aW96LSn5rGH6IGaEAFCEAoM56uL5Y2z5oqi6LStEAJCCgoG57K-6YCJEAdY5dPQgyo\/cr\/s\/q.jpg","href":"\/\/ccc-x.jd.com\/dsp\/nc?ext=aHR0cHM6Ly9jaGFubmVsLW0uamQuY29tL3BjL3BzcC8xMTI4MTkwMjA1Mz9pbXVwPUNnWUtBQklBR0FBU0VRamwwOUNES2hDeWxBWWFBQ0RxWFNnQkdMQWJJQUFxSlcxcGVIUmhaMTlwTEhWaExIaG5ZU3huYVdFc1kybGlMR1pmWW1GZlpteGZiRFE1TXpreUNHMXBlSFJoWjE5cFNyWUJTWHhOU1ZoVVFVZGZTVklzU1Y5QlgwWk1YMVV4TXpJeU5peEpYMEZmUTFOZlZURXpNakkyTEVsZlFWOVNSVjlTTEVsZlFWOVFURjlTTEVsZlFWOVRURjlTTEVsZlZWOUdURjlNUXl4SlgxTmZSa3hmVEVNc1NWOVNYMFpNWDFJc1NWOVFYMFpNWDB3eE16RTBNaXhKWDBkZldFZGZVaXhKWDBKZlJreGZURU1zUjBsQkxGaEhRU3hWUVh4SEtrbGZWVjlHVEY5TU1USTROVFU3Um54TlNWaFVRVWRmUmxJc1JsOUNRVjlHVEY5TU5Ea3pPWHc&log=C0_MNcN1TpMQG21EPXjoFPswbe0T3URO-rfVGHPDJJ1t0COiCAuc6eIUx4KV0iKYziiVTWYiurjGvzMZps5uAlanUyr6Dz0OYcsSV5f3zF0O0WXNtnQcTEy7qqPiPP71osXvfVF9-XVFV43-kMoJUaQJmxDXY4g1bvu-r932TDaipGkkNJ_exO6Rya86hhbH4uWp4zPc2Sb-iMzxd6XhnRz6ee2_ITVkMlu9Y--GucGX76bh93FzIWTv0KFq0NYuw0ICdefkkriMHHyg5Vl5NuRWAXR-Dl_V-nmsYpYf80VTIj6Qz81jxBWw4pT4qMBam5AYDKFkA0noa6cPc_rpRvX9d93VzGe3fVmys-RZwN3tN2Hn9akYowyjkWRRBsycBgqQv7TCN6dX5RaljcSf8SnYG3o7WP3ASVK2PwpQ5N7tNjqyx-RxwgecQb3yJwSCz2RjlKM8G8eEB5di9BPK2BzpVX6F5wNTz73ENwyEWQqsHJ7wZoUIfA38h5xVHTIN6Q-4veMjj0XtVrCb76NaB-pkvU4DScOMb-MNvEbrACwGG30WGI2H4oIOmYRUCMAgFa6B0-dvUhF57LGsDiyCtksKM9GlmS_lNn_OQ78UiQceb1xf9eU8f9dTrVTs4casRYOf-byrWXP55acxStDvoLPsBZ8vLnR1El3TIED7yn7BP_yrii1iVa0LJDkBuxELtYp0tsITPX_1WQ6dkwdAQO9QSBEPON0LN37_vRZhzgzWPf-WdSZ-g03v3hj9uY6qyPEtzN26t-ciJXHAJn_gYlsh1wn2VMZi62xAa2EBP0hCxzU1qpi25TsYr3yR14pK17ljhN8VL5SKrkjnXhkeke8fzQMYjIz2vOF1X_BE0yLUkpo0YI3ZEuJC0CxT3M7pXx35SZaLqdxVyp1aMXLomFqR8uOpIePrMaI7IQg-iaxVrRhhr3VhhEuw5EQDQwJdCUc6cYVAyWzHvnMmAQjiG5AOp12x0_4dFOpoT3CjmRpc2nHLbFh7NDeHPN4-j7JR&v=404","clog":"\/\/im-x.jd.com\/dsp\/np?log=C0_MNcN1TpMQG21EPXjoFPswbe0T3URO-rfVGHPDJJ1t0COiCAuc6eIUx4KV0iKYziiVTWYiurjGvzMZps5uAlanUyr6Dz0OYcsSV5f3zF0O0WXNtnQcTEy7qqPiPP71osXvfVF9-XVFV43-kMoJUaQJmxDXY4g1bvu-r932TDZ0Ewvu_Oyr67srNyWVbjMBryNaJjABbmYkF4LwOS4J6KSybbb6HtD42I1QfgCAmG1EMzLGlWN53nMws91zLUZ5pxt65pHbAV5yt8NVhr0SFBPYINfrGRk3-DpPfc4EFq8uU-q1I21a1emvnaoLvTDYCJWSzfi9tKWqCIZM3uLX1jjApyWXCX1U0dhEpRrYt171UhucDHplpeJc_LPdUCIw5YRNBfhSg4oZi6H0cXYGEZxiw9shkFYG8XZCCu4-CoQVKBDW0NZmKIyjCFcU7TUUtnlvnGf5j66Pi7vaQghz7X5B-Gqkp7KciKxqHrwaBwh4hS-E3jyxzBA6VObLrUMNOL4Y7xIJ7-Kt4wsfEHOXzA7M9dfGAOR-Jb5mUH3LUde0BRB4oxjOrvVkCD7iUitQoqJ_OOhx-IOoyivtvM-FBGlRd79LSaONZOA2rdm92qhTMbOrhCFFiKxJz0zmCMFqhHqZAJdMnukvYpjAqnCd5ltMYgf7uBXefF0Ak8g3uJEwnBqKD-Rl0YpepBMBn7B8RVniqWTem82qKvl5NwJhgx2Mt0vygnxkdtW-E9r7rFBsSQ4Tr89Wjly64zSxsfGOG0vfsxZfMWM9B9BMMwDZGjsF_9aokOoGpRJVGGivodoLAzY-tOfejPt2lq3ctFktq1aQkVygHPy4yPBvShkqAwp0Tv1RqthLqAXCdVJtPju87eRgMeT16b8Sx3_4nEYi1IgIm_4USOV_go6BbEHDjKLXC9qXgAx4WEEbcy50_gKQeVflGomsDjgkadmTMmerIbWyeeCHEW8DQ_t7tU_VUuGNhqg1U5KVBXr3KeZPra5kRDSoIlXNdrnTPajVbuUU&v=404&seq=1","type":"ad"}]},{"recommend":[{"alt":"","position":10,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/145833\/33\/17892\/73340\/5fd1f9d8E7ec88331\/4caf9bb9de747f80.jpg","href":"\/\/pro.jd.com\/mall\/active\/37p81TGQS7wcEaHNjA1C1WokKPeT\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"U6gP9cS8gV5xMdJYrWgQ\/Q==","mcinfo":"03294000-13573946-8801420756-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/37p81TGQS7wcEaHNjA1C1WokKPeT\/index.html","desc":"","text":""},"type":"ace"},{"alt":"","position":11,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/152823\/26\/12012\/68654\/5fe97bc9E430fb6b1\/3f7f6bcef1350531.jpg","href":"\/\/pro.jd.com\/mall\/active\/2i8TdgieNtGwuDqV2yHPSFqRr29t\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"bkSlXW4t4\/oh7WXA5Q6F0w==","mcinfo":"03294000-13573946-8801423369-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/2i8TdgieNtGwuDqV2yHPSFqRr29t\/index.html","desc":"","text":""},"type":"ace"},{"alt":"","position":12,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/152492\/21\/12040\/52119\/5fe93622E8bc3302f\/67857d409c58d0f9.jpg","href":"\/\/pro.jd.com\/mall\/active\/4AfQf3FkPRGHhtqqKh9tsWyV97sy\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"TteIvHssJv+j1USc28Th3w==","mcinfo":"03294000-13573946-8801423368-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/4AfQf3FkPRGHhtqqKh9tsWyV97sy\/index.html","desc":"","text":""},"type":"ace"}],"banner":[{"src":"\/\/imgcps.jd.com\/ling\/100003909373\/5a6P56KB5pqX5b2x6aqR5aOr5aiB\/Nuacn-WFjeaBryDmmZLljZXmnInnpLw\/p-5bd8253082acdd181d02fa22\/d4150b6d.jpg","href":"\/\/pro.jd.com\/mall\/active\/qvR5WfiLRi2e9eUKdHCv9eP7Pht\/index.html?innerAnchor=100003909373","type":"delivery","ext_columns":{"link":"\/\/pro.jd.com\/mall\/active\/qvR5WfiLRi2e9eUKdHCv9eP7Pht\/index.html?innerAnchor=100003909373","sku":"100003909373","playImpr":"1#13#300002-4___","mcinfo":"null","focustype":"t","biclk":"1#13#acthot-B0036314-0-100003909373-acthot-0#88","desc":"6\u671f\u514d\u606f \u6652\u5355\u6709\u793c","text":"\u5b8f\u7881\u6697\u5f71\u9a91\u58eb\u5a01#100003909373"}}]},{"recommend":[{"alt":"OPPO\u5dc5\u5cf024\u5c0f\u65f6","position":13,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/155218\/21\/11512\/71383\/5fe5532cE2e68cd5a\/d6a736a88863c103.jpg","href":"\/\/pro.jd.com\/mall\/active\/2kr2j6fCYET7LtjRww5vB9DJNfwV\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"w\/Oz53F4tqc=","mcinfo":"03294000-13573946-8801422620-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/2kr2j6fCYET7LtjRww5vB9DJNfwV\/index.html","desc":"12\u671f\u767d\u6761\u514d\u606f","text":"OPPO\u5dc5\u5cf024\u5c0f\u65f6"},"type":"ace"},{"alt":"\u7f8e\u5986\u7cbe\u9009\u8bd5\u7528","position":14,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/144331\/15\/16230\/75371\/5fc4e20cEce63f6cb\/0148abea8250fc3b.jpg","href":"\/\/pro.jd.com\/mall\/active\/4W2AmqrXWJDtT4t5v5P6Wxe1WTec\/index.html?babelChannel=pcjinrituijian","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"2CeAlBiVB6aN5qElSwcuOg==","mcinfo":"03294000-13573946-8801420753-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/4W2AmqrXWJDtT4t5v5P6Wxe1WTec\/index.html?babelChannel=pcjinrituijian","desc":"","text":"\u7f8e\u5986\u7cbe\u9009\u8bd5\u7528"},"type":"ace"},{"alt":"","position":15,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/151220\/8\/11617\/61079\/5fdff6baE0a6f9504\/2dbfdebc8fd79483.jpg","href":"\/\/pro.jd.com\/mall\/active\/myvknjmTQuCsW7kjrnPRLPufSNu\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"bokuLSNDGKYkus93uySCgA==","mcinfo":"03294000-13573946-8801421457-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/myvknjmTQuCsW7kjrnPRLPufSNu\/index.html","desc":"","text":""},"type":"ace"}],"banner":[{"sourceTag":"0","ext_columns":{"desc":"0:cpc","focustype":"g"},"src":"\/\/imgcps.jd.com\/img-cubic\/creative_server_cia\/v2\/2000366\/4007743\/FocusFullshop\/CkRqZnMvdDEvMTc4NDY4LzEzLzEzMzIyLzMwODM0OS82MGU2YjZhNEVjNDQ2MTNjOS8zM2M4YjJlODFkYTg5ZDJkLnBuZxIJMy10eV8wXzU0MAI47ot6QhAKDOaziue-jumYsuaZkhAAQhMKD-S8mOaDoOS6q-S4jeWBnBABQhAKDOeri-WNs-aKoui0rRACQgcKA-aKohAHWL_O9AE\/cr\/s\/q.jpg","href":"\/\/ccc-x.jd.com\/dsp\/nc?ext=aHR0cHM6Ly9jaGFubmVsLW0uamQuY29tL3BjL3BzcC80MDA3NzQzP2ltdXA9Q2dZS0FCSUFHQUFTRndpX3p2UUJFT3luNjl3REdnVjZjMnRxWnlEc2FTZ0JHTEViSUFBcUgybGlMSFZoTEhoblp5eG5hV0VzWTJsaUxHWmZZbUZmWm14ZmJEUTVNemd5QW1saVNxUUJTWHhUU0ZWT1ZGOUpRaXhKWDBGZlJreGZRaXhKWDBGZlVrVmZRaXhKWDBGZlVFeGZRaXhKWDBGZlUweGZRaXhKWDBGZlExTmZRaXhKWDFWZlJreGZRaXhKWDFOZlJreGZRaXhKWDFKZlJreGZRaXhKWDFCZlJreGZRaXhKWDBkZldFZGZVaXhKWDBKZlJreGZVaXhIU1VFc1dFZEhMRlZCZkVjcVNWOVZYMFpNWDB3eE1qZzFOWDQ3Um54TlNWaFVRVWRmUmxJc1JsOUNRVjlHVEY5TU5Ea3pPSHc&log=N1nQOaMtXxhLjKhKMxQioktf2I7kmoAlnexTgjNYEQpcm8KgAOmPQhW-r5u22MSSVI6Jvv3zgdZjjQ16-1jgoJzImYNuAUGC9RUoVnd1QQ96jFmu-hR5Cc58YHJ4ETsRfyUPOvBGbHPqaZmhw0lEJ-svlOcHJFbPgbuECP4kXYrs1wn2oBCOdlcwBNRBcE6akYz1v1eKSG2wK5cQ8ymkFNc_aFoHMrNo5B95uVwFUsejYa7oUYz4EnPhs9FvljRtXQfuqzCwtIurY4NsPpJi-IU1zE56VZgSaDWVrgPOqNHedVZTL4r9PtfmtQ06CWbtr-jxJoFuhwlLZqWv5VCYNA6h_ubV8-1ircRAbK92CX1EXPz_BTWCk-FzAV6Tg7OotzGP1QERvHuTTez5wzI2dQRR6ENkbjaFwq8yVFaRsqwDaYJXkDmJzF6vjT42OyRnZyxpnOvvenWmVrapBp2J4Parc7SmbUETRB040FjImlT0PXFHTmYVQEQ5Uut9QKKAuxgYbNsuyRcYLD6tGdOHRWRLcoj8FrjDvlslHVWpiRK8AhLQR5n7RjFhRZS4zKzc9zmESjRlVUC48DZjH2JnZKccktC9RXJvQ9vSChqBHPMvj1rdD1UiUv1uJY5hFaZWqzGkbfQtqlUM8ipJqGz_LhUO9gQ8MWP__4V_lbja8onKAEjdDS8n74NUv3bMBqHjeAud9zhsAjgL_zp5AnHl4P0JwD2zwMkuf1G9zEQoob4e4FDbdBa-IhJUh5c8rplhKBwL-ExXfsgY6VeoRr3nN1fm-cIhE9fsOXcNV9d0Nr36bk8iM7zSPPbD6XRjoytx6guvRH0fwE0N9vhAVh16stD_D4_eROlT77xlaQxNc_LOitRKYlhnlpfhjGhiJ_2R5lFCyV5yUPgTddg7ViGS6HYMWbdYVrqBRZXUR4LULi293SHp6zTXkjtkgbuFi_oE&v=404","clog":"\/\/im-x.jd.com\/dsp\/np?log=N1nQOaMtXxhLjKhKMxQioktf2I7kmoAlnexTgjNYEQpcm8KgAOmPQhW-r5u22MSSVI6Jvv3zgdZjjQ16-1jgoJzImYNuAUGC9RUoVnd1QQ96jFmu-hR5Cc58YHJ4ETsRfyUPOvBGbHPqaZmhw0lEJ-svlOcHJFbPgbuECP4kXYrs1wn2oBCOdlcwBNRBcE6a08oE9nyLXuNoFJLcqYMmGRsXI7VCCb0bnjNH_OGLuivs8GQsfcDcGmwGceilQ8s1qBM4y0Fj0bqSv8_2OCrGIQ0tGJ0f36YFRuqQC3V3Jse6Wessi5ZOfmaCslyUWkVJaR2aPIJmkp-GBOxenKCz0-b9D6SKD5nGCG2KMAMO1acWMUWog1_Qz_7TRGE-k68Q4TKR_WoxuLdOu4dz6n7gZ9kjcNm2A7BkzhQH1ujl59b7AOgmHrXf7eO48SX_LgNxSm5IxlNTAsfU-RRnuvSxUmGyYMr7IpzbPrKpb_dtKz6SnLw7kb1CbXsZADc0_jNxoWmLc6Pr70c25ZCtcwJIInTIPf9bav61fZ--OgejwN52TQ6dw626CRGoQjd-mxDn9SOMuR7bMMIdqewYAYM2SqxBimxIeVuQY2QzUGc1xY5zGFRzn-03SvVCSUkzx2oljpI0diGRcZ3NgAVLuV3zEEXzdQ0xGEaTHlYZqBnFbfINhJC6r-g36HaLkzDduvT9OEq9rUaPf3p9al5-0TEOFaYJ3X2sURB9V40bW3h6eCWnaYlnt2D3pqMl7ig7Jd1NZ7dncZP4xNgds_mqDiXXBAhKmBNcgJaGGyPxxBnHIrQlfeHjwG4GgZbafspyTZEd18krWLFni_lULe-4SyMTwevq2eArxeeh3NxV-Ev0LaZlChwNzlPVxXTP-ptMyONw_XyWZdNQYgUlbOXsouDYZCMshrQZWDavpl0MH0Bw7iDGdCEJ7X5y3SsXcoyNUGLy-zintyDCygb1enIbvKugng&v=404&seq=1","type":"ad"}]},{"recommend":[{"alt":"\u8fbe\u80fd\u8de8\u5883\u5976\u7c89","position":16,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/142076\/21\/16719\/81798\/5fc755a4E765768a0\/3e35cebd45e72fcf.jpg","href":"\/\/pro.jd.com\/mall\/active\/34G4aLZqete3T2VDrQfwa4z5hdAm\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"QGSzAaCfP34=","mcinfo":"03294000-13573946-8801423371-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/34G4aLZqete3T2VDrQfwa4z5hdAm\/index.html","desc":"\u65b0\u5ba2\u5165\u4f1a\u7acb\u51cf40","text":"\u8fbe\u80fd\u8de8\u5883\u5976\u7c89"},"type":"ace"},{"alt":"","position":17,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/159465\/15\/15\/54794\/5fe97b93Edc6d2106\/705acb97ee03fa41.jpg","href":"\/\/pro.jd.com\/mall\/active\/SyNEMyANkXQuUmzn5dUef8CQGPA\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"bkSlXW4t4\/oh7WXA5Q6F0w==","mcinfo":"03294000-13573946-8801423370-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/SyNEMyANkXQuUmzn5dUef8CQGPA\/index.html","desc":"","text":""},"type":"ace"},{"alt":"","position":18,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/143220\/17\/17461\/57750\/5fcd86f8Ef9a8199c\/0f3a18493a9f64ed.jpg","href":"\/\/pro.jd.com\/mall\/active\/3fNa4gg4udob1juiWbWWBp9z9PBs\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"8E9EFljRna9sk5iyH5TJyQ==","mcinfo":"03294000-13573946-8801422413-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/3fNa4gg4udob1juiWbWWBp9z9PBs\/index.html","desc":"","text":""},"type":"ace"}],"banner":[{"src":"\/\/imgcps.jd.com\/ling\/7776792\/5Lyg57uf5bCP6aOf\/6Zu26aOf57OV54K5\/p-5bd8253082acdd181d02fa02\/71ccf55f.jpg","href":"\/\/pro.jd.com\/mall\/active\/2zMKHHhui8H95uEg63v5aSVFLsZ1\/index.html?innerAnchor=7776792","type":"delivery","ext_columns":{"link":"\/\/pro.jd.com\/mall\/active\/2zMKHHhui8H95uEg63v5aSVFLsZ1\/index.html?innerAnchor=7776792","sku":"7776792","playImpr":"1#13#300002-4___","mcinfo":"null","focustype":"t","biclk":"1#13#acthot-B0036759-0-7776792-acthot-1#88","desc":"\u96f6\u98df\u7cd5\u70b9","text":"\u4f20\u7edf\u5c0f\u98df#7776792"}}]},{"recommend":[{"alt":"","position":19,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/154590\/23\/10967\/74195\/5fe2df62E45a142d9\/883e4bda6f5cd278.jpg","href":"\/\/pro.jd.com\/mall\/active\/29aweHKvVWPaPXgJMbtiLsHk9pFR\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"RAv3J0fJGDZCyu6kQERnLQ==","mcinfo":"03294000-13573946-8801422593-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/29aweHKvVWPaPXgJMbtiLsHk9pFR\/index.html","desc":"","text":""},"type":"ace"},{"alt":"","position":20,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/158239\/17\/80\/59624\/5fe980daEc6af0098\/0b6bcc0f5587720c.jpg","href":"\/\/pro.jd.com\/mall\/active\/31e4RpwAWH66gXmn7UdN9dMGVY7F\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"oWH9E4RbFQwBBlITEyBAiQ==","mcinfo":"03294000-13573946-8801423361-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/31e4RpwAWH66gXmn7UdN9dMGVY7F\/index.html","desc":"","text":""},"type":"ace"},{"alt":"","position":21,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/139567\/10\/19800\/44582\/5fe46a35E7004831c\/9721fda27a9495ca.jpg","href":"\/\/pro.jd.com\/mall\/active\/2g9n7V52rEtSdKDkPHKMCURGR9aD\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"vTzmnuWTYC1fchOIQe8O+w==","mcinfo":"03294000-13573946-8801422592-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/2g9n7V52rEtSdKDkPHKMCURGR9aD\/index.html","desc":"","text":""},"type":"ace"}],"banner":[{"src":"\/\/imgcps.jd.com\/ling\/3486678\/6L-Q5Yqo5YGl6Lqr5oyH5Y2X\/6JCl5YW76L-b6Zi256-H\/p-5bd8253082acdd181d02fa5f\/f2af4529.jpg","href":"\/\/pro.jd.com\/mall\/active\/2DPCwovvaBUa7HciiQ2PHCvyECac\/index.html?innerAnchor=3486678","type":"delivery","ext_columns":{"link":"\/\/pro.jd.com\/mall\/active\/2DPCwovvaBUa7HciiQ2PHCvyECac\/index.html?innerAnchor=3486678","sku":"3486678","playImpr":"1#13#300002-4___","mcinfo":"null","focustype":"t","biclk":"1#13#acthot-B0007061-0-3486678-acthot-2#88","desc":"\u8425\u517b\u8fdb\u9636\u7bc7","text":"\u8fd0\u52a8\u5065\u8eab\u6307\u5357#3486678"}}]},{"recommend":[{"alt":"","position":22,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/146800\/33\/20186\/78685\/5fe5c755Ec3a48986\/df7e8df0dd87913d.jpg","href":"\/\/pro.jd.com\/mall\/active\/HkuJmKguhv6jGeEXdrKPR4ygyje\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"0B9WUXoekna8pOynkQjB1g==","mcinfo":"03294000-13573946-8801423360-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/HkuJmKguhv6jGeEXdrKPR4ygyje\/index.html","desc":"","text":""},"type":"ace"},{"alt":"","position":23,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/140042\/21\/20481\/60091\/5fe7f503Eea69fdd7\/b4b2147f196a9001.jpg!q95","href":"\/\/pro.jd.com\/mall\/active\/3s4A3dfrTy9K6FTXZWd1U67xJ9VR\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"Wbj96fOBwO5Cyu6kQERnLQ==","mcinfo":"03294000-13573946-8801423363-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/3s4A3dfrTy9K6FTXZWd1U67xJ9VR\/index.html","desc":"","text":""},"type":"ace"},{"alt":"","position":24,"src":"\/\/m.360buyimg.com\/babel\/jfs\/t1\/154709\/15\/12170\/50231\/5fe9a329E1e52a010\/370be07713e5124c.jpg","href":"\/\/pro.jd.com\/mall\/active\/Y7UJeC8KnEb2y5YufTiDrF2zL7J\/index.html","ext_columns":{"biclk":"1#665d5684d2c8f77eb50e572ca2319914a7ad5e98-0-619066#27274062","focustype":"s","ap":"xdy8JnbW2ywFhKBalJKxfA==","mcinfo":"03294000-13573946-8801423362-M#0-2-1--59--#1-tb-#102-27274062#pc-home","url":"\/\/pro.jd.com\/mall\/active\/Y7UJeC8KnEb2y5YufTiDrF2zL7J\/index.html","desc":"","text":""},"type":"ace"}],"banner":[{"src":"\/\/imgcps.jd.com\/ling\/1151232\/5LiK5rW35ZGz6YGT\/54iG5qy-55u06ZmN\/p-5bd8253082acdd181d02f9d8\/b59181aa.jpg","href":"\/\/pro.jd.com\/mall\/active\/2by5XxY7ssLewBLdsctXgdP3pdE8\/index.html?innerAnchor=1151232","type":"delivery","ext_columns":{"link":"\/\/pro.jd.com\/mall\/active\/2by5XxY7ssLewBLdsctXgdP3pdE8\/index.html?innerAnchor=1151232","sku":"1151232","playImpr":"1#13#300002-4___","mcinfo":"null","focustype":"t","biclk":"1#13#acthot-B0036736-0-1151232-acthot-3#88","desc":"\u7206\u6b3e\u76f4\u964d","text":"\u4e0a\u6d77\u5473\u9053#1151232"}}]}];        //618大促上报降级配置
        window.pageConfig.handleReportStart=new Date('2020/11/10 22:00:00').getTime();
        window.pageConfig.handleReportEnd=new Date('2020/11/12 10:00:00').getTime();
    </script>

    <script type="text/javascript">
        !function(e){pageConfig.isWide=function(){var n=e,i=document,o=i.documentElement,t=i.getElementsByTagName("body")[0],a=n.innerWidth||o.clientWidth||t.clientWidth;return a>=1370}();var n=[];pageConfig.isWide?(n.push("root61"),n.push("o2_wide")):n.push("o2_mini");var i=document.getElementsByTagName("html")[0];i.className=n.join(" ")}(window,void 0);
    </script>

    <script type="text/javascript">
        !function (n) {
            function o(n) {
                for (var o = n + "=", t = document.cookie.split(";"), e = 0; e < t.length; e++) {
                    for (var i = t[e]; " " == i.charAt(0);) i = i.substring(1, i.length);
                    if (0 == i.indexOf(o)) return i.substring(o.length, i.length)
                }
                return null
            }

            var t = o("pcm"), e = n.navigator.userAgent.toLocaleLowerCase(), i = "//m.jd.com",
                r = /iphone|android|symbianos|windows\sphone/g, c = /micromessenger|qq\/[\d.]+/i;
            return c.test(e) ? (n.location.href = "//wqs.jd.com/?from=jdindex", !1) : r.test(e) && "1" != t ? (n.location.href = i, !1) : void 0
        }(window);
    </script>

    <script type="text/javascript">
        window.search = function (a) {
            var b, c = "//search.jd.com/Search?keyword={keyword}&enc={enc}{additional}";
            var d = search.additinal || "";
            var e = document.getElementById(a);
            var f = e.value;
            if (f = f.replace(/^\s*(.*?)\s*$/, "$1"), f.length > 100 && (f = f.substring(0, 100)), "" == f) return void (window.location.href = window.location.href);
            var g = 0;
            "undefined" != typeof window.pageConfig && "undefined" != typeof window.pageConfig.searchType && (g = window.pageConfig.searchType);
            var h = "&cid{level}={cid}";
            var i = "string" == typeof search.cid ? search.cid : "";
            var j = "string" == typeof search.cLevel ? search.cLevel : "";
            var k = "string" == typeof search.ev_val ? search.ev_val : "";
            switch (g) {
                case 0:
                    break;
                case 1:
                    j = "-1", d += "&book=y";
                    break;
                case 2:
                    j = "-1", d += "&mvd=music";
                    break;
                case 3:
                    j = "-1", d += "&mvd=movie";
                    break;
                case 4:
                    j = "-1", d += "&mvd=education";
                    break;
                case 5:
                    var l = "&other_filters=%3Bcid1%2CL{cid1}M{cid1}[cid2]";
                    switch (j) {
                        case "51":
                            h = l.replace(/\[cid2]/, ""), h = h.replace(/\{cid1}/g, "5272");
                            break;
                        case "52":
                            h = l.replace(/\{cid1}/g, "5272"), h = h.replace(/\[cid2]/, "%3Bcid2%2CL{cid}M{cid}");
                            break;
                        case "61":
                            h = l.replace(/\[cid2]/, ""), h = h.replace(/\{cid1}/g, "5273");
                            break;
                        case "62":
                            h = l.replace(/\{cid1}/g, "5273"), h = h.replace(/\[cid2]/, "%3Bcid2%2CL{cid}M{cid}");
                            break;
                        case "71":
                            h = l.replace(/\[cid2]/, ""), h = h.replace(/\{cid1}/g, "5274");
                            break;
                        case "72":
                            h = l.replace(/\{cid1}/g, "5274"), h = h.replace(/\[cid2]/, "%3Bcid2%2CL{cid}M{cid}");
                            break;
                        case "81":
                            h = l.replace(/\[cid2]/, ""), h = h.replace(/\{cid1}/g, "5275");
                            break;
                        case "82":
                            h = l.replace(/\{cid1}/g, "5275"), h = h.replace(/\[cid2]/, "%3Bcid2%2CL{cid}M{cid}")
                    }
                    c = "//search-e.jd.com/searchDigitalBook?ajaxSearch=0&enc=utf-8&key={keyword}&page=1{additional}";
                    break;
                case 6:
                    j = "-1", c = "//music.jd.com/8_0_desc_0_0_1_15.html?key={keyword}";
                    break;
                case 7:
                    c = "//s-e.jd.com/Search?key={keyword}&enc=utf-8";
                    break;
                case 8:
                    c = "//search.jd.hk/Search?keyword={keyword}&enc=utf-8";
                    break;
                case 9:
                    d += "&market=1"
            }
            if ("string" == typeof i && "" != i && "string" == typeof j) {
                var m = /^(?:[1-8])?([1-3])$/;
                j = "-1" == j ? "" : m.test(j) ? RegExp.$1 : "";
                var n = h.replace(/\{level}/, j);
                n = n.replace(/\{cid}/g, i), d += n
            }
            if ("string" == typeof k && "" != k && (d += "&ev=" + k), f = encodeURIComponent(f), b = c.replace(/\{keyword}/, f), b = b.replace(/\{enc}/, "utf-8"), b = b.replace(/\{additional}/, d), "object" == typeof $o && ("string" == typeof $o.lastKeyword && (b += "&wq=" + encodeURIComponent($o.lastKeyword)), "string" == typeof $o.pvid && (b += "&pvid=" + $o.pvid)), b.indexOf("/search.jd.com/") > 0) try {
                JA.tracker.ngloader("search.000009", {key: f, posid: a, target: b})
            } catch (o) {
            }
            ("undefined" == typeof search.isSubmitted || 0 == search.isSubmitted) && (setTimeout(function () {
                window.location.href = b
            }, 50), search.isSubmitted = !0)
        };
    </script>


</head>

<body class="index">
<div class="mod_container">
    <!--无障碍占位-->
    <div id="J_accessibility"></div>
    <!--顶通占位 -->
    <div id="J_promotional-top">
    </div>
    <h1 align="center"><%=username%>,欢迎您</h1>
    <div id="shortcut">

        <div class="w">
            <ul class="fl" clstag="h|keycount|head|topbar_01">
                <li class="dropdown" id="ttbar-mycity"></li>
            </ul>

            <ul class="fr">

                <li class="fore1 dropdown"  clstag="h|keycount|head|topbar_02">
                    <a class="nickname" href="//passport.jd.com/uc/login?ReturnUrl=https%3A%2F%2Fwww.jd.com%2F" >你好，请登录</a>&nbsp;&nbsp;
                </li>
                <li class="spacer"></li>
                <li class="fore2" clstag="h|keycount|head|topbar_03">
                    <div class="dt"><a target="_blank" href="//order.jd.com/center/list.action">我的订单</a></div>
                </li>
                <li class="spacer"></li>
                <li class="fore3 dropdown" id="ttbar-myjd" clstag="h|keycount|head|topbar_04">
                    <div class="dt cw-icon"><a target="_blank" href="//home.jd.com/">我的京东</a><i class="iconfont">&#xe610;</i><i
                            class="ci-right"><s>◇</s></i></div>
                    <div class="dd dropdown-layer"></div>
                </li>
                <li class="spacer"></li>
                <li class="fore4" clstag="h|keycount|head|topbar_05">
                    <div class="dt"><a target="_blank" href="//vip.jd.com/">京东会员</a></div>
                </li>
                <li class="spacer"></li>
                <li class="fore5" clstag="h|keycount|head|topbar_06">
                    <div class="dt"><a target="_blank" href="//b.jd.com/">企业采购</a></div>
                </li>
                <li class="spacer"></li>
                <li class="fore8 dropdown" id="ttbar-serv" clstag="h|keycount|head|topbar_07">
                    <div class="dt cw-icon">客户服务<i class="iconfont">&#xe610;</i><i class="ci-right"><s>◇</s></i></div>
                    <div class="dd dropdown-layer"></div>
                </li>
                <li class="spacer"></li>
                <li class="fore9 dropdown" id="ttbar-navs" clstag="h|keycount|head|topbar_08">
                    <div class="dt cw-icon">网站导航<i class="iconfont">&#xe610;</i><i class="ci-right"><s>◇</s></i></div>
                    <div class="dd dropdown-layer"></div>
                </li>
                <li class="spacer"></li>
                <li class="fore10 mobile" id="J_mobile" clstag="h|keycount|head|topbar_09">
                    <div class="dt mobile_txt">手机京东</div>
                    <div class="mobile_static">
                        <div class="mobile_static_qrcode"></div>
                    </div>
                    <div id='J_mobile_pop' class='mod_loading mobile_pop'>
                    </div>
                </li>
            </ul>
        </div>
    </div>


    <div id="header">
        <div class="w">
            <div id="logo" class="logo">
                <h1 class="logo_tit">
                    <a href="//www.jd.com" class="logo_tit_lk" clstag="h|keycount|head|logo_01">京东</a>
                </h1>
                <h2 class="logo_subtit">京东,多快好省</h2>
                <div class="logo_extend" clstag="h|keycount|head|logo_02"></div>
            </div>

            <div id="search">
                <div class="search-m">
                    <div class="search_logo">
                        <a href="//www.jd.com" class="search_logo_lk" clstag="h|keycount|head|logo_01" tabindex="-1">京东，多快好省</a>
                    </div>

                    <div class="form" role="serachbox">
                        <ul id="shelper" class="search-helper" style="display: none"></ul>
                        <input clstag="h|keycount|head|search_c" type="text"
                               onkeydown="javascript:if(event.keyCode==13) search('key');" autocomplete="off" id="key"
                               accesskey="s"
                               class="text"
                               aria-label="搜索"/>
                        <button clstag="h|keycount|head|search_a" onclick="search('key');return false;" class="button" aria-label="搜索">
                            <i
                                    class="iconfont">&#xe60b;</i></button>
                    </div>

                    <div id="settleup" class="dropdown" clstag="h|keycount|head|cart_null">
                        <div class="cw-icon">
                            <i class="iconfont">&#xe60c;</i>
                            <a target="_blank" href="//cart.jd.com/cart.action">我的购物车</a>
                            <i class="ci-count" id="shopping-amount"></i>
                        </div>
                        <div class="dropdown-layer">
                            <div id="J_cart_pop">
                                <span class="loading"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="hotwords" clstag="h|keycount|head|search_d" role=""></div>

            <div id="navitems" role="navigation">
                <div class="spacer"></div>
                <ul id="navitems-group1">
                    <li clstag="h|keycount|head|navi_01" class="fore1">
                        <a class="navitems-lk"
                           target="_blank"
                           href="https://miaosha.jd.com/"
                           aria-lable="秒杀">秒杀                                                            </a>
                    </li>
                    <li clstag="h|keycount|head|navi_02" class="fore2">
                        <a class="navitems-lk"
                           target="_blank"
                           href="https://a.jd.com/"
                           aria-lable="优惠券">优惠券                                                            </a>
                    </li>
                    <li clstag="h|keycount|head|navi_03" class="fore3">
                        <a class="navitems-lk"
                           target="_blank"
                           href="https://plus.jd.com/index?flow_system=appicon&flow_entrance=appicon11&flow_channel=pc"
                           aria-lable="PLUS会员">PLUS会员                                                            </a>
                    </li>
                    <li clstag="h|keycount|head|navi_04" class="fore4">
                        <a class="navitems-lk"
                           target="_blank"
                           href="https://red.jd.com/"
                           aria-lable="品牌闪购">品牌闪购                                                            </a>
                    </li>
                </ul>
                <div class="spacer"></div>
                <ul id="navitems-group2">
                    <li clstag="h|keycount|head|navi_05" class="fore5">
                        <a class="navitems-lk"
                           target="_blank"
                           href="https://paimai.jd.com/"
                           aria-lable="拍卖">拍卖                                                            </a>
                    </li>
                    <li clstag="h|keycount|head|navi_06" class="fore6">
                        <a class="navitems-lk"
                           target="_blank"
                           href="https://jiadian.jd.com/"
                           aria-lable="京东家电">京东家电                                                            </a>
                    </li>
                    <li clstag="h|keycount|head|navi_07" class="fore7">
                        <a class="navitems-lk"
                           target="_blank"
                           href="https://chaoshi.jd.com/"
                           aria-lable="京东超市">京东超市                                                            </a>
                    </li>
                    <li clstag="h|keycount|head|navi_08" class="fore8">
                        <a class="navitems-lk"
                           target="_blank"
                           href="https://fresh.jd.com/"
                           aria-lable="京东生鲜">京东生鲜                                                            </a>
                    </li>
                </ul>
                <div class="spacer"></div>
                <ul id="navitems-group3">
                    <li clstag="h|keycount|head|navi_09" class="fore9">
                        <a class="navitems-lk"
                           target="_blank"
                           href="https://www.jd.hk/"
                           aria-lable="京东国际">京东国际                                                            </a>
                    </li>
                    <li clstag="h|keycount|head|navi_10" class="fore10">
                        <a class="navitems-lk"
                           target="_blank"
                           href="https://www.jdcloud.com/cn/pages/618cloud%20?utm_source=MO_jdsc0618&utm_medium=banner&utm_campaign=ggw&utm_term=NA"
                           aria-lable="京东云">京东云                                                            </a>
                    </li>
                </ul>
                <div class="spacer"></div>

            </div>

            <div id="treasure"></div>
        </div>
    </div>
    <div class="fs">
        <div class="grid_c1 fs_inner">
            <div class="fs_col1">
                <div id='J_cate' class="cate J_cate" role="navigation" aria-label="左侧导航">
                    <ul class="JS_navCtn cate_menu">
                        <li class="cate_menu_item" data-index="1" clstag="h|keycount|head|category_01a">
                            <a target="_blank" class="cate_menu_lk" href="//jiadian.jd.com">家用电器</a>
                        </li>
                        <li class="cate_menu_item" data-index="2" clstag="h|keycount|head|category_02a">
                            <a target="_blank" class="cate_menu_lk" href="//shouji.jd.com&#47;">手机</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//wt.jd.com">运营商</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//shuma.jd.com&#47;">数码</a>
                        </li>
                        <li class="cate_menu_item" data-index="3" clstag="h|keycount|head|category_03a">
                            <a target="_blank" class="cate_menu_lk" href="//diannao.jd.com&#47;">电脑</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//bg.jd.com">办公</a>
                        </li>
                        <li class="cate_menu_item" data-index="4" clstag="h|keycount|head|category_04a">
                            <a target="_blank" class="cate_menu_lk" href="//channel.jd.com&#47;home.html">家居</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//channel.jd.com&#47;furniture.html">家具</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//jzjc.jd.com&#47;">家装</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//channel.jd.com&#47;kitchenware.html">厨具</a>
                        </li>
                        <li class="cate_menu_item" data-index="5" clstag="h|keycount|head|category_05a">
                            <a target="_blank" class="cate_menu_lk" href="//phat.jd.com&#47;10-603.html">男装</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//phat.jd.com&#47;10-507.html">女装</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//phat.jd.com&#47;10-156.html">童装</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//channel.jd.com&#47;1315-1345.html">内衣</a>
                        </li>
                        <li class="cate_menu_item" data-index="6" clstag="h|keycount|head|category_06a">
                            <a target="_blank" class="cate_menu_lk" href="//beauty.jd.com&#47;">美妆</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//channel.jd.com&#47;beauty.html">个护清洁</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//channel.jd.com&#47;pet.html">宠物</a>
                        </li>
                        <li class="cate_menu_item" data-index="7" clstag="h|keycount|head|category_07a">
                            <a target="_blank" class="cate_menu_lk" href="//phat.jd.com&#47;10-184.html">女鞋</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//phat.jd.com&#47;10-183.html">箱包</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//channel.jd.com&#47;watch.html">钟表</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//channel.jd.com&#47;jewellery.html">珠宝</a>
                        </li>
                        <li class="cate_menu_item" data-index="8" clstag="h|keycount|head|category_08a">
                            <a target="_blank" class="cate_menu_lk" href="//phat.jd.com&#47;10-185.html">男鞋</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//phat.jd.com&#47;10-109.html">运动</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//phat.jd.com&#47;10-272.html">户外</a>
                        </li>
                        <li class="cate_menu_item" data-index="9" clstag="h|keycount|head|category_09a">
                            <a target="_blank" class="cate_menu_lk" href="//xinfang.jd.com&#47;">房产</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//car.jd.com&#47;">汽车</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//che.jd.com&#47;">汽车用品</a>
                        </li>
                        <li class="cate_menu_item" data-index="10" clstag="h|keycount|head|category_10a">
                            <a target="_blank" class="cate_menu_lk" href="//baby.jd.com">母婴</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//toy.jd.com&#47;">玩具乐器</a>
                        </li>
                        <li class="cate_menu_item" data-index="11" clstag="h|keycount|head|category_11a">
                            <a target="_blank" class="cate_menu_lk" href="//food.jd.com&#47;">食品</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//jiu.jd.com">酒类</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//fresh.jd.com">生鲜</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//china.jd.com">特产</a>
                        </li>
                        <li class="cate_menu_item" data-index="12" clstag="h|keycount|head|category_12a">
                            <a target="_blank" class="cate_menu_lk" href="//art.jd.com">艺术</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//channel.jd.com&#47;1672-2599.html">礼品鲜花</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//nong.jd.com">农资绿植</a>
                        </li>
                        <li class="cate_menu_item" data-index="13" clstag="h|keycount|head|category_13a">
                            <a target="_blank" class="cate_menu_lk" href="//health.jd.com">医药保健</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//channel.jd.com&#47;9192-9196.html">计生情趣</a>
                        </li>
                        <li class="cate_menu_item" data-index="14" clstag="h|keycount|head|category_14a">
                            <a target="_blank" class="cate_menu_lk" href="//book.jd.com&#47;">图书</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//mvd.jd.com&#47;">文娱</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//education.jd.com">教育</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//e.jd.com&#47;ebook.html">电子书</a>
                        </li>
                        <li class="cate_menu_item" data-index="15" clstag="h|keycount|head|category_15a">
                            <a target="_blank" class="cate_menu_lk" href="//jipiao.jd.com&#47;">机票</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//hotel.jd.com&#47;">酒店</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//trip.jd.com&#47;">旅游</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//ish.jd.com&#47;">生活</a>
                        </li>
                        <li class="cate_menu_item" data-index="16" clstag="h|keycount|head|category_16a">
                            <a target="_blank" class="cate_menu_lk" href="//licai.jd.com&#47;">理财</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//pro.jd.com&#47;mall&#47;active&#47;4EYjXQ6xjnM9TgeSjuMRE8ACEk6q&#47;index.html">众筹</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//baitiao.jd.com">白条</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//bao.jd.com&#47;">保险</a>
                        </li>
                        <li class="cate_menu_item" data-index="17" clstag="h|keycount|head|category_17a">
                            <a target="_blank" class="cate_menu_lk" href="//anzhuang.jd.com">安装</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//jdwx.jd.com">维修</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//cleanclean.jd.com">清洗</a>
                            <span class="cate_menu_line">/</span>
                            <a target="_blank" class="cate_menu_lk" href="//2.jd.com&#47;">二手</a>
                        </li>
                        <li class="cate_menu_item" data-index="18" clstag="h|keycount|head|category_18a">
                            <a target="_blank" class="cate_menu_lk" href="//mro.jd.com&#47;">工业品</a>
                        </li>
                    </ul>
                    <div id="J_popCtn" class="JS_popCtn cate_pop mod_loading" style="display: none;"></div>
                </div>
            </div>

            <div class="fs_col2">
                <div id='J_focus' class="focus">
                    <div class="focus__loading focus__main skeleton-wrapper">
                        <div class="focus-slider">
                            <div class="focus-item__core skeleton-elementDark mod_lazyload"></div>
                            <div class="focus-item__recommend">
                                <div class="recommend-item skeleton-elementDark"></div>
                                <div class="recommend-item skeleton-elementDark"></div>
                                <div class="recommend-item skeleton-elementDark"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="J_fs_col3" class="fs_col3">
                <div id='J_user' class="J_user user mod_loading">
                    <div class="user__loading user_inner">
                        <div class="user_avatar">
                            <div class="user_avatar_lk skeleton-element"></div>
                        </div>
                        <div class="user_show skeleton-element">
                            <p></p><p></p>
                        </div>
                        <div class="user_profit_placeholder skeleton-element"></div>
                    </div>
                </div>
                <div id='J_news' class="news J_news">
                    <div class="news__loading news2">
                        <div class="news_hd">
                            <div class="news_hd_placeholder skeleton-element"></div>
                        </div>
                        <div class="news_list"><div class="news_item skeleton-element"></div><div class="news_item skeleton-element"></div><div class="news_item skeleton-element"></div><div class="news_item skeleton-element"></div></div>
                    </div>
                </div>
                <div id="J_service" class="service">
                    <div class="service_entry">
                        <ul class="J_tab_head service_list">
                            <li class="service_item service_frame mod_tab_head_item">
                                <a href="//chongzhi.jd.com/" class="service_lk"
                                   target="_blank" clstag="h|keycount|head|shortcut_01" aria-label="话费">
                                    <i class="service_ico service_ico_huafei">
                                        <img class="service_ico_img"
                                             src="//m.360buyimg.com/babel/jfs/t1/30057/19/14881/720/5cbf064aE187b8361/eed6f6cbf1de3aaa.png"/>
                                        <img class="service_ico_img_hover"
                                             src="//m.360buyimg.com/babel/jfs/t1/45423/33/385/778/5cd4f265E442a9342/0aff0a42cece09ee.png"/>
                                    </i>
                                    <span class="service_txt">话费</span>
                                </a>
                            </li>
                            <li class="service_item service_frame mod_tab_head_item">
                                <a href="//jipiao.jd.com/" class="service_lk" target="_blank"
                                   clstag="h|keycount|head|shortcut_02" aria-label="机票">
                                    <i class="service_ico service_ico_jipiao">
                                        <img class="service_ico_img"
                                             src="//m.360buyimg.com/babel/jfs/t1/36478/38/5384/2901/5cbf065aEb0c60a12/afb4399323fe3b76.png"/>
                                        <img class="service_ico_img_hover"
                                             src="//m.360buyimg.com/babel/jfs/t1/34261/15/10242/3120/5cd4f256E10257aba/8f3f63ae04ff19af.png"/>
                                    </i>
                                    <span class="service_txt">机票</span>
                                </a>
                            </li>
                            <li class="service_item service_frame mod_tab_head_item">
                                <a href="//hotel.jd.com/" class="service_lk" target="_blank"
                                   clstag="h|keycount|head|shortcut_03" aria-label="酒店">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                <span class="service_corner">
                                                        <i class="service_corner_txt">省</i>
                                                        <i class="service_corner_ico"></i>
                                                    </span>
                                    <i class="service_ico service_ico_jiudian">
                                        <img class="service_ico_img"
                                             src="//m.360buyimg.com/babel/jfs/t1/31069/34/14642/979/5cbf0665Ec7dc8223/5fee386254dd2ebc.png"/>
                                        <img class="service_ico_img_hover"
                                             src="//m.360buyimg.com/babel/jfs/t1/44601/19/915/1039/5cd4f1cfE2e46473c/b61f083872a7a1de.png"/>
                                    </i>
                                    <span class="service_txt">酒店</span>
                                </a>
                            </li>
                            <li class="service_item service_frame service_frame2 mod_tab_head_item" data-row="2">
                                <a href="//game.jd.com/" class="service_lk" target="_blank"
                                   clstag="h|keycount|head|shortcut_04" aria-label="游戏">
                                    <i class="service_ico service_ico_youxi">
                                        <img class="service_ico_img"
                                             src="//m.360buyimg.com/babel/jfs/t1/32403/22/14829/3699/5cbf0674E04723693/caa83ce9b881cd24.png"/>
                                        <img class="service_ico_img_hover"
                                             src="//m.360buyimg.com/babel/jfs/t1/57520/8/375/4092/5cd4f1d8Ea1266047/1c590322ece537ba.png"/>
                                    </i>
                                    <span class="service_txt">游戏</span>
                                </a>
                            </li>
                            <li class="service_item service_noframe">
                                <a href="https:&#47;&#47;jiayouka.jd.com&#47;" class="service_lk" target="_blank"
                                   clstag="h|keycount|head|shortcut_05" aria-label="加油卡">
                                    <i class="service_ico">
                                        <!-- 常态 icon -->
                                        <img class="service_ico_img"
                                             src="https:&#47;&#47;m.360buyimg.com&#47;babel&#47;jfs&#47;t1&#47;71890&#47;14&#47;9897&#47;3048&#47;5d7739ddE93eb94f8&#47;f1f6dc5c207329f9.png"/>
                                        <!-- hover 态 icon -->
                                        <img class="service_ico_img_hover"
                                             src="https:&#47;&#47;m.360buyimg.com&#47;babel&#47;jfs&#47;t1&#47;36002&#47;35&#47;9106&#47;3311&#47;5cd4f1bdE06ff07ed&#47;9570fdd46ecd3a76.png"/>
                                    </i>
                                    <span class="service_txt">加油卡</span>
                                </a>
                            </li>
                            <li class="service_item service_noframe">
                                <a href="https:&#47;&#47;train.jd.com&#47;" class="service_lk" target="_blank"
                                   clstag="h|keycount|head|shortcut_06" aria-label="火车票">
                                    <i class="service_ico">
                                        <!-- 常态 icon -->
                                        <img class="service_ico_img"
                                             src="https:&#47;&#47;m.360buyimg.com&#47;babel&#47;jfs&#47;t1&#47;45761&#47;32&#47;10307&#47;1581&#47;5d7739e2Ece4b6671&#47;0004c1b85fbf7bde.png"/>
                                        <!-- hover 态 icon -->
                                        <img class="service_ico_img_hover"
                                             src="https:&#47;&#47;m.360buyimg.com&#47;babel&#47;jfs&#47;t1&#47;58891&#47;36&#47;278&#47;1745&#47;5cd4f1e0Ef4cc50a7&#47;f12276b17e5dcf3b.png"/>
                                    </i>
                                    <span class="service_txt">火车票</span>
                                </a>
                            </li>
                            <li class="service_item service_noframe">
                                <a href="https:&#47;&#47;pro.jd.com&#47;mall&#47;active&#47;4EYjXQ6xjnM9TgeSjuMRE8ACEk6q&#47;index.html" class="service_lk" target="_blank"
                                   clstag="h|keycount|head|shortcut_07" aria-label="众筹">
                                    <i class="service_ico">
                                        <!-- 常态 icon -->
                                        <img class="service_ico_img"
                                             src="https:&#47;&#47;m.360buyimg.com&#47;babel&#47;jfs&#47;t1&#47;51584&#47;31&#47;10221&#47;1685&#47;5d7739e7E1adb25cd&#47;1d0957d7f2ae01a2.png"/>
                                        <!-- hover 态 icon -->
                                        <img class="service_ico_img_hover"
                                             src="https:&#47;&#47;m.360buyimg.com&#47;babel&#47;jfs&#47;t1&#47;50929&#47;1&#47;374&#47;1847&#47;5cd4f1eaE5daf90db&#47;cebbff76b25dc22e.png"/>
                                    </i>
                                    <span class="service_txt">众筹</span>
                                </a>
                            </li>
                            <li class="service_item service_noframe">
                                <a href="https:&#47;&#47;jr.jd.com&#47;" class="service_lk" target="_blank"
                                   clstag="h|keycount|head|shortcut_08" aria-label="理财">
                                    <i class="service_ico">
                                        <!-- 常态 icon -->
                                        <img class="service_ico_img"
                                             src="https:&#47;&#47;m.360buyimg.com&#47;babel&#47;jfs&#47;t1&#47;52683&#47;35&#47;10394&#47;3447&#47;5d7739edE270aa7b3&#47;d4d1151b09b5553b.png"/>
                                        <!-- hover 态 icon -->
                                        <img class="service_ico_img_hover"
                                             src="https:&#47;&#47;m.360buyimg.com&#47;babel&#47;jfs&#47;t1&#47;47544&#47;23&#47;372&#47;3943&#47;5cd4f24eE92fbcf79&#47;4b49b55af25a7bdf.png"/>
                                    </i>
                                    <span class="service_txt">理财</span>
                                </a>
                            </li>
                            <li class="service_item service_noframe">
                                <a href="https:&#47;&#47;baitiao.jd.com&#47;?from=jrscyn_20160" class="service_lk" target="_blank"
                                   clstag="h|keycount|head|shortcut_09" aria-label="白条">
                                    <i class="service_ico">
                                        <!-- 常态 icon -->
                                        <img class="service_ico_img"
                                             src="https:&#47;&#47;m.360buyimg.com&#47;babel&#47;jfs&#47;t1&#47;56296&#47;3&#47;10260&#47;1443&#47;5d7739f3E233abc53&#47;e6976f3cb30c9a8a.png"/>
                                        <!-- hover 态 icon -->
                                        <img class="service_ico_img_hover"
                                             src="https:&#47;&#47;m.360buyimg.com&#47;babel&#47;jfs&#47;t1&#47;39983&#47;24&#47;6834&#47;1596&#47;5cd4f247E8cf89f1e&#47;b8a8418d5418f471.png"/>
                                    </i>
                                    <span class="service_txt">白条</span>
                                </a>
                            </li>
                            <li class="service_item service_noframe">
                                <a href="https:&#47;&#47;movie.jd.com&#47;index.html" class="service_lk" target="_blank"
                                   clstag="h|keycount|head|shortcut_10" aria-label="电影票">
                                    <i class="service_ico">
                                        <!-- 常态 icon -->
                                        <img class="service_ico_img"
                                             src="https:&#47;&#47;m.360buyimg.com&#47;babel&#47;jfs&#47;t1&#47;60778&#47;37&#47;9838&#47;3066&#47;5d7739faEd3b7dbb9&#47;dd4d9ef7ce8fc169.png"/>
                                        <!-- hover 态 icon -->
                                        <img class="service_ico_img_hover"
                                             src="https:&#47;&#47;m.360buyimg.com&#47;babel&#47;jfs&#47;t1&#47;41106&#47;15&#47;4551&#47;3300&#47;5cd4f1c7E507148c7&#47;90a218f053e903d2.png"/>
                                    </i>
                                    <span class="service_txt">电影票</span>
                                </a>
                            </li>
                            <li class="service_item service_noframe">
                                <a href="https:&#47;&#47;b.jd.com&#47;" class="service_lk" target="_blank"
                                   clstag="h|keycount|head|shortcut_11" aria-label="企业购">
                                    <i class="service_ico">
                                        <!-- 常态 icon -->
                                        <img class="service_ico_img"
                                             src="https:&#47;&#47;m.360buyimg.com&#47;babel&#47;jfs&#47;t1&#47;40738&#47;20&#47;14562&#47;826&#47;5d773a01E09eb8121&#47;d6f3909618c6307a.png"/>
                                        <!-- hover 态 icon -->
                                        <img class="service_ico_img_hover"
                                             src="https:&#47;&#47;m.360buyimg.com&#47;babel&#47;jfs&#47;t1&#47;45316&#47;3&#47;388&#47;884&#47;5cd4f25eEea4c67ed&#47;671f7c186c5e9b01.png"/>
                                    </i>
                                    <span class="service_txt">企业购</span>
                                </a>
                            </li>
                            <li class="service_item service_noframe">
                                <a href="https:&#47;&#47;o.jd.com&#47;market&#47;index.action" class="service_lk" target="_blank"
                                   clstag="h|keycount|head|shortcut_12" aria-label="礼品卡">
                                    <i class="service_ico">
                                        <!-- 常态 icon -->
                                        <img class="service_ico_img"
                                             src="https:&#47;&#47;m.360buyimg.com&#47;babel&#47;jfs&#47;t1&#47;57014&#47;6&#47;10297&#47;815&#47;5d773a07Ec7a61fc9&#47;97917a2daa34be0f.png"/>
                                        <!-- hover 态 icon -->
                                        <img class="service_ico_img_hover"
                                             src="https:&#47;&#47;m.360buyimg.com&#47;babel&#47;jfs&#47;t1&#47;55911&#47;31&#47;402&#47;858&#47;5cd4f23eE6f536460&#47;5da079255c6dfabe.png"/>
                                    </i>
                                    <span class="service_txt">礼品卡</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="J_tab_content service_pop" tabindex="-1" aria-hidden="true">
                        <div class="mod_tab_content_item service_pop_item mod_loading"></div>
                        <div class="mod_tab_content_item service_pop_item mod_loading"></div>
                        <div class="mod_tab_content_item service_pop_item mod_loading"></div>
                        <div class="mod_tab_content_item service_pop_item mod_loading"></div>
                        <a class="J_service_pop_close service_pop_close iconfont" href="javascript:;" tabindex="-1"></a>
                    </div>
                </div>
            </div>
        </div>
        <div id="J_fs_act" class="fs_act"></div>
    </div>
    <!-- CLUB_LINK start seo  -->
    <div style="display:none">
        <a href="//itb2b.jd.com/">京采汇</a>
        <a href="//jos.jd.com/">京东开放平台</a>
        <a href="//shangling.jd.com/">商羚</a>
        <a href="https://jdx.com">京东零售云</a>
        <a href="https://www.qingzhouip.com/">氢舟</a>
        <a href="https://www.healthjd.com/">京东家医</a>
        <a href="https://m.healthjd.com">家庭医生</a>
        <a href="//cobrand.jd.com/">东联计划</a>
        <a href="//union.jd.com">网络赚钱</a>
        <a href="//jzt.jd.com/school/marketing/calendar">618大促攻略</a>
        <a href="//www.jd.com/sptopic/1316b578fe1de22368e4.html">洗面奶</a>
        <a href="//www.jd.com/nrjs/3246ed949ba174ea.html">唐狮拼色 连衣裙</a>
        <a href="//www.jd.com/brand/9987019f0bd7d403e3de.html">苹果手机</a>
        <a href="//www.jd.com/hprm/62331efefe1affa158ff.html">琵琶</a>
        <a href="//www.jd.com/sptopic/117296ca19d46b24dfeb3.html">女士鞋</a>
        <a href="//www.jd.com/cppf/9847333cd3d99d6886d9.html">实木沙发</a>
        <a href="//www.jd.com/book/737280eea8ac7dfea03.html">索尼电视</a>
        <a href="//www.jd.com/hotitem/9855fbd5a67b591890f1.html">卫浴品牌</a>
        <a href="//www.jd.com/zuozhe/7378d855fa5f85d59a5.html">奥克斯空调</a>
        <a href="//fresh.jd.com/shengxian/12218e48f879c700b44c1.html">百香果</a>
        <a href="https://yp.jd.com/737f0d15a0ac242b4ab.html">小吉十字对开门定频冰箱</a>
        <a href="https://www.jd.com/phb/73728bd1b0b5ab69717.html">冰箱401</a>
        <a href="https://www.jd.com/phb/key_73722291a36743f5264.html">风冷冰箱霜</a>
        <a href="https://www.jd.com/jiage/737842009f91ccada71.html">万爱迷你冰箱</a>
        <a href="https://www.jd.com/tupian/73726bd8e9f04e01e69.html">冰箱保鲜有个小孔</a>
        <a href="https://www.jd.com/xinkuan/737358a983b08fda3df.html">赛亿冰箱报价</a>
        <a href="https://www.jd.com/book/7376674a7c2d82f3911.html">保温箱60</a>
        <a href="https://www.jd.com/zuozhe/73748d444d52bdefe10.html">二手四门冰箱益阳</a>
        <a href="https://www.jd.com/brand/73766c68ccae6e49399.html">西门子电冰箱kg28</a>
        <a href="https://www.jd.com/xinghao/737bcae2b361c6e0bee.html">单门双门冰箱</a>
        <a href="https://www.jd.com/cppf/737c716c847ef0f6187.html">小吉对开门变频冰箱</a>
        <a href="https://www.jd.com/hprm/73788d17686a9a01213.html">冰箱小型迷你风冷无霜</a>
        <a href="https://www.jd.com/sptopic/73790c831e3ff58ba3f.html">晶弘冰箱258c</a>
        <a href="https://www.jd.com/hotitem/73730f9b19b0edc3868.html">新飞三门冰箱</a>
        <a href="https://www.jd.com/nrjs/8da0bd4fde8306ed.html">海尔（Haier） BCD-426WDGBU1  冰箱</a>
        <a href="https://www.jd.com/zxnews/f338b3d494953f40.html">tcl电冰箱bcd哪款好？tcl电冰箱bcd怎么样好用吗？</a>
        <a href="https://www.jd.com/phb/zhishi/d2a462e63a4851ff.html">联保迷你冰箱哪款好？联保迷你冰箱怎么样好用吗？</a>
        <a href="https://www.jd.com/phb/zhishi/2b24797f9fb5db3e.html">惠而浦（Whirlpool） BCD-592WDBZW  冰箱</a>
        <a href="https://www.jd.com/jxinfo/14a339ca2e91b49c.html">海尔变箱冰箱哪款好？海尔变箱冰箱怎么样好用吗？</a>
        <a href="https://www.jd.com/jxinfo/a6bb216ef6ba4b20.html">容声冰箱120升排行榜，容声冰箱120升十大排名推荐</a>
    </div>
    <!-- CLUB_LINK end -->
    <script type="text/javascript">
        window.point.fs = new Date().getTime();
    </script>
    <!-- E ad2 -->

</div>

<script src="//storage.360buyimg.com/pc-pre-tmp/jquery.js"></script>
<script src="//misc.360buyimg.com/??mtd/pc/common/js/o2_ua.js,mtd/pc/base/1.0.0/event.js"></script>
<script src="//wl.jd.com/wl.js"></script>

<script>
    // 直出代码
    var waitForEl = function(selector, callback) {
        if ($(selector).length) {
            callback()
        } else {
            setTimeout(function() {
                waitForEl(selector, callback);
            }, 100)
        }
    }

    waitForEl('#settleup .dropdown-layer', function() {
        $('#settleup .dropdown-layer').remove()
        // work the magic
    })
</script>
<style>
    .o2_ie8 .more2_international {
        filter: progid:dximagetransform.microsoft.alphaimageloader(src='//storage.360buyimg.com/mtd/home/more_international1575014601797.png',sizingMethod='scale');
        background: none;
    }
    .mod_help_cover {
        background-image: none;
    }
    #settleup:hover .cw-icon {
        border-bottom: 1px solid #c81623;
    }
    html.o2_gray {
        -webkit-filter: grayscale(100%);
        filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);
    }
    .o2_mini .company .feed-tab {
        margin: 0 auto;
    }
    .company .feed-tab {
        margin: 0 auto;
    }
    .channelsB .channels_block_1 .channels_item_1 .channels_item_link {
        height: 370px;
        width: 290px;
    }
    .channelsB .channels_block_1 .channels_item_2 .channels_item_link {
        height: 370px;
        width: 290px;
    }
    .JD_close-button--square {
        z-index: 1;
    }
</style>
<div id="app"></div>
<script type="text/javascript">
    window.point.dom = new Date().getTime();
</script>

</body>


<script type="text/javascript" src="//misc.360buyimg.com/mtd/pc/index_2019/1.0.0/static/js/runtime.js"></script>

<script type="text/javascript" src="//misc.360buyimg.com/mtd/pc/index_2019/1.0.0/static/js/index.chunk.js"></script>

<script type="text/javascript">
    window.point.js = new Date().getTime();
</script>
</html>
<%
    }else {
        // 登陆失败
        writer.write("登陆失败");
    }
%>

