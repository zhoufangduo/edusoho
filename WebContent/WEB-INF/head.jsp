<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Brand</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li class="dropdown-submenu">
            	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Action</a> 
	            <ul class="dropdown-menu" role="menu">
		            <li><a href="#">Another action</a></li>
		            <li><a href="#">Something else here</a></li>
		            <li class="divider"></li>
		            <li><a href="#">Separated link</a></li>
		            <li class="divider"></li>
		            <li><a href="#">One more separated link</a></li>
		            <li class="dropdown-submenu">
		            	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Action</a> 
			            <ul class="dropdown-menu" role="menu">
				            <li><a href="#">Action</a> </li>
				            <li><a href="#">Another action</a></li>
				            <li><a href="#">Something else here</a></li>
				            <li class="divider"></li>
				            <li><a href="#">Separated link</a></li>
				            <li class="divider"></li>
				            <li><a href="#">One more separated link</a></li>
			            </ul>
					</li>
	            </ul>
			</li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
        
        <li class="dropdown">
           	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Action<span class="caret"></span></a> 
            <ul class="dropdown-menu" role="menu">
	            <li><a href="#">Action</a> </li>
	            <li><a href="#">Another action</a></li>
	            <li><a href="#">Something else here</a></li>
	            <li class="divider"></li>
	            <li><a href="#">Separated link</a></li>
	            <li class="divider"></li>
	            <li><a href="#">One more separated link</a></li>
            </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="search.jsp"><span class="glyphicon glyphicon-search"></span>&nbsp;搜索</a></li>
        <li><a href="login.jsp"><span class="glyphicon glyphicon-hand-right"></span>&nbsp;登录</a></li>
        <li><a href="addUser.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;注册</a></li>
      </ul>
    </div>
  </div>
</div>
