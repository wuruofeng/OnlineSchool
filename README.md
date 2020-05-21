# OnlineSchool
课设-网校前后端全套


有什么问题可以发邮箱，如果对你有帮助，记得Star哦！

#### 介绍
这个是大三JavaEE和软件工程的期末课题作业

成员：吴若峰，缪传鹏，杨超逸，姚家琦，陈锦明   

#### 技术栈

用户前端:Vue

用户后端:SSM（Spring+SpringMVC+MyBatis）

管理员后端:SSH（Struts，Spring，Hibernate）

#### 目录说明

```
总目录
.
├── ER图
├── LICENSE
├── README.md
├── SQL
├── UML
├── 前端后台
├── 前端界面
├── 后台管理
├── 测试用例
└── 需求文档
```
```
用户前端

├── babel.config.js
├── package-lock.json
├── package.json           //NPM包管理
├── public
│   ├── favicon.ico
│   ├── index.html         //index静态页面
│   └── static             //本地Mock，资源文件
├── src
│   ├── App.vue            //Vue入口
│   ├── api                //"所有课程"组件的API调用
│   ├── assets             //图片，资源文件
│   ├── components         //网站所有的组件
│   ├── main.js            //初始化Vue设置
│   ├── router             //Vue路由设置
│   ├── store              //Vuex全局状态管理
│   ├── style              //公共CSS
│   ├── util               //工具类，Cookie等
│   └── views              //没啥用
├── vue.config.js          //WebPack打包设置，本地转发跨域设置等等
└── yarn.lock               

```
```
用户端后端(Spring、MyBatis)

.
├── pom.xml                     //Maven
└── src
    ├── main
    │   ├── java
    │   │   └── cn
    │   │       └── miaozt
    │   │           └── onlineschool
    │   │               ├── MybatisXmlApplication.java
    │   │               ├── config
    │   │               ├── enums
    │   │               ├── mapper
    │   │               ├── model
    │   │               └── web
    │   └── resources
    │       ├── application.properties
    │       └── mybatis
    │           ├── mapper
    │           │   ├── AdminMapper.xml
    │           │   ├── ChapterMapper.xml
    │           │   ├── CommentInfoMapper.xml
    │           │   ├── CourseMapper.xml
    │           │   ├── TokenMapper.xml
    │           │   ├── UserCourseRelationshipMapper.xml
    │           │   └── UserMapper.xml
    │           └── mybatis-config.xml
    └── test
        └── java
            └── cn
                └── miaozt
                    └── onlineschool
                        ├── MybatisXmlApplicationTests.java
                        ├── mapper
                        └── web


```
```
后台管理

.
├── pom.xml
└── src
    └── main
        ├── java
        │   ├── log4j.properties
        │   └── org
        ├── resources
        │   ├── AdminInfo.hbm.xml
        │   ├── Chapter.hbm.xml
        │   ├── Course.hbm.xml
        │   ├── CourseTag.hbm.xml
        │   ├── Tag.hbm.xml
        │   ├── Teacher.hbm.xml
        │   ├── Term.hbm.xml
        │   ├── Tokeninfo.hbm.xml
        │   ├── Type.hbm.xml
        │   ├── UserCourse.hbm.xml
        │   ├── UserInfo.hbm.xml
        │   ├── UserTerm.hbm.xml
        │   ├── hibernate.cfg.xml
        │   └── struts.xml
        └── webapp
            ├── META-INF
            ├── WEB-INF
            ├── assets
            ├── course_list.html
            ├── css
            ├── demo
            ├── front
            ├── images
            ├── jquery-easyui-1.7.0
            ├── js
            ├── locale
            ├── login.html
            ├── menu.jsp
            ├── plugins
            ├── term_list.html
            └── user_list.html

```

#### 安装教程
***
*默认自己已经配置好了Tomcat、Nodejs等必要的环境

1. 将此项目Pull到本地。
2. 运行SQL目录下的.sql转储文件
3. 导入用户端后端项目,更新Maven,在application.properties配置文件下填写你的数据库账号和密码,启动Tomcat。  

4.  

①导入用户端前端项目，然后终端输入
```angular2
npm install
``` 

②因为我所有的网络API全部没有更改，故全局搜索"axios"把所有需要访问外网的API的地址更改为本地地址。

③因为"个人中心"组件中的头像上传我使用了阿里云OSS存储桶，故那块地方的密匙请修改为你自己的密匙。


④等待npm安装完成后，终端输入
```angular2
npm run serve
```

⑤浏览器访问即可！
     
5.到第四步为止网页已经可以打开了。剩下的就是一个后台管理了，步骤和上述所讲的基本一致，导入，Maven，修改Hibernate的配置文件hibernate.cfg.xml，填写你自己的数据库和密码，运行。


#### 前端项目特点

在小组里我负责用户端的页面设计，所以我对这一块了解的比较多，花了一个月时间左右从学习VUE到一个人完成了整个前端页面，成就感还是很有的。

本项目Vue的特点

性能:

* 全站CDN优化

* 组件路由懒加载

* 组件懒加载

UI:
* 全站响应式，手机端完美适配

* CSS风格统一，参见style文件下的common.css

#### 一些图片(更多截图在截图文件夹中)
主页
![Image text](https://raw.githubusercontent.com/wuruofeng/OnlineSchool/master/%E6%88%AA%E5%9B%BE/%E4%B8%BB%E9%A1%B5.png)

![Image text](https://raw.githubusercontent.com/wuruofeng/OnlineSchool/master/%E6%88%AA%E5%9B%BE/%E5%88%86%E6%9E%90.png)

![Image text](https://raw.githubusercontent.com/wuruofeng/OnlineSchool/master/%E6%88%AA%E5%9B%BE/%E5%8A%A0%E5%85%A5%E6%88%91%E4%BB%AC.png)

![Image text](https://raw.githubusercontent.com/wuruofeng/OnlineSchool/master/%E6%88%AA%E5%9B%BE/%E6%89%80%E6%9C%89%E8%AF%BE%E7%A8%8B.png)

![Image text](https://raw.githubusercontent.com/wuruofeng/OnlineSchool/master/%E6%88%AA%E5%9B%BE/%E6%92%AD%E6%94%BE%E9%A1%B5.png)

![Image text](https://raw.githubusercontent.com/wuruofeng/OnlineSchool/master/%E6%88%AA%E5%9B%BE/%E6%9C%80%E8%BF%91%E6%9B%B4%E6%96%B0.png)

![Image text](https://raw.githubusercontent.com/wuruofeng/OnlineSchool/master/%E6%88%AA%E5%9B%BE/Course.png)

手机端适配
![Image text](https://raw.githubusercontent.com/wuruofeng/OnlineSchool/master/%E6%88%AA%E5%9B%BE/%E6%89%8B%E6%9C%BA1.jpg)

![Image text](https://raw.githubusercontent.com/wuruofeng/OnlineSchool/master/%E6%88%AA%E5%9B%BE/%E6%89%8B%E6%9C%BA2.jpg)

![Image text](https://raw.githubusercontent.com/wuruofeng/OnlineSchool/master/%E6%88%AA%E5%9B%BE/%E6%89%8B%E6%9C%BA3.jpg)


![Image text](https://raw.githubusercontent.com/wuruofeng/OnlineSchool/master/%E6%88%AA%E5%9B%BE/Course.png)


![Image text](https://raw.githubusercontent.com/wuruofeng/OnlineSchool/master/%E6%88%AA%E5%9B%BE/%E5%90%8E%E5%8F%B0%E7%AE%A1%E7%90%86_!.png)

![Image text](https://raw.githubusercontent.com/wuruofeng/OnlineSchool/master/%E6%88%AA%E5%9B%BE/%E5%90%8E%E5%8F%B0%E7%AE%A1%E7%90%86.png)





