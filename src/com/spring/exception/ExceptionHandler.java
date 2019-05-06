package com.spring.exception;

import com.alibaba.fastjson.support.spring.FastJsonJsonView;
import com.spring.util.BusinessCodes;
import com.spring.util.JsonHelper;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by zhanggt on 2015-12-24.
 */
public class ExceptionHandler implements HandlerExceptionResolver {

    private Log logger = LogFactory.getLog(this.getClass());

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        printLog(request, ex);
        ModelAndView mv = new ModelAndView();
        FastJsonJsonView view = new FastJsonJsonView();
        if (ex instanceof BusinessException) {
            BusinessException e = (BusinessException) ex;
            Map<String, Object> resp = JsonHelper.toRespJson(e.getErrorCode(), ex.getMessage());
            view.setAttributesMap(resp);
            mv.setView(view);
            return mv;
        } else {
            Map<String, Object> resp = JsonHelper.toRespJson(BusinessCodes.ERROR_CODE, BusinessCodes.ERROR_MSG);
            view.setAttributesMap(resp);
            mv.setView(view);
            return mv;
        }
    }


    private void printLog(HttpServletRequest request, Exception ex) {
        if (logger.isErrorEnabled()) {
            String uri = request.getRequestURI();
            @SuppressWarnings("unchecked")
            Map<String, ?> parameterMap = request.getParameterMap();
            String prestr = "";
            List<String> keys = new ArrayList<String>(parameterMap.keySet());
            for (int i = 0; i < keys.size(); i++) {
                try {
                    String key = keys.get(i);
                    String[] values = (String[]) parameterMap.get(key);
                    String valueStr = values[0];
                    if (values.length > 1) {
                        valueStr = "[";
                        for (int j = 0; j < values.length; j++) {
                            valueStr += values[j];
                            valueStr += (j == values.length - 1) ? "" : ",";
                        }
                        valueStr = "]";
                    }
                    prestr += key + "=" + valueStr;
                    prestr += (i == keys.size() - 1) ? "" : "&";
                } catch (Exception e) {
                    logger.error("", e);
                }
            }
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss SSS");
            String currentTime = df.format(new Date());
            logger.error("request Exception ,response time :" + currentTime + "  request uri:" + uri + " parameter :" + prestr, ex);
        }
    }
}