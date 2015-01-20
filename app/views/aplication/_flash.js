<% velocity ||= 'slow' %>
<% delay ||= (velocity =='slow') ? 8000 : 2000 %>
$('#flash').hide().html('<%= j flash_messages("success", "message") %>').fadeIn('<%= velocity %>');