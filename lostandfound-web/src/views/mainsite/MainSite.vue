<template>
    <div id="mainSite">
        <main-site-header/>
        <router-view></router-view>
    </div>
</template>

<script >
import MainSiteHeader from '../../components/mainsite/MainSiteHeader.vue';
export default {
    components: {MainSiteHeader}
}
</script>
