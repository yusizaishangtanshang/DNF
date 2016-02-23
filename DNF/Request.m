//
//  Request.m
//  AFNtest
//
//  Created by 贺东方 on 16/1/18.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#import "Request.h"


@implementation Request

- (void)isWifi
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager manager];
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status) {
            
        }
    }];
    
}
+ (void)requestWithGetApiAndParameter:(NSDictionary *)apiAndParameter withUrl:(NSString *)urlStr withDataCallBack:(callBack)callback
{
    AFNetworkReachabilityManager *reachability = [AFNetworkReachabilityManager manager];
    [reachability startMonitoring];
    //    [reachability setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
    //        if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
    //系统的正在连接网络的提示
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    //URL地址
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //已get的形式提交
    [manager GET:urlStr parameters:apiAndParameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //关闭系统的链接网络的提示
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        callback(responseObject);
        //                NSLog(@"---获取到的json格式的字典--%@",resultDic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSLog(@"%@",error.userInfo);
    }];
    
    //        }
    //    }];
    
}
+ (void)requestWithGetApiAndParameter:(NSDictionary *)apiAndParameter withUrl:(NSString *)urlStr withJsonCallBack:(callBack)callback
{
    AFNetworkReachabilityManager *reachability = [AFNetworkReachabilityManager manager];
    [reachability startMonitoring];
//    [reachability setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
            //系统的正在连接网络的提示
            [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
            
            //URL地址
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            
            //已get的形式提交
            [manager GET:urlStr parameters:apiAndParameter progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //关闭系统的链接网络的提示
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                
                NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                callback(resultDic);
//                NSLog(@"---获取到的json格式的字典--%@",resultDic);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                NSLog(@"%@",error.userInfo);
            }];

//        }
//    }];
    
}

-(void)requestWithPostApiAndParameter:(NSDictionary *)apiAndParameter withUrl:(NSString *)urlStr withCallBack:(callBack)callback
{
    // 启动系统风火轮
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    //假如需要提交给服务器的参数是key＝1,class_id=100
    //创建一个可变字典
    NSMutableDictionary *parametersDic = [NSMutableDictionary dictionary];
    //往字典里面添加需要提交的参数
    [parametersDic setObject:@"1" forKey:@"key"];
    [parametersDic setObject:@"100" forKey:@"class_id"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //以post的形式提交，POST的参数就是上面的域名，parameters的参数是一个字典类型，将上面的字典作为它的参数
    [manager POST:urlStr parameters:apiAndParameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 隐藏系统风火轮
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        //json解析
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        
        NSLog(@"---获取到的json格式的字典--%@",resultDic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        // 解析失败隐藏系统风火轮(可以打印error.userInfo查看错误信息)
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
}

-(void)uploadPictures:(NSArray *)picNames{
    
    //域名
    NSString *domainStr = @"http://192.168.1.69/xffcol/index.php/Api/";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //如果还需要上传其他的参数，参考上面的POST请求，创建一个可变字典，存入需要提交的参数内容，作为parameters的参数提交
    [manager POST:domainStr parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //_imageArray就是图片数组，我的_imageArray里面存的都是图片的data，下面可以直接取出来使用，如果存的是image，将image转换data的方法如下：NSData *imageData = UIImageJPEGRepresentation(image, 0.7);
        if (picNames.count > 0 ){
            for(int i = 0;i < picNames.count;i ++){
                NSData *data=picNames[i];
                //上传的参数名
                NSString *name = [NSString stringWithFormat:@"%d",i];
                //上传的filename
                NSString *fileName = [NSString stringWithFormat:@"%@.jpg",name];
                [formData appendPartWithFileData:data
                                            name:name
                                        fileName:fileName
                                        mimeType:@"image/jpeg"];
            }
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       //关闭系统风火轮
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        //json解析
        NSDictionary * resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"---resultDic--%@",resultDic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 解析失败
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
}
@end
