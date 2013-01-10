<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="csns" uri="http://cs.calstatela.edu/csns" %>

<c:set var="section" value="${submission.assignment.section}"/>
<c:set var="assignment" value="${submission.assignment}"/>

<script>
$(function(){
    $("table").tablesorter({
        sortList: [[0,0]]
    });
});
</script>

<ul id="title">
<li><a class="bc" href="<c:url value='/section/taught#section-${section.id}' />">${section.course.code} - ${section.number}</a></li>
<li><a class="bc" href="list?assignmentId=${assignment.id}">${assignment.name}</a></li>
<li><a class="bc" href="grade?id=${submission.id}">${submission.student.name}</a></li>
<li>Upload Additional Files</li>
</ul>

<form method="post" action="upload" enctype="multipart/form-data"><p>
File: <input type="file" name="uploadedFile" size="50" />
<input type="submit" class="subbutton" value="Upload" />
<input type="hidden" name="id" value="${submission.id}" />
<input type="hidden" name="additional" value="true" />
</p></form>

<table class="viewtable">
<thead><tr><th>Name</th><th class="shrink">Size</th><th class="datetime">Date</th></tr></thead>
<tbody>
  <c:forEach items="${submission.files}" var="file">
  <tr>
    <td><a href="<c:url value='/download?fileId=${file.id}' />">${file.name}</a></td>
    <td class="shrink"><csns:fileSize value="${file.size}" /></td>
    <td class="datetime"><fmt:formatDate value="${file.date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
  </tr>
  </c:forEach>
</tbody>
</table>