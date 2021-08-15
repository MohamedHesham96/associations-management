<%--
  Created by IntelliJ IDEA.
  User: bassemgawish
  Date: 1/23/21
  Time: 5:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Sidebar -->
<div class="sidebar" id="sidebar">
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li class="menu-title">
                    <span>Main</span>
                </li>

                <sec:authorize access="hasAnyRole('MANAGER','OWNER')">
                    <li class="submenu">
                        <a href="#"><i class="fe fe-document"></i> <span> Settings</span> <span
                                class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li class="submenu">
                                <a href="javascript:void(0);"> <span>User Management</span> <span
                                        class="menu-arrow"></span></a>
                                <ul style="display: none;">
                                    <li>
                                        <a href="${pageContext.servletContext.contextPath}/app/settings/users"><span>Users</span></a>
                                    </li>

                                    <sec:authorize access="hasAnyRole('OWNER')">
                                        <li>
                                            <a href="${pageContext.servletContext.contextPath}/app/settings/user/invitation"><span>Invitations</span></a>
                                        </li>
                                    </sec:authorize>

                                </ul>
                            </li>

                            <sec:authorize access="hasAnyRole('OWNER')">
                                <li class="submenu">
                                    <a href="javascript:void(0);"> <span>Team Management</span> <span
                                            class="menu-arrow"></span></a>
                                    <ul style="display: none;">
                                        <li>
                                            <a href="${pageContext.servletContext.contextPath}/app/settings/teams"><span>Teams</span></a>
                                        </li>
                                    </ul>
                                </li>
                            </sec:authorize>

                        </ul>

                    </li>
                </sec:authorize>

                <li class="submenu">
                    <a href="#"><i class="fe fe-document"></i> <span> Vacations</span> <span class="menu-arrow"></span></a>
                    <ul style="display: none;">

                        <sec:authorize access="hasAnyRole('MANAGER','EMPLOYEE')">
                            <li>
                                <a href="${pageContext.servletContext.contextPath}/app/vacation/requests/myRequests">
                                    <span>My Requests</span></a>
                            </li>
                        </sec:authorize>

                        <sec:authorize access="hasAnyRole('MANAGER','OWNER')">
                            <li>
                                <a href="${pageContext.servletContext.contextPath}/app/vacation/requests">
                                    <span>All Requests</span></a>
                            </li>
                        </sec:authorize>
                    </ul>
                </li>


                <%--<li class="menu-title">
                    <span>Pages</span>
                </li>
                <li class="submenu">
                    <a href="#"><i class="fe fe-document"></i> <span> Blog </span> <span class="menu-arrow"></span></a>
                    <ul style="display: none;">
                        <li><a href="blog.html"> Blog </a></li>
                        <li><a href="blog-details.html"> Blog Details</a></li>
                        <li><a href="add-blog.html"> Add Blog </a></li>
                        <li><a href="edit-blog.html"> Edit Blog </a></li>
                    </ul>
                </li>
                <li><a href="product-list.html"><i class="fe fe-layout"></i> <span>Product List</span></a></li>
                <li><a href="pharmacy-list.html"><i class="fe fe-vector"></i> <span>Pharmacy List</span></a></li>
                <li>
                    <a href="profile.html"><i class="fe fe-user-plus"></i> <span>Profile</span></a>
                </li>
                <li class="submenu">
                    <a href="#"><i class="fe fe-document"></i> <span> Authentication </span> <span class="menu-arrow"></span></a>
                    <ul style="display: none;">
                        <li><a href="login.html"> Login </a></li>
                        <li><a href="register.html"> Register </a></li>
                        <li><a href="forgot-password.html"> Forgot Password </a></li>
                        <li><a href="lock-screen.html"> Lock Screen </a></li>
                    </ul>
                </li>
                <li class="submenu">
                    <a href="#"><i class="fe fe-warning"></i> <span> Error Pages </span> <span class="menu-arrow"></span></a>
                    <ul style="display: none;">
                        <li><a href="error-404.html">404 Error </a></li>
                        <li><a href="error-500.html">500 Error </a></li>
                    </ul>
                </li>
                <li>
                    <a href="blank-page.html"><i class="fe fe-file"></i> <span>Blank Page</span></a>
                </li>
                <li class="menu-title">
                    <span>UI Interface</span>
                </li>
                <li>
                    <a href="components.html"><i class="fe fe-vector"></i> <span>Components</span></a>
                </li>
                <li class="submenu">
                    <a href="#"><i class="fe fe-layout"></i> <span> Forms </span> <span class="menu-arrow"></span></a>
                    <ul style="display: none;">
                        <li><a href="form-basic-inputs.html">Basic Inputs </a></li>
                        <li><a href="form-input-groups.html">Input Groups </a></li>
                        <li><a href="form-horizontal.html">Horizontal Form </a></li>
                        <li><a href="form-vertical.html"> Vertical Form </a></li>
                        <li><a href="form-mask.html"> Form Mask </a></li>
                        <li><a href="form-validation.html"> Form Validation </a></li>
                    </ul>
                </li>
                <li class="submenu">
                    <a href="#"><i class="fe fe-table"></i> <span> Tables </span> <span class="menu-arrow"></span></a>
                    <ul style="display: none;">
                        <li><a href="tables-basic.html">Basic Tables </a></li>
                        <li><a href="data-tables.html">Data Table </a></li>
                    </ul>
                </li>
                <li class="submenu">
                    <a href="javascript:void(0);"><i class="fe fe-code"></i> <span>Multi Level</span> <span class="menu-arrow"></span></a>
                    <ul style="display: none;">
                        <li class="submenu">
                            <a href="javascript:void(0);"> <span>Level 1</span> <span class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="javascript:void(0);"><span>Level 2</span></a></li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"> <span> Level 2</span> <span class="menu-arrow"></span></a>
                                    <ul style="display: none;">
                                        <li><a href="javascript:void(0);">Level 3</a></li>
                                        <li><a href="javascript:void(0);">Level 3</a></li>
                                    </ul>
                                </li>
                                <li><a href="javascript:void(0);"> <span>Level 2</span></a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:void(0);"> <span>Level 1</span></a>
                        </li>
                    </ul>
                </li>--%>
            </ul>
        </div>
    </div>
</div>
<!-- /Sidebar -->
