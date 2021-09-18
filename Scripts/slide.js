// JavaScript Document
var currNum;
var maxNum;
var imgUrl;
function getNum(action) {
    currNum = parseInt($(".Pro_BigImage img").get(0).name);
    $(".Pro_Images img").each(function() {
        $(this).removeClass("current");
        this.style.filter = "alpha(opacity=30)";
        this.style.opacity = "0.3";
    })
    if (action == "prev") {
        if (currNum == 0) {
            currNum = maxNum
        };
        $(".Pro_Images img").get(currNum - 1).className = "current";
        $(".Pro_Images img").get(currNum - 1).style.filter = "alpha(opacity=100)";
        $(".Pro_Images img").get(currNum - 1).style.opacity = "1";
        $(".Pro_BigImage img").hide();
        $(".Pro_BigImage img").get(0).src = imgUrl + $(".Pro_Images img").get(currNum - 1).name.split("||")[1];
        $(".Pro_BigImage img").get(0).name = $(".Pro_Images img").get(currNum - 1).name.split("||")[0];
        $(".Pro_BigImage img").fadeIn();
        $("#page_1").html(currNum + "/" + maxNum);
    } else {
        if (currNum == maxNum - 1) {
            currNum = -1
        }
        ;
        $(".Pro_Images img").get(currNum + 1).className = "current";
        $(".Pro_Images img").get(currNum + 1).style.filter = "alpha(opacity=100)";
        $(".Pro_Images img").get(currNum + 1).style.opacity = "1";
        $(".Pro_BigImage img").hide();
        $(".Pro_BigImage img").get(0).src = imgUrl + $(".Pro_Images img").get(currNum + 1).name.split("||")[1];
        $(".Pro_BigImage img").get(0).name = $(".Pro_Images img").get(currNum + 1).name.split("||")[0];
        $(".Pro_BigImage img").fadeIn();
        $("#page_1").html(parseInt(currNum + 2) + "/" + maxNum);
    }
}
function initNum() {
    maxNum = parseInt($(".Pro_Images img").length);
    imgUrl = "kindeditor/attached/image/"; /* ��ͼͼƬ·��Ӧ�� */
    $(".Pro_Images img").get(0).className = "current";
    $(".Pro_BigImage").append("<img src='" + imgUrl + $(".Pro_Images img").get(0).name.split("||")[1] + "' name='" + $(".Pro_Images img").get(0).name.split("||")[0] + "' alt='����鿴��һ��'>");
    $(".Pro_BigImage img").click(function() {
        getNum("next");
    })
    $("#page_1").html("1/" + maxNum);
}
$(function() {
    initNum();
    $(".Pro_Images img").mouseover(
        function() {
            this.style.filter = "alpha(opacity=100)";
            this.style.opacity = "1";
        }).mouseout(
        function() {
            if (this.className != "current") {
                this.style.filter = "alpha(opacity=30)";
                this.style.opacity = "0.3";
            }
        }).click(function() {
            $(".Pro_Images img").each(function() {
                $(this).removeClass("current");
                this.style.filter = "alpha(opacity=30)";
                this.style.opacity = "0.3";
            })
            this.className = "current";
            this.style.filter = "alpha(opacity=100)";
            this.style.opacity = "1";
            $(".Pro_BigImage img").hide();
            $(".Pro_BigImage img").get(0).src = imgUrl + this.name.split("||")[1];
            $(".Pro_BigImage img").get(0).name = this.name.split("||")[0];
            $(".Pro_BigImage img").fadeIn();
            $("#page_1").html(parseInt(this.name.split("||")[0]) + 1 + "/" + maxNum);
        })
});