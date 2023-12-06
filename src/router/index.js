import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import Signin from "../views/Signin.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "login",
      component: Signin,
    },
    {
      path: "/home",
      name: "home",
      component: HomeView,
    },
    {
      path: "/users",
      name: "users",
      component: () => import("../views/users.vue"),
    },
    {
      path: "/noloan",
      name: "noloan",
      component: () => import("../views/Noloan.vue"),
    },
    {
      path: "/terheel",
      name: "terheel",
      component: () => import("../views/Terheel.vue"),
    },
    {
      path: "/about",
      name: "about",
      component: () => import("../views/AboutView.vue"),
    },
    {
      path: "/logout",
      name: "logout",
      component: () => import("../views/Logout.vue"),
    },
  ],
});

export default router;
