$(function() {

    $('#side-menu').metisMenu();

});

$(function() {
    $(window).bind("load resize", function() {
        topOffset = 50;
        width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('div.navbar-collapse').addClass('collapse');
            topOffset = 100; // 2-row-menu
        } else {
            $('div.navbar-collapse').removeClass('collapse');
        }

        height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 1;
        height = height - topOffset;
        if (height < 1) height = 1;
        if (height > topOffset) {
            $("#page-wrapper").css("min-height", (height) + "px");
        }
    });

    var url = window.location;
    var element = $('ul.nav a').filter(function() {
        return this.href == url;
    }).addClass('active').parent().parent().addClass('in').parent();
    if (element.is('li')) {
        element.addClass('active');
    }
});

function initSelect(obj, action, appendFunc) {
    $.get(action, function(data) {
        if (data && data.length > 0) {
            for (var i = 0; i < data.length ; i++) {
                $(obj).append(appendFunc(data[i]));
            }
        }
    });
}

function areaSelectOptionAppend(area) {
    return "<option value='" + area.id +  "'>" + area.areaName + "</option>";
}

function userSelectOptionAppend(user) {
    return "<option value='" + user.userCode +  "'>" + user.username + "</option>";
}

function userSelectOptionAppendById(user) {
    return "<option value='" + user.id +  "'>" + user.username + "</option>";
}

function bindQryEvent(btn, form, action, upgradeDiv) {
    $(btn).click(function(){
        $(upgradeDiv).load(action, $(form).serialize());
    });
}

function checkInput(obj, blankErrMsg) {
    if ($(obj) && $(obj).val() == '') {
        $(obj).focus();
        alert(blankErrMsg);
        return false;
    }
    return true;
}
function checkNumberInput(obj, blankErrMsg) {
    if (checkInput(obj, blankErrMsg)) {
        if (!$.isNumeric($(obj).val())) {
            $(obj).focus();
            alert("非法数字!请检查输入!");
            return false;
        }
        return true;
    }
    return false;
}
