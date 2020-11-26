<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>Document</title>
</head>
<script>
    var $setRows = $('#setRows');

    $setRows.submit(function (e) {
        e.preventDefault();
        var rowPerPage = $('[name="rowPerPage"]').val() * 1;// 1 을  곱하여 문자열을 숫자형로 변환
    
    //		console.log(typeof rowPerPage);
    
        var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
        if (!rowPerPage) {
            alert(zeroWarning);
            return;
        }
        $('#nav').remove();
        var $products = $('#products');
    
        $products.after('<div id="nav">');
    
    
        var $tr = $($products).find('tbody tr');
        var rowTotals = $tr.length;
    //	console.log(rowTotals);
    
        var pageTotal = Math.ceil(rowTotals/ rowPerPage);
        var i = 0;
    
        for (; i < pageTotal; i++) {
            $('<a href="#"></a>')
                    .attr('rel', i)
                    .html(i + 1)
                    .appendTo('#nav');
        }
    
        $tr.addClass('off-screen')
                .slice(0, rowPerPage)
                .removeClass('off-screen');
    
        var $pagingLink = $('#nav a');
        $pagingLink.on('click', function (evt) {
            evt.preventDefault();
            var $this = $(this);
            if ($this.hasClass('active')) {
                return;
            }
            $pagingLink.removeClass('active');
            $this.addClass('active');
    
            // 0 => 0(0*4), 4(0*4+4)
            // 1 => 4(1*4), 8(1*4+4)
            // 2 => 8(2*4), 12(2*4+4)
            // 시작 행 = 페이지 번호 * 페이지당 행수
            // 끝 행 = 시작 행 + 페이지당 행수
    
            var currPage = $this.attr('rel');
            var startItem = currPage * rowPerPage;
            var endItem = startItem + rowPerPage;
    
            $tr.css('opacity', '0.0')
                    .addClass('off-screen')
                    .slice(startItem, endItem)
                    .removeClass('off-screen')
                    .animate({opacity: 1}, 300);
    
        });
    
        $pagingLink.filter(':first').addClass('active');
    
    });
    
    
    $setRows.submit();
    </script>
<body>
    <table id="products" border="1">
        <caption>product list
            <form action="" id="setRows">
                <p>
                    showing
                    <input type="text" name="rowPerPage" value="3">
                    item per page
                </p>
            </form>
    
        </caption>
    
        <thead>
            <tr>
                <th>No</th>
                <th>Category</th>
                <th>Product</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>Clothing</td>
                <td>Jacket</td>
            </tr>
            <tr>
                <td>2</td>
                <td>life</td>
                <td>dish</td>
            </tr>
            <tr>
                <td>3</td>
                <td>Clothing</td>
                <td>shocks</td>
            </tr>
            <tr>
                <td>4</td>
                <td>Clothing</td>
                <td>sports</td>
            </tr>
            <tr>
                <td>5</td>
                <td>shoes</td>
                <td>nike</td>
            </tr>
            <tr>
                <td>6</td>
                <td>shoes</td>
                <td>addidas</td>
            </tr>
            <tr>
                <td>7</td>
                <td>Bags</td>
                <td>backpack</td>
            </tr>
            <tr>
                <td>8</td>
                <td>Clothing</td>
                <td>Jacket</td>
            </tr>
            <tr>
                <td>9</td>
                <td>shoes</td>
                <td>bonie</td>
            </tr>
            <tr>
                <td>10</td>
                <td>Clothing</td>
                <td>Jacket</td>
            </tr>
        </tbody>
    
    </table>
</body>
</html>
