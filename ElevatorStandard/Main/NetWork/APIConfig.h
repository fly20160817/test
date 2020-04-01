//
//  APIConfig.h
//  Elevator
//
//  Created by fly on 2018/11/9.
//  Copyright © 2018年 fly. All rights reserved.
//

#ifndef APIConfig_h
#define APIConfig_h

//http://47.98.98.38  正式服
//http://47.98.121.49 正式图片服务器

//http://172.16.2.6   测试服
//http://101.37.23.169 测试服文件服务器

// @"ws://47.98.106.77:8001/websocket/connect"

#warning 记得改无限距离签到和图片端口

#define BASE_API @"http://172.16.2.6"
#define BASE_API2 @"http://101.37.23.169" //图片服务器
#define WEBSOCKET @"wss://ws.le-parts.com:8080/websocket/connect"

#define PORT_A @"9001"
#define PORT_B @"9097" //图片服务器端口 测试服 9097    正式服 9099

#define AddBasePath(base, port, path) [NSString stringWithFormat:@"%@:%@/%@", base, port, path]



#pragma mark - 任务

//根据电梯id查询电梯部分信息
#define API_LIFTSECTIONINFO AddBasePath(BASE_API, PORT_A, @"applift/getLiftSectionInfo")

//任务列表
#define API_TASKLIST AddBasePath(BASE_API, PORT_A, @"apptask/getByPage")

//获取维保工负责的项目
#define API_PROJECTLIST AddBasePath(BASE_API, PORT_A, @"project/getByName")

//任务知晓
#define API_KNOWTASK AddBasePath(BASE_API, PORT_A, @"apptask/updateTaskStatus")

//任务清单
#define API_TASKDETAIL AddBasePath(BASE_API, PORT_A, @"apptask/getTaskList")

//判断是否签到
#define API_ISSIGN AddBasePath(BASE_API, PORT_A, @"apptask/selectTaskStatus")

//签到
#define API_SIGNIN AddBasePath(BASE_API, PORT_A, @"apptask/updateTaskStatusSign")

//任务清单图片上传
#define API_IMAGEUPLOAD AddBasePath(BASE_API2, PORT_B, @"file/upload")

//下载图片
#define API_DOWNLOADIMAGE AddBasePath(BASE_API2, PORT_B, @"file/download?id=")

//下载缩略图片
#define API_DOWNLOADTHUMBNAILIMAGE AddBasePath(BASE_API2, PORT_B, @"file/download/min/pic?id=")

//维保检查项关联拍照图片
#define AIP_JOINTPROTECTIMAGE AddBasePath(BASE_API, PORT_A, @"maintenanceCheckItemStatus/post")

//任务状态更新
#define API_UPDATETASKSTATUS AddBasePath(BASE_API, PORT_A, @"apptask/getUpdateStatus")

//故障清单
#define API_REPAIRLIST AddBasePath(BASE_API, PORT_A, @"trouble/getPage")

//急修单
#define API_CHECKITEM AddBasePath(BASE_API, PORT_A, @"checkItem/getBytype")

//提交急修单
#define API_SUBMITREPAIRORDER AddBasePath(BASE_API, PORT_A, @"checkInfo/post")

//提交关人报告
#define API_CLOSEREPORT AddBasePath(BASE_API, PORT_A, @"apptask/submitTaskReport")

//申请技术支持
#define API_APPLYSUPPORT AddBasePath(BASE_API, PORT_A, @"technicalSupport/getechnicalApplication")

//技术支持
#define API_SUPPORTLIST AddBasePath(BASE_API, PORT_A, @"technicalSupport/getechnicalApplicationPage")

//技术支持评价
#define API_SUPPORTGRADE AddBasePath(BASE_API, PORT_A, @"technicalSupport/getechnicalApplicationScore")

//质检列表
#define API_QUALITYLIST AddBasePath(BASE_API, PORT_A, @"qualityTask/getTaskQuality")

//提交单项质检项
#define API_QUALITYITEMSUBMIT AddBasePath(BASE_API, PORT_A, @"qualityTask/getUpdateTaskQuality")

//提交质检任务
#define API_QUALITYSUBMIT AddBasePath(BASE_API, PORT_A, @"qualityTask/getQualityTaskComplete")

//设备维护
#define API_SHEBEIWEIHU AddBasePath(BASE_API, PORT_A, @"deviceFault/deviceFaultTask")

//提交设备维护任务
#define API_SBWHSUBMIT AddBasePath(BASE_API, PORT_A, @"deviceFault/completeTask")

//等待设备
#define API_WAITINGFACILITIES AddBasePath(BASE_API, PORT_A, @"deviceFault/updateSolveRes")


//消毒任务列表
#define API_DISINFECTLISY AddBasePath(BASE_API, PORT_A, @"propertyTask/getByPage")

//消毒任务状态更新  0 未开始 01已知晓 02已签到 10已完成
#define API_DISINFECTUPDATE AddBasePath(BASE_API, PORT_A, @"propertyTask/getupdateStatus")

//消毒任务是否已签到
#define API_ISSIGNDISINFECT AddBasePath(BASE_API, PORT_A, @"propertyTask/selectTaskStatus")

//消毒记录
#define API_DISINFECTHISTORY AddBasePath(BASE_API, PORT_A, @"propertyTask/getLiftByPage")

//消毒次数
#define API_DISINFECTHNUMBER AddBasePath(BASE_API, PORT_A, @"propertyTask/getDisinfectionNum")



#pragma mark - 电梯

//电梯数量统计
#define API_LIFTSUM AddBasePath(BASE_API, PORT_A, @"applift/getOnlieLift")

//项目列表    getByPage
#define API_COMMUNITYLIST AddBasePath(BASE_API, PORT_A, @"project/getByProjectPage")

//项目下电梯列表
#define API_COMMUNITYLIFTLIST AddBasePath(BASE_API, PORT_A, @"applift/getProjectLift")

//离线电梯列表
#define API_OFFLINELIFTLIST AddBasePath(BASE_API, PORT_A, @"applift/getofflineLift")

//电梯列表
#define API_LIFTLIST AddBasePath(BASE_API, PORT_A, @"applift/getByPage")

//电梯详情 
#define API_LIFTINFO AddBasePath(BASE_API, PORT_A, @"applift/liftInfoResult")

//维保计划
#define API_MAINTENANCEPLAN AddBasePath(BASE_API, PORT_A, @"plan/getLiftPlan")

//故障记录
#define API_FAULTRECORD AddBasePath(BASE_API, PORT_A, @"trouble/getPageTrouble")

//大修改造
#define API_RECONSTRUCTION AddBasePath(BASE_API, PORT_A, @"plan/getTransformation")

//检验记录
#define API_INSPECTIONRECORDS AddBasePath(BASE_API, PORT_A, @"examineInfo/getTestRecord")

//维保工时
#define API_STATISTICAL AddBasePath(BASE_API, PORT_A, @"empl/getEmplIndexPlus")

//历史任务
#define API_HISTORYTASK AddBasePath(BASE_API, PORT_A, @"empl/getTaskItem")

//更新电梯经纬度
#define API_UPDATEGPS AddBasePath(BASE_API, PORT_A, @"applift/artificialPosition")

//电梯报修
#define API_REPAIRLIFT AddBasePath(BASE_API, PORT_A, @"apptask/getPublishTask")



#pragma mark - 我的

//退出
#define API_EXIT AddBasePath(BASE_API, PORT_A, @"appuser/logout")

//上传经纬度
#define API_UPLOADLOCATION AddBasePath(BASE_API, PORT_A, @"emplLocation/getLocation")

//验证码
#define API_GETCODE AddBasePath(BASE_API, PORT_A, @"appuser/getCode")

//获取手机验证码
#define API_GETMOBILECODE AddBasePath(BASE_API, PORT_A, @"appuser/getMobileCode")

//更换手机号
#define API_CHANGEPHONE AddBasePath(BASE_API, PORT_A, @"appuser/getUpdateMobile")

//登录
#define API_LOGIN AddBasePath(BASE_API, PORT_A, @"appuser/userLogin")

//修改密码
#define API_CHANGEPASSWORD AddBasePath(BASE_API, PORT_A, @"appuser/modifyPwd")

//修改头像
#define API_CHANGEHEADIMAGE AddBasePath(BASE_API, PORT_A, @"appuser/getUpdateAvatar")

//摄像头列表
#define API_CAMERALIST AddBasePath(BASE_API, PORT_A, @"originalCamera/getPage")

//sim列表
#define API_SIMLIST AddBasePath(BASE_API, PORT_A, @"originalSim/getPage")

//主机列表
#define API_HOSTLIST AddBasePath(BASE_API, PORT_A, @"originalDevice/getPage")

//广告屏列表
#define API_ADSCREEN AddBasePath(BASE_API, PORT_A, @"device/getAdScreen")

//按键列表
#define API_BUTTONLIST AddBasePath(BASE_API, PORT_A, @"originalPresskey/getAdScreen")

//三码合一
#define API_THREECODE AddBasePath(BASE_API, PORT_A, @"device/bindDevice")

//替换部件
#define API_REPLACEDEVICE AddBasePath(BASE_API, PORT_A, @"device/getReplaceDevice")

//已合成列表
#define API_SUITlIST AddBasePath(BASE_API, PORT_A, @"device/getUnboundDevice")

//解绑三码
#define API_UNBUNDLINGCODE AddBasePath(BASE_API, PORT_A, @"device/relieveBindDevice")

//绑定电梯
#define API_BINDLIFT AddBasePath(BASE_API, PORT_A, @"applift/getLiftBindDevice")

//解绑电梯
#define API_UNBUNDLINGLIFT AddBasePath(BASE_API, PORT_A, @"applift/getRelieveBind")

//设备入库
#define API_ADDDEVICE AddBasePath(BASE_API, PORT_A, @"device/getInsertDevice")

//设备删除
#define API_DELETEDEVICE AddBasePath(BASE_API, PORT_A, @"device/getdeleteDevice")

//扫一扫查询
#define API_DEVICEBARCODE AddBasePath(BASE_API, PORT_A, @"device/getDevice")

//任务跟踪列表
#define API_TASKTRACKLIST AddBasePath(BASE_API, PORT_A, @"apptask/getUndoneTask")

//任务跟踪日志
#define API_TASKTRACKLOG AddBasePath(BASE_API, PORT_A, @"apptask/getTaskTrack")

//更换派员列表
#define API_CHANGESWORKERLIST AddBasePath(BASE_API, PORT_A, @"apptask/findChangeTask")

//获取手下的维保工
#define API_GETWORKERLIST AddBasePath(BASE_API, PORT_A, @"empl/getByPage")

//更换派员
#define API_CHANGESWORKER AddBasePath(BASE_API, PORT_A, @"apptask/changeTaskEmpl")

//服务评价
#define API_EVALUATIONLIST AddBasePath(BASE_API, PORT_A, @"apptask/getTaskScore")

//轨迹回放
#define API_USERORBIT AddBasePath(BASE_API, PORT_A, @"emplLocation/getEmplLocation")

//大修申请
#define API_BIGMAINTAINAPPLY AddBasePath(BASE_API, PORT_A, @"bigMaintainApply/getRepairApplication")

//获取电梯
#define API_GETLIFT AddBasePath(BASE_API, PORT_A, @"project/getProjectLift")

//获取大修负责人
#define API_BIGMAINTAINPEOPLE AddBasePath(BASE_API, PORT_A, @"orgunit/getByPage")

//大修已申请列表
#define API_BIGMAINTAINAPPLYLIST AddBasePath(BASE_API, PORT_A, @"bigMaintainApply/getByPage")

//大修详情
#define API_BIGMAINTAINAPPLYDETAIL AddBasePath(BASE_API, PORT_A, @"bigMaintainApply/getById")

//大修审批列表
#define API_BIGMAINTAINAPPROVALLIST AddBasePath(BASE_API, PORT_A, @"bigMaintainApply/getApproverPage")

//大修审批
#define API_BIGMAINTAINAPPROVER AddBasePath(BASE_API, PORT_A, @"bigMaintainApply/getApprover")

//平台评价
#define API_PLATFORMEVALUATION AddBasePath(BASE_API, PORT_A, @"useFeedback/addFeedback")

//平台评价列表
#define API_PLATFORMEVALUATIONLIST AddBasePath(BASE_API, PORT_A, @"useFeedback/findFeedback")

//物业评价列表
#define API_PROPERTYEVALUATIONLIST AddBasePath(BASE_API, PORT_A, @"apptask/getByAppraise")

//物业评价详情
#define API_PROPERTYEVALUATIONDETAIL AddBasePath(BASE_API, PORT_A, @"apptask/getReportInfo")

//物业评价
#define API_PROPERTYEVALUATION AddBasePath(BASE_API, PORT_A, @"apptask/taskAppraise")



#pragma mark - 配件

//获取三级组类
#define API_FITTINGSGROUP AddBasePath(BASE_API, PORT_A, @"partsGroup/getPage")

//获取配件品牌
#define API_FITTINGSBRAND AddBasePath(BASE_API, PORT_A, @"partsBrand/getPage")

//配件列表
#define API_FITTINGLIST AddBasePath(BASE_API, PORT_A, @"partsInfo/getPage")

//配件详情
#define API_FITTINGINFO AddBasePath(BASE_API, PORT_A, @"partsInfo/getPageById")


#endif /* APIConfig_h */


