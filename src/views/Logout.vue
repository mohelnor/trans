<script setup>
import { onMounted } from "vue";
import { useRouter } from 'vue-router'

const router = useRouter();

onMounted(() => {
    console.log('Logout');
    localStorage.clear()
    setTimeout(() => {
        router.replace('/')
    }, 2000)
})

</script>
<template>
    <div class="full-display flex align-items-center justify-content-center h-screen">
        <ProgressSpinner />
    </div>
</template>	
<style scoped></style>