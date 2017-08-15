# AJLocalCache
结合 FMDB、MJExtension 类库，实现本地 sqlite 数据库缓存功能

1.导入工作：
（1）将项目中的 Classes 文件夹中的文件全部导入到工程中（如果项目中已经有了 FMDB、MJExtension ，则这两个文件夹可以不需要导入，避免造成冲突）
（2）在 General／Linked Frameworks and libraries 中，添加 libsqlite3.tbd 类库

2.如何使用：
（1）AJLocalCacheTool：本地缓存工具类
（2）AJLocalCacheBaseModel：所有需要本地缓存数据的 model 需要继承的父类 model
