<template>
<div class="card">
  <h5 class="card-header">Leave a Comment:</h5>
  <div class="card-body">
    <form @submit.prevent="submit" accept-charset="UTF-8">
      <input name="utf8" value="✓" type="hidden">
      <div class="form-group">
        <label for="comment_commenter">Your name</label>
        <input v-model="commenter" class="form-control" name="comment[commenter]" type="text">
      </div>
      <div class="form-group">
        <label for="comment_body">Comment</label>
        <textarea v-model="body" class="form-control" rows="3" name="comment[body]"></textarea>
      </div>
      <input name="commit" value="Submit" class="btn btn-primary" data-disable-with="Submit" type="submit">
    </form>
  </div>
</div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      submitUrl: `/articles/${this.articleId}/comments`,
      commenter: null,
      body: null
    }
  },
  props: {
    articleId: String,
    csrfToken: String
  },
  methods: {
    submit() {
      axios({
        method: "post",
        url: this.submitUrl,
        data: {
          "comment": {
            "commenter": this.commenter,
            "body": this.body
          }
        },
        headers: {
          "X-CSRF-Token": this.csrfToken
        }
      }).then(() => {
        window.location.reload(true);
      })
    }
  }
};
</script>

<style scoped>

</style>
