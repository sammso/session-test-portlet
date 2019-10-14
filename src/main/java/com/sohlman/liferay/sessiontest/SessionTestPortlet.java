package com.sohlman.liferay.sessiontest;

import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.util.PortalUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletSession;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Portlet implementation class SessionTest
 */
public class SessionTestPortlet extends MVCPortlet {
	public static final String APPSCOPE = "APPSCOPE-";
	public static final String PORTSCOPE = "PORTSCOPE-";
	public static final String HTTPSCOPE = "HTTPSCOPE-";
	public static final String UPHTTPSCOPE = "UPHTTPSCOPE-";
	public static final String UPORIGHTTPSCOPE = "UPORIGHTTPSCOPE-";
	public static final String ORIGHTTPSCOPE = "ORIGHTTPSCOPE-";

	
	
	public static List<Entry<String, Object>> filter(Map<String, Object> map) {
		if ( map==null ) {
			return Collections.EMPTY_LIST;
		}
		
		List<Entry<String, Object>> list = new ArrayList<>();
		
		for (Entry<String, Object> entry : map.entrySet()) {
			if ( isValidName(entry.getKey())) {
				list.add(entry);
			}
		}
		
		return list;
	}
	
	public static boolean isValidName(String name) {
		if ( name==null ) {
			return false;
		}
		return name.contains(APPSCOPE) || name.contains(PORTSCOPE) || name.contains(HTTPSCOPE)|| name.contains(UPHTTPSCOPE)|| name.contains(UPORIGHTTPSCOPE)|| name.contains(ORIGHTTPSCOPE);
	}

	public void addToSession(ActionRequest actionRequest,
			ActionResponse actionResponse) {

		String name = actionRequest.getParameter("name");
		String value = actionRequest.getParameter("value");

		if (Validator.isBlank(name) || Validator.isBlank(value)) {

			SessionMessages.add(actionRequest, "Values are empty");
			return;
		}

		PortletSession applicationSession = actionRequest
				.getPortletSession(true);

		applicationSession.setAttribute(APPSCOPE + name, value,
				PortletSession.APPLICATION_SCOPE);
		applicationSession.setAttribute(PORTSCOPE + name, value,
				PortletSession.PORTLET_SCOPE);

		UploadPortletRequest uploadPortletRequest = PortalUtil
				.getUploadPortletRequest(actionRequest);
		
		HttpServletRequest httpServletRequest = PortalUtil
				.getHttpServletRequest(actionRequest);
		HttpSession httpSession = httpServletRequest.getSession(true);
		httpSession.setAttribute(HTTPSCOPE + name, value);

		HttpServletRequest uploadHttpServletRequest = PortalUtil
				.getUploadServletRequest(httpServletRequest);
		HttpSession uploadHttpSession = uploadHttpServletRequest.getSession(true);
		uploadHttpSession.setAttribute(UPHTTPSCOPE + name, value);
		

		HttpServletRequest originalServletRequest = PortalUtil
				.getOriginalServletRequest(httpServletRequest);
		HttpSession originalHttpSession = originalServletRequest.getSession(true);
		originalHttpSession.setAttribute(ORIGHTTPSCOPE + name, value);


		HttpServletRequest uploadOriginalServletRequest = PortalUtil
				.getUploadServletRequest(originalServletRequest);
		HttpSession uploadOriginalHttpSession = uploadOriginalServletRequest.getSession(true);
		uploadOriginalHttpSession.setAttribute(UPORIGHTTPSCOPE + name, value);
	}

	@Override
	public void render(RenderRequest renderRequest,
			RenderResponse renderResponse) throws PortletException, IOException {
		PortletSession portletSession = renderRequest.getPortletSession(false);

		Map<String, Object> portletAppScopeAttributeMap = Collections.EMPTY_MAP;
		Map<String, Object> portletPortletScopeAttributeMap = Collections.EMPTY_MAP;

		if (portletSession != null) {
			portletPortletScopeAttributeMap = portletSession
					.getAttributeMap(PortletSession.PORTLET_SCOPE);
			portletAppScopeAttributeMap = portletSession
					.getAttributeMap(PortletSession.APPLICATION_SCOPE);
		}

		HttpServletRequest httpServletRequest = PortalUtil
				.getHttpServletRequest(renderRequest);
		
		HttpServletRequest uploadHttpServletRequest = PortalUtil.getUploadServletRequest(httpServletRequest);
		
		HttpServletRequest originalServletRequest = PortalUtil
				.getOriginalServletRequest(httpServletRequest);

		HttpServletRequest uploadOriginalServletRequest = PortalUtil.getUploadServletRequest(originalServletRequest);
		
		renderRequest.setAttribute("portletAppScopeAttributeMap",
				portletAppScopeAttributeMap);
		renderRequest.setAttribute("portletPortletScopeAttributeMap",
				portletPortletScopeAttributeMap);
		renderRequest.setAttribute("httpSessionAttributeMap",
				getAttributeMap(httpServletRequest.getSession(false)));
		renderRequest.setAttribute("uploadHttpSessionAttributeMap",
				getAttributeMap(uploadHttpServletRequest.getSession(false)));
		renderRequest.setAttribute("originalHttpSessionAttributeMap",
				getAttributeMap(originalServletRequest.getSession(false)));
		renderRequest.setAttribute("uploadOriginalHttpSessionAttributeMap",
				getAttributeMap(uploadOriginalServletRequest.getSession(false)));		
		
		super.render(renderRequest, renderResponse);
	}

	
	
	private Map<String, Object> getAttributeMap(HttpSession httpSession) {
		if (httpSession == null) {
			return Collections.EMPTY_MAP;
		}
		Enumeration<String> names = httpSession.getAttributeNames();
		Map<String, Object> map = new HashMap<>();
		while (names.hasMoreElements()) {
			String name = names.nextElement();
			map.put(name, httpSession.getAttribute(name));
		}
		return map;
	}
}
