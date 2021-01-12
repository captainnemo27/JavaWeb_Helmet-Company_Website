/*!

 =========================================================
 * Light Bootstrap Dashboard - v1.4.0
 =========================================================

 * Product Page: http://www.creative-tim.com/product/light-bootstrap-dashboard
 * Copyright 2017 Creative Tim (http://www.creative-tim.com)
 * Licensed under MIT (https://github.com/creativetimofficial/light-bootstrap-dashboard/blob/master/LICENSE.md)

 =========================================================

 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 */

var searchVisible = 0;
var transparent = true;

var transparentDemo = true;
var fixedTop = false;

var navbar_initialized = false;



$(document).ready(function(){


    $('#checkTask1').change(function() {
        if(this.checked) {
            alert("Bạn vừa thích freetuts.net");
        }

    });
    $("#checkTask").click(function () {
        var idTask =$('#idTask').val();
        if (this.checked === true){
            var checkstatus = "checked";

        } else {
            var checkstatus = "unchecked";
        }
        $.ajax({
            type: "POST",
            url: "storeCheckTask",
            data: { check : checkstatus,id :idTask},
        });
    });
    $("#addTeam").click(function () {
        var teamName=$('#teamName').val();
        var teamAddress = $('#teamAddress').val();
        var teamEmail =$('#teamEmail').val();
        var teamPhone =$('#teamPhone').val();
        var teamIdAdmin =$('#teamIdAdmin').val();

        $.post('addTeam',
            {
                teamName:teamName,
                teamAddress:teamAddress,
                teamEmail:teamEmail,
                teamPhone:teamPhone,
                teamIdAdmin:teamIdAdmin
            });
        $.notify({
            icon: 'pe-7s-gift',
            message: "Welcome to <b>Light Bootstrap Dashboard</b> - a beautiful freebie for every web developer."

        },{
            type: 'info',
            timer: 4000
        });
    });

    $("#addStaff").click(function () {
        var staffName=$('#staffName').val();
        var staffSex = $('#staffSex').val();
        var staffDateofbirth = $('#staffDateofbirth').val();
        var staffUsername =$('#staffUsername').val();
        var staffPassword = $('#staffPassword').val();
        var staffAddress = $('#staffAddress').val();
        var staffEmail = $('#staffEmail').val();
        var staffPhone = $('#staffPhone').val();
        var staffIdTeam = $('#staffIdTeam').val();
        var staffType = $('#staffType').val();
        $.post('addStaff',
            {
                staffName:staffName,
                staffSex:staffSex,
                staffDateofbirth:staffDateofbirth,
                staffUsername:staffUsername,
                staffPassword:staffPassword,
                staffAddress:staffAddress,
                staffEmail:staffEmail,
                staffPhone:staffPhone,
                staffIdTeam:staffIdTeam,
                staffType:staffType
            })

    });
    $("#btn1").click(function () {
        var name=$('#name1').val();
        var content = $('#content1').val();
        var idProject =$('#idproject1').val();
        var idstaff = $('#idstaff1').val();
        var timefrom = $('#timeFrom1').val();
        var timeend = $('#timeEnd1').val();

        $.post('bookTask',
            {name:name,content:content,idProject:idProject,idstaff:idstaff,timefrom:timefrom,timeend:timeend})

    });
    $("#btnCPW").click(function () {
        var userName =$('#userNameCPW').val();
        var oldPassword = $('#oldPassword').val();
        var newPassword =$('#newPassword').val();

        $.ajax({
            type: "POST",
            url: "changeInforAccount",
            data: {userName:userName,oldPassword:oldPassword,newPassword:newPassword},
        });
    });

    $("#btnToolTeam " ).click(function(){
        $("#divToolTeam").slideToggle("slow",function (){
        });
    });

    $("#btnEditTeam").click(function(){
        $("div").load("",function(response, status){
            if (status === "success"){
                $('#teamNameEdit').val()
                $(response).find("artist").each(function(){
                    var Name = $(this).text();
                    $('<li></li>').html(item_text).appendTo('ol');
                });

            }
        });
        /*$("#divEditTeam").slideToggle("slow",function (){
        });*/
    });




    $("#btnToolTask").click(function(){
        $("#divToolTask").slideToggle("slow",function (){

        });
    });

    $("#btnToolProject").click(function(){
        $("#divToolProject").slideToggle("slow",function (){

        });
    });
    $("#btnBookTask").click(function(){
        $("#divBookTask").slideToggle("slow",function (){
        });
    });
    data = {
        'labels': [1, 2, 3, 4,5,6,7,8,9,10,11,12],
        'series': [
            [1, 2, 8, 4,2,5,4,7,8,9,1,2]
        ]
    };
    new Chartist.Line('.ct-chart', data, {
        showPoint: true,
    });
    window_width = $(window).width();

    // check if there is an image set for the sidebar's background
    lbd.checkSidebarImage();

    // Init navigation toggle for small screens
    lbd.initRightMenu();
    //  Activate the tooltips
    $('[rel="tooltip"]').tooltip();

    //      Activate regular switches
    if ($("[data-toggle='switch']").length !== 0) {
        $("[data-toggle='switch']").bootstrapSwitch();
    }

    $('.form-control').on("focus", function() {
        $(this).parent('.input-group').addClass("input-group-focus");
    }).on("blur", function() {
        $(this).parent(".input-group").removeClass("input-group-focus");
    });

    // Fixes sub-nav not working as expected on IOS
    $('body').on('touchstart.dropdown', '.dropdown-menu', function(e) {
        e.stopPropagation();
    });





});
const cb = document.querySelector('#checkTask');

btn.onclick = () => {
    const result = cb.value;
    alert(result); // on
};

$(document).on('click','.pass_show .ptxt', function(){

    $(this).text($(this).text() === "Show" ? "Hide" : "Show");

    $(this).prev().attr('type', function(index, attr){return attr === 'password' ? 'text' : 'password'; });

});



$(document).on('click', '.navbar-toggle', function(){
    $toggle = $(this);

    if(lbd.misc.navbar_menu_visible === 1) {
        $('html').removeClass('nav-open');
        lbd.misc.navbar_menu_visible = 0;
        $('#bodyClick').remove();
        setTimeout(function(){
            $toggle.removeClass('toggled');
        }, 550);
    } else {
        setTimeout(function(){
            $toggle.addClass('toggled');
        }, 580);
        div = '<div id="bodyClick"></div>';
        $(div).appendTo('body').click(function() {
            $('html').removeClass('nav-open');
            lbd.misc.navbar_menu_visible = 0;
            setTimeout(function(){
                $toggle.removeClass('toggled');
                $('#bodyClick').remove();
            }, 550);
        });

        $('html').addClass('nav-open');
        lbd.misc.navbar_menu_visible = 1;
    }
});

$(window).on('resize', function(){
    if(navbar_initialized){
        lbd.initRightMenu();
        navbar_initialized = true;
    }
});

lbd = {
    misc:{
        navbar_menu_visible: 0
    },

    checkSidebarImage: function(){
        $sidebar = $('.sidebar');
        image_src = $sidebar.data('image');

        if(image_src !== undefined){
            sidebar_container = '<div class="sidebar-background" style="background-image: url(' + image_src + ') "/>'
            $sidebar.append(sidebar_container);
        }
    },

    initRightMenu: debounce(function(){
        if(!navbar_initialized){
            $sidebar_wrapper = $('.sidebar-wrapper');
            $navbar = $('nav').find('.navbar-collapse').html();

            mobile_menu_content = '';

            nav_content = $navbar;

            nav_content = '<ul class="nav nav-mobile-menu">' + nav_content + '</ul>';

            navbar_form = $('nav').find('.navbar-form').get(0).outerHTML;

            $sidebar_nav = $sidebar_wrapper.find(' > .nav');

            // insert the navbar form before the sidebar list
            $nav_content = $(nav_content);
            $navbar_form = $(navbar_form);
            $nav_content.insertBefore($sidebar_nav);
            $navbar_form.insertBefore($nav_content);

            $(".sidebar-wrapper .dropdown .dropdown-menu > li > a").click(function(event) {
                event.stopPropagation();

            });

            mobile_menu_initialized = true;
        } else {
            if($(window).width() > 991){
                // reset all the additions that we made for the sidebar wrapper only if the screen is bigger than 991px
                $sidebar_wrapper.find('.navbar-form').remove();
                $sidebar_wrapper.find('.nav-mobile-menu').remove();

                mobile_menu_initialized = false;
            }
        }
    },200)
}


// Returns a function, that, as long as it continues to be invoked, will not
// be triggered. The function will be called after it stops being called for
// N milliseconds. If `immediate` is passed, trigger the function on the
// leading edge, instead of the trailing.

function debounce(func, wait, immediate) {
    var timeout;
    return function() {
        var context = this, args = arguments;
        clearTimeout(timeout);
        timeout = setTimeout(function() {
            timeout = null;
            if (!immediate) func.apply(context, args);
        }, wait);
        if (immediate && !timeout) func.apply(context, args);
    };
};


function myfunction(checkbox){
    var check;
    if (checkbox.checked){
        check = "Done";

    } else {
        check = "Running"
    }
    $.ajax({
        type: "POST",
        url: "storeCheckTask",
        data: { check : check,id : checkbox.value},
        /*success: function (data, textStatus, jqXHR) {
            let list = $.parseJSON(data);
            console.log(list);
            $('#tb-list').find('p').remove();
            $.each(list, function (index, item) {
                let html =
            '<p class="text-danger pull-right">'++'</p>'
                $('#tb-list').append(html);
            });
        }*/
    },alert("You change the Task : "+checkbox.value+" is "+check));
};