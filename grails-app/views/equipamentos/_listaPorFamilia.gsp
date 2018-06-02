
<table>
<thead>
<tr>
<g:sortableColumn property="tag" title="${message(code: 'equipamentos.tag.label', default: 'Tag')}" />
<g:sortableColumn property="tipo" title="${message(code: 'equipamentos.tipo.label', default: 'Tipo')}" />
<g:sortableColumn property="familia" title="${message(code: 'equipamentos.familia.label', default: 'Familia')}" />
<g:sortableColumn property="previsao_EO" title="${message(code: 'equipamentos.previsao_EO.label', default: 'Previsao EO')}" />
<g:sortableColumn property="previsao_Lib_Civil" title="${message(code: 'equipamentos.previsao_Lib_Civil.label', default: 'Previsao Lib Civil')}" />
</tr>
</thead>
<tbody>
<g:each in="${equipamentosInstanceList}" status="i" var="equipamentosInstance">
<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
<td><g:link action="show" id="${equipamentosInstance.id}">${fieldValue(bean: equipamentosInstance, field: "tag")}</g:link></td>
<td>${fieldValue(bean: equipamentosInstance, field: "tipo")}</td>
<td>${fieldValue(bean: equipamentosInstance, field: "familia")}</td>
<td><g:formatDate date="${equipamentosInstance.previsao_EO}" /></td>
<td><g:formatDate date="${equipamentosInstance.previsao_Lib_Civil}" /></td>
</tr>
</g:each>
</tbody>
</table>
</div>


<div class="pagination">
<g:paginate total="${rowCount}" />
</div>



