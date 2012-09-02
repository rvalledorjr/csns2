<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="csns" uri="http://cs.calstatela.edu/csns" %>

<script>
function clone( id )
{
    var msg = "Do you want to clone this assignment?";
    if( confirm(msg) )
        window.location.href = "clone?sectionId=${section.id}&assignmentId=" + id;
}
</script>

<ul id="title">
<li><a class="bc" href="<c:url value='/section/taught' />">${section.quarter}</a></li>
<li><a class="bc" href="<c:url value='/section/taught#section-${section.id}' />">${section.course.code} - ${section.number}</a></li>
<li>Online Assignments</li>
<li class="align_right"><a href="create?sectionId=${section.id}"><img alt="[Create Online Assignment]"
  title="Create Online Assignment" src="<c:url value='/img/icons/script_add.png' />" /></a></li>
</ul>

<c:if test="${fn:length(assignments) > 0}">
<table class="viewtable">
<thead>
  <tr><th>Name</th><th>Publish Date</th><th>Due Date</th><th></th></tr>
</thead>
<tbody>
  <c:forEach items="${assignments}" var="assignment">
  <tr>
    <td>
      ${assignment.name}
    </td>
    <td class="datetime"><csns:publishDate assignment="${assignment}" /></td>
    <td class="datetime"><csns:dueDate assignment="${assignment}" /></td>
    <td class="action">
      <a href="clone?id=${assignment.id}' />"><img alt="[Clone Assignment]" 
         title="Clone Assignment" src="<c:url value='/img/icons/script_code.png'/>" /></a>
      <a href="edit?id=${assignment.id}"><img alt="[Edit Assignment]"
         title="Edit Assignment" src="<c:url value='/img/icons/script_edit.png'/>" /></a>
    </td>
  </tr>
  </c:forEach>
</tbody>
</table>
</c:if>

<form method="get">
<p><input name="term" type="text" value="${param.term}" class="forminput" size="40" />
<input name="sectionId" type="hidden" value="${param.sectionId}" />
<input name="search" type="submit" value="Search" class="subbutton" /></p>
</form>

<c:if test="${not empty param.term and fn:length(results) == 0}">
<p>No assignments found.</p>
</c:if>

<c:if test="${fn:length(results) > 0}">
<table class="viewtable">
  <tr><th>Quarter</th><th>Code</th><th>Assignment</th><th></th></tr>
  <c:forEach items="${results}" var="assignment">
  <tr>
    <td>${assignment.section.quarter}</td>
    <td>${assignment.section.course.code}</td>
    <td>${assignment.name}</td>
    <td class="action">
      <a href="view?id=${assignment.id}"><img alt="[View Assignment]"
         title="View Assignment" src="<c:url value='/img/icons/script_view.png'/>" /></a>
      <a href="javascript:clone(${assignment.id})"><img alt="[Clone Assignment]" 
         title="Clone Assignment" src="<c:url value='/img/icons/script_code.png'/>" /></a>
    </td>
  </tr>
  </c:forEach>
</table>
</c:if>
