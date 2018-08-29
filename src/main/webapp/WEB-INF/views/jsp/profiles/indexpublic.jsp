<%@ include file="../../layout/taglib.jsp"%>

<c:url var="baseUrl" value="/public/profiles?page=" />
<tiles:putAttribute name="basePaginationUrl" value="${baseUrl}" cascade="true"/>


<fmt:parseNumber var="count" value="0" />
<fmt:parseNumber var="noColumns" value="4" />
<fmt:parseNumber var="starter" value="0" />
<fmt:parseNumber var="unit" value="1" />
<fmt:parseNumber var="even" value="2" />
<fmt:parseNumber var="friendSize" value="${fn:length(profiles)}" />

<div class="headline">
<h2>All Profiles - <c:out value="${page.totalRecords}" /></h2>
</div>

<%@ include file="../nullLayouts/indexprofilesajax.jsp"%>

<tiles:insertAttribute name="pagination" ignore="true"/>