<cfhtmlhead text='<script type="text/javascript" src="/javascripts/jquery.slug.js"></script>'>

<script type="text/javascript">
$(document).ready(function()
{
  
  // slug function
  $("#page-title").slug({hide: false});
  
  
  $(".more").hide();
  //toggle the componenet with class msg_body
  $(".hideShow").click(function()
  {
    $(".morelink").hide();
    $(".more").slideToggle(600);
    return false;
  });
  
   $(".lessClick").click(function()
  {
    $(".morelink").show();
    $(".more").slideToggle(600);
    return false;
  });
});
</script>

<h1>Edit Page</h1>

<cfoutput>
			
  #errorMessagesFor("page")#
	
	#startFormTag(route="update_page_path", parentID=params.parentID, key=params.key, class="form")#
				
		<p><label class="label">Page Title</label>
			#textField(objectName='page', property='title', class="text_field")#</p>
		
		<p class="morelink"><a href="" class="hideShow">more</a></p>
													
		<div class="more">
		  
		  	<p><label class="label">Slug</label>
						#textField(objectName='page', property='slug', class="text_field slug")#</p>
						
				<p><label class="label">Breadcrumb</label>
						#textField(objectName='page', property='breadcrumb', class="text_field")#</p>
					
				<p><label class="label">Description</label>
						#textField(objectName='page', property='description', class="text_field")#</p>	
							
				<p><label class="label">Keywords</label>
						#textField(objectName='page', property='keywords', class="text_field")#</p>
						
			<a href="" class="lessClick">less</a>
				
		</div>
		
	  <p>
	    <label class="label">Body</label>
	    #hiddenField(objectName="pagePart", property="id")#
	    #hiddenField(objectName="pagePart", property="name")#
	    #textArea(objectName="pagePart", property="content", class="text_area", rows="10")#
	  </p>
	 
	 <p>
  	<label><strong>Layout</strong></label>
  	  #select(objectName='page', property='layoutID', options=layouts, valueField="id", textField="name")#
  	  &nbsp;&nbsp;&nbsp;&nbsp;
  	<label><strong>Page Type</strong></label>
  	  #select(objectName='page', property='pageClassID', options=pageClasses, valueField="id", textField="name")#
  	  &nbsp;&nbsp;&nbsp;&nbsp;
  	<label><strong>Status</strong></label>
  	 #select(objectName="page", property="status", options=status)#
  </p>
					
	  	<p>#submitTag(class="button", value="Update Page &rarr;")# or #linkTo(text="Cancel", route="pages_path")#</p>
		
	#endFormTag()#
			
</cfoutput>