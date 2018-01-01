<template>
  <ul class="list-group list-group-flush">
    <li class="list-group-item border-0" v-for="comment in comments" :key="comment.id">
      <comment-card
        :avatarUrl="comment.avatar_url"
        :commenter="comment.commenter"
        :body="comment.body"
      />
    </li>
  </ul>
</template>

<script>
import axios from "axios";
import CommentCard from "../components/CommentCard";

export default {
  props: {
      articleId: String
  },
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
      return axios.get(`/articles/${this.articleId}/comments.json`);
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
