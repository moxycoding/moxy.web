<template>
  <div>
    <div class="place">
      <nuxt-link
        :to="{path:'/tags/'+item.tagName}"
        v-for="item in $store.state.tagsList"
        :class="{'active':tagName==item}"
        :key="item"
        v-html="item"
      ></nuxt-link>
    </div>
    <v-art-list
      class="blogs"
      :list="list"
    >
      <div class="pagelist">
        <nuxt-link
          :to="{path:'/tags/'+tagName,query:{page:nextPageIndex}}"
          v-if="nextPageIndex>0"
        >点击加载更多</nuxt-link>
        <a
          href="javascript:void(0)"
          v-else
        >已全部加载完毕</a>
      </div>
    </v-art-list>
    <aside>
      <v-category></v-category>
      <v-friend></v-friend>
    </aside>
  </div>
</template>

<script>
import VArtList from '@/components/partial/ArtList'
import VCategory from '@/components/partial/Category'
import VFriend from '@/components/partial/Friend'
export default {
  components: {
    VCategory,
    VFriend,
    VArtList
  },
  data() {
    return {
      tagName: '',
      list: [],
      nextPageIndex: 0
    }
  },
  watchQuery: ['id', 'page'],
  async asyncData(context) {
    var tagName = context.params.id
    var pageIndex = Math.max(context.query.page || 0, 0)
    var pageSize = 10
    var artRes = await context.app.$api.cms.getTagsArtList({
      tagName,
      pageIndex,
      pageSize
    })
    return {
      tagName: tagName,
      list: artRes.data.items,
      hasNext: artRes.data.hasNextPage,
      nextPageIndex: artRes.data.hasNextPage ? pageIndex + 1 : 0
    }
  },
  methods: {}
}
</script>
