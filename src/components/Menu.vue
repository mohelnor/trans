<template>
    <nav class="navbar navbar-expand-md navbar-dark bg-success shadow" style="height: 70px;">
        <!-- Container wrapper -->
        <div class="container-fluid">
            <!-- Toggle button -->
            <button data-mdb-collapse-init class="navbar-toggler" type="button" data-mdb-target="#navbarCenteredExample"
                aria-controls="navbarCenteredExample" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>

            <!-- Collapsible wrapper -->
            <div class="collapse navbar-collapse justify-content-center" id="navbarCenteredExample">
                <!-- Left links -->
                <ul class="navbar-nav mb-2 mb-lg-0">

                    <li class="nav-item" v-for="item in items" key="item">
                        <RouterLink :to="item.router" v-if="item.label != 'خروج'" class="nav-link active">{{ item.label }}</RouterLink>
                        <RouterLink :to="item.router" replace v-if="item.label == 'خروج'" class="nav-link active">{{ item.label }}</RouterLink>
                    </li>

                </ul>
                <!-- Left links -->
            </div>
            <!-- Collapsible wrapper -->
        </div>
        <!-- Container wrapper -->
    </nav>
</template>

<script setup>
import { ref } from "vue";
import { RouterLink, useRouter } from 'vue-router'

const router = useRouter();

const items = ref([
    {
        label: 'الرئيسية',
        router: '/home'
    },
    {
        label: 'المستخدمين',
        router: '/users'
    },
    {
        label: 'النولون',
        router: '/noloan'
    },
    {
        label: 'الترحيل',
        router: '/terheel'
    },
    {
        label: 'عن البرنامج',
        router: '/about'
    },
    {
        label: 'خروج',
        router: '/logout'
    }
]);
</script>
<style>
nav{
    font-family: cairo;
}
</style>