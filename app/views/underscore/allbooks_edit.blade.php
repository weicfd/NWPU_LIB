<tr>
	<td class="book_id"><%= obj.book_id %></td>
	<td class="editable book_title"><%= obj.title %></td>
	<td class="editable book_author"><%= obj.author %></td>
	<td class="editable book_isbn"><%= obj.isbn %></td>
	<td class="editable book_dsp"><%= obj.description %></td>
	<td class="book_cat">
		<%
			for(var i=0; i<categories_list.length; i++){
				if(obj.category_id == categories_list[i].id){
		%>
					<%= categories_list[i].category %>
		<%
				}
			}
		%>
	</td>
	<td><a class="btn btn-success" style="cursor: default"><%= obj.avaliable %></a></td>
	<td><a class="btn btn-inverse" style="cursor: default"><%= obj.total_books %></a></td>
	<td><a class="btn btn-success editbooks">Edit</a></td>
	<td><a class="btn btn-danger deletebooks">Delete</a></td>
</tr>