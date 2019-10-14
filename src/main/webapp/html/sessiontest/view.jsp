<%@page import="java.util.Map.Entry"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="theme" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>
<%@ page import="com.liferay.portal.kernel.util.HtmlUtil" %>
<%@ page import="com.liferay.portal.kernel.util.StringPool" %>
<%@ page import="com.sohlman.liferay.sessiontest.*" %>


<portlet:defineObjects />
<theme:defineObjects />

<portlet:actionURL name="addToSession" var="addToSessionURL">

</portlet:actionURL>
<aui:layout >
<aui:column>
<aui:form action="<%=addToSessionURL %>" name="<portlet:namespace />fm">
	<aui:fieldset>
		<aui:column first="true">
		    <aui:input name="name" />
	    </aui:column>
	    <aui:column first="last">
		    <aui:input name="value" />
	    </aui:column>
        <aui:button-row>
            <aui:button type="submit" value="Add"/>
        </aui:button-row>
	</aui:fieldset>
</aui:form>

<% 
Map<String, Object> portletAppScopeAttributeMap = (Map<String, Object>)renderRequest.getAttribute("portletAppScopeAttributeMap");
Map<String, Object> portletPortletScopeAttributeMap = (Map<String, Object>)renderRequest.getAttribute("portletPortletScopeAttributeMap");
Map<String, Object> httpSessionAttributeMap = (Map<String, Object>)renderRequest.getAttribute("httpSessionAttributeMap");
Map<String, Object> uploadHttpSessionAttributeMap = (Map<String, Object>)renderRequest.getAttribute("uploadHttpSessionAttributeMap");
Map<String, Object> originalHttpSessionAttributeMap = (Map<String, Object>)renderRequest.getAttribute("originalHttpSessionAttributeMap");
Map<String, Object> uploadOriginalHttpSessionAttributeMap = (Map<String, Object>)renderRequest.getAttribute("uploadOriginalHttpSessionAttributeMap");

%>



<aui:fieldset label="portletAppScopeAttributeMap (APPSCOPE)">
	<liferay-ui:search-container
		emptyResultsMessage="not found from portletAppScopeAttributeMap">
		<liferay-ui:search-container-results
			results="<%=SessionTestPortlet.filter(portletAppScopeAttributeMap) %>" />
			<liferay-ui:search-container-row
				className="java.util.Map.Entry" keyProperty="key" modelVar="attrEntry"
				escapedModel="<%= true %>">
	   
			<liferay-ui:search-container-column-text name="key" property="key" />
	
			<liferay-ui:search-container-column-text name="value" property="value" />
	
		</liferay-ui:search-container-row>
		<liferay-ui:search-iterator />		
	</liferay-ui:search-container>
</aui:fieldset>

<aui:fieldset label="portletPortletScopeAttributeMap (PORTSCOPE)">
<liferay-ui:search-container
	emptyResultsMessage="not found from portletPortletScopeAttributeMap">
	<liferay-ui:search-container-results
		results="<%=SessionTestPortlet.filter(portletPortletScopeAttributeMap) %>" />
		<liferay-ui:search-container-row
			className="java.util.Map.Entry" keyProperty="key" modelVar="attrEntry"
			escapedModel="<%= true %>">
   
		<liferay-ui:search-container-column-text name="key" property="key" />

		<liferay-ui:search-container-column-text name="value" property="value" />

	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />		
</liferay-ui:search-container>
</aui:fieldset>
<aui:fieldset label="httpSessionAttributeMap (HTTPSCOPE)">
<liferay-ui:search-container
	emptyResultsMessage="not found from portletPortletScopeAttributeMap">
	<liferay-ui:search-container-results
		results="<%=SessionTestPortlet.filter(httpSessionAttributeMap) %>" />
		<liferay-ui:search-container-row
			className="java.util.Map.Entry" keyProperty="key" modelVar="attrEntry"
			escapedModel="<%= true %>">
   
		<liferay-ui:search-container-column-text name="key" property="key" />

		<liferay-ui:search-container-column-text name="value" property="value" />

	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />		
</liferay-ui:search-container>
</aui:fieldset>
<aui:fieldset label="uploadHttpSessionAttributeMap (UPHTTPSCOPE)">
<liferay-ui:search-container
	emptyResultsMessage="not found from uploadHttpSessionAttributeMap">
	<liferay-ui:search-container-results
		results="<%=SessionTestPortlet.filter(uploadHttpSessionAttributeMap) %>" />
		<liferay-ui:search-container-row
			className="java.util.Map.Entry" keyProperty="key" modelVar="attrEntry"
			escapedModel="<%= true %>">
   
		<liferay-ui:search-container-column-text name="key" property="key" />

		<liferay-ui:search-container-column-text name="value" property="value" />

	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />		
</liferay-ui:search-container>
</aui:fieldset>


<aui:fieldset label="originalHttpSessionAttributeMap (ORIGHTTPSCOPE)">
<liferay-ui:search-container
	emptyResultsMessage="not found from originalHttpSessionAttributeMap">
	<liferay-ui:search-container-results
		results="<%=SessionTestPortlet.filter(originalHttpSessionAttributeMap) %>" />
		<liferay-ui:search-container-row
			className="java.util.Map.Entry" keyProperty="key" modelVar="attrEntry"
			escapedModel="<%= true %>">
   
		<liferay-ui:search-container-column-text name="key" property="key" />

		<liferay-ui:search-container-column-text name="value" property="value" />

	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />		
</liferay-ui:search-container>
</aui:fieldset>
<aui:fieldset label="uploadOriginalHttpSessionAttributeMap (UPORIGHTTPSCOPE)">
<liferay-ui:search-container
	emptyResultsMessage="not found from uploadOriginalHttpSessionAttributeMap">
	<liferay-ui:search-container-results
		results="<%=SessionTestPortlet.filter(uploadOriginalHttpSessionAttributeMap) %>" />
		<liferay-ui:search-container-row
			className="java.util.Map.Entry" keyProperty="key" modelVar="attrEntry"
			escapedModel="<%= true %>">
   
		<liferay-ui:search-container-column-text name="key" property="key" />

		<liferay-ui:search-container-column-text name="value" property="value" />

	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />		
</liferay-ui:search-container>
</aui:fieldset>
</aui:column>
</aui:layout>