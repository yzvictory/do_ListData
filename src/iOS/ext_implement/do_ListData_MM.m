//
//  do_ListData_MM.m
//  DoExt_MM
//
//  Created by @userName on @time.
//  Copyright (c) 2015年 DoExt. All rights reserved.
//

#import "do_ListData_MM.h"

#import "doScriptEngineHelper.h"
#import "doIScriptEngine.h"
#import "doInvokeResult.h"
#import "doJsonNode.h"
#import "doJsonValue.h"

@implementation do_ListData_MM
{
    @private
    NSMutableArray* array;
}
#pragma mark - doIListData
-(int) GetCount
{
    return (int)array.count;
}
-(id) GetData:(int) index
{
    return array[index];
}

#pragma mark - 注册属性（--属性定义--）
/*
 [self RegistProperty:[[doProperty alloc]init:@"属性名" :属性类型 :@"默认值" : BOOL:是否支持代码修改属性]];
 */
-(void)OnInit
{
    [super OnInit];
    if(array==nil)
        array = [[NSMutableArray alloc]init];
    //注册属性
}

//销毁所有的全局对象
-(void)Dispose
{
    [array removeAllObjects];
    //自定义的全局属性
}
#pragma mark -
#pragma mark - 同步异步方法的实现
/*
 1.参数节点
 doJsonNode *_dictParas = [parms objectAtIndex:0];
 a.在节点中，获取对应的参数
 NSString *title = [_dictParas GetOneText:@"title" :@"" ];
 说明：第一个参数为对象名，第二为默认值
 
 2.脚本运行时的引擎
 id<doIScriptEngine> _scritEngine = [parms objectAtIndex:1];
 
 同步：
 3.同步回调对象(有回调需要添加如下代码)
 doInvokeResult *_invokeResult = [parms objectAtIndex:2];
 回调信息
 如：（回调一个字符串信息）
 [_invokeResult SetResultText:((doUIModule *)_model).UniqueKey];
 异步：
 3.获取回调函数名(异步方法都有回调)
 NSString *_callbackName = [parms objectAtIndex:2];
 在合适的地方进行下面的代码，完成回调
 新建一个回调对象
 doInvokeResult *_invokeResult = [[doInvokeResult alloc] init];
 填入对应的信息
 如：（回调一个字符串）
 [_invokeResult SetResultText: @"异步方法完成"];
 [_scritEngine Callback:_callbackName :_invokeResult];
 */
//同步
 - (void)addData:(NSArray *)parms
 {
     doJsonNode *_dictParas = [parms objectAtIndex:0];
     //自己的代码实现
     NSArray* datas = [_dictParas GetOneNodeArray:@"data"];
     [array addObjectsFromArray:datas];
     
 }
 - (void)getCount:(NSArray *)parms
 {
     doInvokeResult *_invokeResult = [parms objectAtIndex:2];
     [_invokeResult SetResultInteger:(int)array.count];
     //自己的代码实现
 }
 - (void)getData:(NSArray *)parms
 {
     doJsonNode *_dictParas = [parms objectAtIndex:0];
     //自己的代码实现
     int index = [_dictParas GetOneInteger:@"index" : 0];
     doJsonValue* _jsonValue = array[index];
     doInvokeResult *_invokeResult = [parms objectAtIndex:2];
     [_invokeResult SetResultText:[_jsonValue ExportToText:YES]];
 }
 - (void)initData:(NSArray *)parms
 {
     doJsonNode *_dictParas = [parms objectAtIndex:0];
     //自己的代码实现
     NSArray* datas = [_dictParas GetOneNodeArray:@"data"];
     [array removeAllObjects];
     [array addObjectsFromArray:datas];
 }
 - (void)removeAll:(NSArray *)parms
 {
     //自己的代码实现
     [array removeAllObjects];
 }
 - (void)removeData:(NSArray *)parms
 {
     doJsonNode *_dictParas = [parms objectAtIndex:0];
     //自己的代码实现
     int index = [_dictParas GetOneInteger:@"index" : 0];
     [array removeObjectAtIndex:index];
 }
 - (void)updateData:(NSArray *)parms
 {
     doJsonNode *_dictParas = [parms objectAtIndex:0];
     //自己的代码实现
     int index = [_dictParas GetOneInteger:@"index" : 0];
     doJsonValue* _jsonValue = [_dictParas GetOneValue:@"data"];
     array[index] = _jsonValue;
 }
//异步

@end