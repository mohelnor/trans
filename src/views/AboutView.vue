<script setup>
import MyMenu from "../components/Menu.vue";

import { useRouter } from 'vue-router'

const router = useRouter()

function back() {
    router.back()
}
</script>

<template>
    <main class="card shadow-2 m-4 about-section p-5">
        <div class="about-section">
            <h1 class="p-3">عن البرنامج</h1>
            <p>برنامج متابعة الترحيل و النولون.</p>
            <p>مجموعة المنارة للترحيلات.</p>
            <button class="btn btn-dark btn-floating shadow-1" @click="back"><i class="pi pi-arrow-left mt-2"></i></button>
        </div>
    </main>
</template>
<style>
body {
    background-color: rgb(230, 230, 230);
}

.about-section, .btn-dark {
    font-family: cairo;
    text-align: center;
    background-color: #646872;
    color: white;
}
</style>