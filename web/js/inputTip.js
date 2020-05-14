; (function ($) {
    $.fn.errortip = function (options) {
        var defaults = {
            text: '输入有误，请重新输入',
            show: false,
            bg: '#fff',
            border: '#ddd',
            height: 30,
            width: 150,
            font: 13
        };
        var options = $.extend(defaults, options);
        var thisParent = $(this).parent()
        if (options.show) {
            if (thisParent.find(".judgeShow").size() == 0) {
                thisParent.css("position", "relative");
                thisParent.append('<div class="judgeShow" style=\"display:block;position: absolute;height:'+options.height+'px;line-height:'+options.height+'px;width:'+options.width+'px;left: 0;top: -7px;transform: translate(-2%, -100%);z-index: 0;border-radius: 4px;font-size: '+options.font+'px;color: #333;border: 1px solid '+options.border+';\"><div style=\"position: absolute; width: 7px;height: 7px;bottom:0;left:15px;background-color: '+options.bg+';z-index: -1;border: 1px solid '+options.border+';transform:translate(-50%, 50%) rotate(45deg);\"></div><div style=\"position: relative;color: #000;background-color: '+options.bg+';border-radius: 3px;\"><div style=\"text-align: center;\">'+options.text+'</div></div></div>');
            }else{
                thisParent.find(".judgeShow").css("display", "block");
            }
        }else {
            thisParent.find(".judgeShow").css("display", "none");
        }
    }
})(jQuery);