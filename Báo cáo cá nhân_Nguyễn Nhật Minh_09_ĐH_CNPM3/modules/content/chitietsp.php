    <div class="thongbaosp"><h4>THÔNG TIN SẢN PHẨM<h4></div>
<div class="col-xs-12 col-sm-8 col-md-10 ">
        <?php 
                $id = $_GET['id'];
                $run = mysqli_query($conn,"SELECT * FROM sanpham where idSP = '$id'");
                while ($row=mysqli_fetch_array($run)) {
                    echo '
                        
                        <div class="col-xs-12 col-sm-6 col-md-7 " id="hinhsp">
                            <img src="admin/update/'.$row['hinhanh'].'">
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-5 " id="chitiets">
                            <div class="gia_full">
                                <label class="ten">'.$row['tensp'].'</label>
                                    <label class="giasp">'.number_format($row['gia'],0,',','.').' VNĐ
                                        <b class="giacu" style="text-decoration: line-through;"></b>
                                    </label>
                            </div>
                            <div class="gia_full">
                                <p class="baohanh">Mô tả:</p>
                                <p>'.$row['mota'].'</p>
                            </div>
                            <form method="get" action="">
                            <label class="baohanh">Số lượng</label>
                            <div class="qty mt-5">
                                <input type="number" id="sl'.$row['idSP'].'" class="count"  name="qty" value="1" onchange="kiemtraslmua('.$row['idSP'].')">
                            </div>
                            <button type="button"" class="them"  id="ct" onclick="updateitem('.$row['idSP'].')">THÊM VÀO GIỎ HÀNG</button>
                            </form>
                            <label>Hotline đặt hàng 0389521580 (Từ 09h00 - 18h00, tất cả các ngày)</label>
                        </div>
                    ';
                }
         ?>
</div>
<div class="col-md-2 ">
            <div class="panel panel-default">
                <div class="panel-heading" style="background: #c4ddc8;">
                    <h2 class="panel-title">
                        CHÍNH SÁCH BÁN HÀNG</h2>
                </div>
                <ul class="list-group">
                    <a href="#" class="list-group-item"> Giao hàng toàn quốc</a>
                    <a href="#" class="list-group-item"> Chính sách & Quy định chung</a>
                    <a href="#" class="list-group-item"> Quy định và hình thức thanh toán</a>
                    <a href="#" class="list-group-item"> Chính sách vận chuyển và giao nhận</a>
                    <a href="#" class="list-group-item"> Chính sách bảo mật thông tin cá nhân</a>
                    <a href="#" class="list-group-item"> Chính sách bảo hành</a> 
                    <a href="#" class="list-group-item"> Chính sách đổi/ trả hàng và hoàn tiền</a>    
                </ul>
            </div>
        </div>              
<div class="col-xs-12 col-sm-8 col-md-12">
            <div class="col-xs-12 col-sm-12 col-md-12 " id="thongtinsp">
                    <div class="col-xs-12 col-sm-6 col-md-8">                     
</div>