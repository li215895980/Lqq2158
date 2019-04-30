<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>首页面</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jquery-easyui-1.6.6/themes/default/easyui.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jquery-easyui-1.6.6/themes/icon.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath }/jquery-easyui-1.6.6/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/jquery-easyui-1.6.6/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/jquery-easyui-1.6.6/locale/easyui-lang-zh_CN.js"></script>
		<script>
			$(function(){
				$("#tree").tree({
					lines: true,
					url:'${pageContext.request.contextPath }/AutoInfo/findAutoInfo.do',
					onLoadSuccess:function(){
						$("#tree").tree("collapseAll");
					},
					onClick:function(node){
						if(node.id==54){
							logout();
						}else if(node.id==53){
							openPasswordModifyDialog();
						}else if(node.attributes.authPath){
							openTab(node);
						}
					}
				});
			});
			
			function openTab(node){
				if($("#tabs").tabs("exists",node.text)){
					$("#tabs").tabs("select",node.text);
				}else{
					var content="<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src=${pageContext.request.contextPath}/html/" + node.attributes.authPath + "></iframe>"
					$("#tabs").tabs("add",{
						title:node.text,
						iconCls:node.iconCls,
						closable:true,
						content:content
					});
				}
			}
		</script>
	</head>
	<body class="easyui-layout">
		<div data-options="region:'north',collapsible:false" style="height:71px;">
			<div style="padding: 0px;margin: 0px;background-color: #E0ECFF;">
				<table>
				     <tr>
				          <td><img alt="北邮在线" src="${pageContext.request.contextPath}/images/mainlogo.png"></td>
				          <td valign="bottom">欢迎：${currentUser.userName }&nbsp;&nbsp;『${currentUser.roleName }』</td>
				    </tr>
				</table>
            </div>
		</div>
		<div data-options="region:'south',collapsible:false" style="height:30px;text-align: center;line-height: 30px;">
			版权所有 北邮在线<a href="http://www.xianyazhuo.com" target="_blank">http://www.xianyazhuo.com</a>
		</div>
		<div data-options="region:'west',split:true,title:'导航菜单'" style="width:200px;border-right: 0">
			<ul id="tree" class="easyui-tree"></ul>
		</div>
		<div data-options="region:'center'">
			<div class="easyui-tabs" fit="true" border="false" id="tabs">
				<div title="首页" data-options="iconCls:'icon-home'">
					<div align="center" style="padding-top: 100px;">
						<font color="red" size="10">欢迎使用</font>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>