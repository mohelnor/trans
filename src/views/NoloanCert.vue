<script setup>

var d = new Date();
let day = d.getDay();
let month = d.getMonth();
let year = d.getFullYear();
const curDate = year + '/' + month + '/' + day;


</script>
<template>
    <div class="container-fluid sheet" dir="rtl">
        <img src="../assets/1.PNG" class="img-fluid w-100" />

        <h4 class="py-4">التاريخ/ {{ curDate }}</h4>

        <h2 class="py-3" style="font-family: Monotype Koufi">
            السيد / مدير شركة مطاحن سين للغلال
        </h2>

        <h4 class="fs-5 py-2" style="font-family: 'Diwani Simple Striped'">
            السلام عليكم ورحمة الله تعالي وبركاته،،،،،،
        </h4>

        <h2 class="py-3 text-center" style="font-family: Monotype Koufi">
            الموضوع / سداد قيمة (الوليد حسين بيومي 60%) من قيمة الترحيل وقيمة النولون
            المرفقة
        </h2>

        <h2 style="font-family: Monotype Koufi; text-decoration: underline">
            مدني
        </h2>

        <table class="table text-center">
            <tr class="table-dark">
                <td>الرقم</td>
                <td>الكمية</td>
                <td>السعر</td>
                <td>اجمالي المبلغ</td>
                <td>قيمة60%</td>
                <td>المبلغ المتبقي30</td>
                <td>المبلغ المطلوب</td>
            </tr>
            <tr>
                <td>1</td>
                <td>215طن</td>
                <td>500000</td>
                <td>10.750.000</td>
                <td>6.450.000</td>
                <td>4.300.000</td>
                <td>6.450.000</td>
            </tr>
        </table>
        <h6>فقط ستة مليون واربعمائة وخمسون الف جنية لاغير</h6>


        <div class="row w-100 m-0 my-5 gap-6">
            <div class="col" style="font-family: Monotype Koufi">
                <h3>إعتماد الكمية المرحلة :</h3>
                <h3>............................</h3>
            </div>
            <div class="col text-center" style="font-family: Monotype Koufi">
                <h3>التصديق المالي :</h3>
                <h3>............................</h3>
            </div>
        </div>

        <div class="m-5 p-2"></div>

        <h3 class="float-start mx-5 mb-2" style="font-family: Monotype Koufi">
            مقدم الطلب
        </h3>
    </div>
</template>	
<style scoped>
@page {
    size: A4 !important;
    orientation: portrait !important;
}
</style>