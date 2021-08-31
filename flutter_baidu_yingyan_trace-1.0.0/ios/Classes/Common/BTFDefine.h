//
//  BTFDefine.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/31.
//

#ifndef BTFDefine_h
#define BTFDefine_h
// 如果release状态就不执行NSLog函数
#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
# define NSLog(...) {}
#endif

#endif /* BTFDefine_h */
