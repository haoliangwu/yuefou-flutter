对 [graphql_client](https://github.com/hourliert/graphql_client) 的源码进行了一些修改，修复了以下问题：
* 可以针对非`Scalar`类型的`List`字段进行解析
* 解析响应内容时，使用`utf8.decode`而非`json.decode`（暂时会出现中文乱码问题）
* 增加了`Collection` mixin