var LAST_ID;
var ACCOUNT_TRANSFERS  = "https://aqualife2.supernode.me:7891/account/transfers/all?address=NB6ADFCKPLSHP2WGPNDT3PLLSTXEA3YYAGMSQBPB";
$.ajax({url: ACCOUNT_TRANSFERS,type: 'GET'}).done(function(res){parse_transfers(res)});

$('#transfers_more').click(function(){
    $.ajax({url: ACCOUNT_TRANSFERS + "&id=" + LAST_ID,type: 'GET'}).done(function(res){parse_transfers(res)});
    console.log(tran.amount);
})

var parse_transfers = function(result){

    var dataArray = result.data;
    // console.log(dataArray);
    dataArray.forEach(function(val){
        var meta = val.meta;
        LAST_ID = meta.id;
        var tran = val.transaction;
        //console.log(meta);
        //console.log(LAST_ID);
        // console.log(tran);

        $("#transfers tbody").append("aaaaaaaa");
        console.log(tran.amount);
    });
}