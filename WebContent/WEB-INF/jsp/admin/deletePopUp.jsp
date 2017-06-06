<div class="modal inmodal fade" id="delModel" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					
					<h4 class="modal-title"><i class="fa fa-warning"></i> Alert</h4>
					<!--  <small class="font-bold">Lorem Ipsum is simply dummy text
						of the printing and typesetting industry.</small> -->
				</div>
				<div class="modal-body">
					<p>
						<strong>${delMsg}</strong>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal" id="delConfFalse">Cancel</button>
					<button type="button" class="btn btn-primary" id="delConfTrue">Delete</button>
				</div>
			</div>
		</div>
</div>

<script type="text/javascript">
function getDelConfirm(callback){

    $("#delModel").modal({show:true,
        keyboard: false
	});

    $('#delConfFalse').click(function(){
        $('#delModel').modal('hide');
        if (callback) callback(false);

    });
    
    $('#delConfTrue').click(function(){
        $('#delModel').modal('hide');
        if (callback) callback(true);
    });
}

function deleteSingleRow(fromData,delUrl) {
	
	getDelConfirm(function(result) {
		var flag = result;
		if (flag) {
			
			$.ajax({
				url : delUrl,
				data : fromData,
				type : "POST",
				success : function(resdata, status, xhr) {
					/* var res = resdata.trim();
					if (res == 'Correct') {
						alert("done");
					} */
				},
				error : function(xhr, status, errorThrown) {
					alert("Sorry, there was a problem!");
					console.log("Error: " + errorThrown);
					console.log("Status: " + status);
					console.dir(xhr);
				},
				complete : function(xhr, status) {
					$(grid_selector).trigger( 'reloadGrid' );
				}
			});
		}
		});
}
</script>