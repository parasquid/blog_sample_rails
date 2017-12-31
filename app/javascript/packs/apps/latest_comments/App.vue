<template>
<div class="card my-4">
  <h5 class="card-header">Latest Comments</h5>
  <div class="card-body mt-0 pt-1">
    <ul class="list-group list-group-flush">
      <li class="list-group-item" v-for="comment in comments" :key="comment.id">
        <comment-card
          :avatarUrl="comment.avatar_url"
          :commenter="comment.commenter"
          :body="comment.body"
        />
      </li>
    </ul>
  </div>
</div>
</template>

<script>
import axios from "axios";
import CommentCard from "./CommentCard";

export default {
  data() {
    return {
      comments: null
    };
  },
  components: {
    CommentCard
  },
  methods: {
    getLatestComments() {
      return axios.get("/comments/latest.json");
    }
  },
  created() {
    this.getLatestComments()
      .then(response => {
        this.comments = response.data;
      })
      .catch(response => {
        console.log(response);
      });
  }
};
</script>

<style scoped>

</style>
