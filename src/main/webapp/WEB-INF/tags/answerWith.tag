<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@attribute name="answer" type="br.com.caelum.brutal.model.Answer" required="true" %>
<%@attribute name="vote" type="br.com.caelum.brutal.model.Vote" required="true" %>
<section class="post-area">
	<div class="post-meta">
		<tags:voteFor item="${answer}" type="answer" vote="${vote}"/>
		<span class="solution-mark sprite container">CERTO</span>
		<c:if test="${answer.author.id == currentUser.id}">
			<a class="mark-as-solution requires-login" href="${linkTo[AnswerController].markAsSolution}">
				<fmt:message key="answer.mark_as_solution" />
			</a>
		</c:if>
	</div>
	<div class="post-container">
		<div class="post-text" id="answer-${answer.id }">${answer.markedDescription}</div>
		<div class="post-interactions">
			<ul class="post-action-nav nav">
				<li class="nav-item">
					<a class="post-action" href="<c:url value="/answer/edit/${answer.id}"/>"><fmt:message key="edit" /></a>
				</li>
			</ul>
			<tags:touchesFor touchable="${answer}" />
		</div>
		<tags:add-a-comment item="${answer}"/>
	</div>
</section>