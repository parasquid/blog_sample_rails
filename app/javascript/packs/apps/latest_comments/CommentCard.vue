<template functional>
<div class="media">
  <img :src="props.avatarUrl" class="d-flex mr-3 rounded-circle" height="50" width="50">
  <div class="media-body">
    <h5>{{ props.commenter }}</h5>
    {{ props.body }}
  </div>
</div>
</template>
