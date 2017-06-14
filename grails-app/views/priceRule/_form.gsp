<%@ page import="com.cpic.sme.PriceRule" %>



<div class="am-form-group fieldcontain ${hasErrors(bean: priceRuleInstance, field: 'xz', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="xz">
		<g:message code="priceRule.xz.label" default="Xz" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="xz" value="${priceRuleInstance?.xz}"/>
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: priceRuleInstance, field: 'price', 'error')} required">
	<label class="am-u-sm-3 am-form-label" for="price">
		<g:message code="priceRule.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<div class="am-u-sm-9">
	<g:field name="price" type="number" value="${priceRuleInstance.price}" required=""/>
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: priceRuleInstance, field: 'factor1', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="factor1">
		<g:message code="priceRule.factor1.label" default="Factor1" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="factor1" value="${priceRuleInstance?.factor1}"/>
	</div>
</div>

<div class="am-form-group fieldcontain ${hasErrors(bean: priceRuleInstance, field: 'factor2', 'error')} ">
	<label class="am-u-sm-3 am-form-label" for="factor2">
		<g:message code="priceRule.factor2.label" default="Factor2" />
		
	</label>
	<div class="am-u-sm-9">
	<g:textField name="factor2" value="${priceRuleInstance?.factor2}"/>
	</div>
</div>


