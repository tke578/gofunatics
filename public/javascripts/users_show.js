$(document).ready(function(){
	$('.remlink_hide, .addlink_hide, #no_interest').hide();
	if (0!=$('.remlink_show').length) $("#no_favorite").hide();
	$('.remlink_hide, .remlink_show').click(function(){
		moveMe=$(this).attr("id").substring(8); // DIV NAME IS INTEREST ID, LINK NAME IS SAME WITH ".remlink" PREFIX TO KEEP IT UNIQUE
		$("#"+moveMe).prependTo("#bottom_append");
		$("#"+moveMe+" .addlink_hide").attr("class","addlink_show");
		$("#"+moveMe+" .remlink_show").attr("class","remlink_hide");
		$("#"+moveMe+" .search_donthide").attr("class","search_hide");
		$('.addlink_show').show();
		$('.remlink_hide').hide();
		$('#no_interest').hide();
		if (0==$('.remlink_show').length) $("#no_favorite").show();
	});
	$('.addlink_hide, .addlink_show').click(function(){
		$("#no_favorite").hide();  // IN CASE THIS IS 1ST INTEREST ADDED TO TOP BOX
		moveMe=$(this).attr("id").substring(8); // DIV NAME IS INTEREST ID, LINK NAME IS SAME WITH ".addlink" PREFIX TO KEEP IT UNIQUE
		$("#"+moveMe).prependTo("#top_append");
		$("#"+moveMe+" .remlink_hide").attr("class","remlink_show");
		$("#"+moveMe+" .addlink_show").attr("class","addlink_hide");
		$("#"+moveMe+" .search_hide").attr("class","search_donthide");
		$('.remlink_show').show();
		$('.addlink_hide').hide();
	});
	$('#interest_search').keyup(function(){
		foundOne=false;
		searchStr=$(this).val().toUpperCase();
		$('.search_hide').each(function(){
			interestName=$(this).attr("id").toUpperCase();
			if (-1==interestName.indexOf(searchStr)) $(this).hide();
			else 
			{
				$(this).show();
				foundOne=true;
			}
			if (foundOne) $('#no_interest').hide();
			else $('#no_interest').show();
		});
	});
});