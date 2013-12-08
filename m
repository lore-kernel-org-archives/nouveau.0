From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 3/3] nouveau/video: update a few more h264 picparm
	field names
Date: Sun,  8 Dec 2013 00:32:01 -0500
Message-ID: <1386480721-10167-3-git-send-email-imirkin@alum.mit.edu>
References: <1386480721-10167-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1386480721-10167-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Based on comments by Benjamin Morris <bmorris-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> in
http://lists.freedesktop.org/archives/nouveau/2013-December/015328.html

This adds setting of is_long_term, and updates a few field names we were
unclear about.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c | 33 +++++++++++-----------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c b/src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c
index ad4a586..1130d10 100644
--- a/src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c
+++ b/src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c
@@ -114,7 +114,7 @@ struct h264_picparm_vp { // 700..a00
 	uint32_t stride1, stride2; // 04 08
 	uint32_t ofs[6]; // 0c..24 in-image offset
 
-	uint32_t u24; // nfi ac8 ?
+	uint32_t tmp_stride;
 	uint32_t bucket_size; // 28 bucket size
 	uint32_t inter_ring_data_size; // 2c
 
@@ -125,10 +125,10 @@ struct h264_picparm_vp { // 700..a00
 	unsigned is_reference : 1; // 4
 	unsigned interlace : 1; // 5 field_pic_flag
 	unsigned bottom_field_flag : 1; // 6
-	unsigned f7 : 1; // 7 0x80: nfi yet
+	unsigned second_field : 1; // 7 0x80: nfi yet
 
 	signed log2_max_frame_num_minus4 : 4; // 31 0..3
-	unsigned u31_45 : 2; // 31 4..5
+	unsigned chroma_format_idc : 2; // 31 4..5
 	unsigned pic_order_cnt_type : 2; // 31 6..7
 	signed pic_init_qp_minus26 : 6; // 32 0..5
 	signed chroma_qp_index_offset : 5; // 32 6..10
@@ -148,11 +148,11 @@ struct h264_picparm_vp { // 700..a00
 		unsigned tmp_idx : 5; // 00 7..11
 		unsigned top_is_reference : 1; // 00 12
 		unsigned bottom_is_reference : 1; // 00 13
-		unsigned unk14 : 1; // 00 14 skipped?
+		unsigned is_long_term : 1; // 00 14
 		unsigned notseenyet : 1; // 00 15 pad?
 		unsigned field_pic_flag : 1; // 00 16
-		unsigned unk17 : 4; // 00 17..20
-		unsigned unk21 : 4; // 00 21..24
+		unsigned top_field_marking : 4; // 00 17..20
+		unsigned bottom_field_marking : 4; // 00 21..24
 		unsigned pad : 7; // 00 d25..31
 
 		uint32_t field_order_cnt[2]; // 04,08
@@ -333,8 +333,8 @@ nouveau_vp3_fill_picparm_h264_vp(struct nouveau_vp3_decoder *dec,
    nouveau_vp3_ycbcr_offsets(dec, &h->ofs[1], &h->ofs[3], &h->ofs[4]);
    h->ofs[5] = h->ofs[3];
    h->ofs[0] = h->ofs[2] = 0;
-   h->u24 = dec->tmp_stride >> 8;
-   assert(h->u24);
+   h->tmp_stride = dec->tmp_stride >> 8;
+   assert(h->tmp_stride);
    nouveau_vp3_inter_sizes(dec, 1, &ring, &h->bucket_size, &h->inter_ring_data_size);
 
    h->u220 = 0;
@@ -345,9 +345,9 @@ nouveau_vp3_fill_picparm_h264_vp(struct nouveau_vp3_decoder *dec,
    h->is_reference = d->is_reference;
    h->interlace = d->field_pic_flag;
    h->bottom_field_flag = d->bottom_field_flag;
-   h->f7 = 0; // TODO: figure out when set..
+   h->second_field = 0; // TODO: figure out when set..
    h->log2_max_frame_num_minus4 = d->pps->sps->log2_max_frame_num_minus4;
-   h->u31_45 = 1;
+   h->chroma_format_idc = 1;
 
    h->pic_order_cnt_type = d->pps->sps->pic_order_cnt_type;
    h->pic_init_qp_minus26 = d->pps->pic_init_qp_minus26;
@@ -377,15 +377,16 @@ nouveau_vp3_fill_picparm_h264_vp(struct nouveau_vp3_decoder *dec,
          h->refs[j].top_is_reference = d->top_is_reference[i];
          h->refs[j].bottom_is_reference = d->bottom_is_reference[i];
       }
-      h->refs[j].unk14 = 0;
+      h->refs[j].is_long_term = d->is_long_term[i];
       h->refs[j].notseenyet = 0;
       h->refs[j].field_pic_flag = dec->refs[refs[j]->valid_ref].field_pic_flag;
-      h->refs[j].unk17 = dec->refs[refs[j]->valid_ref].decoded_top &&
-                         d->top_is_reference[i];
-      h->refs[j].unk21 = dec->refs[refs[j]->valid_ref].decoded_bottom &&
-                         d->bottom_is_reference[i];
+      h->refs[j].top_field_marking =
+         dec->refs[refs[j]->valid_ref].decoded_top && d->top_is_reference[i] ?
+         1 + d->is_long_term[i] : 0;
+      h->refs[j].bottom_field_marking =
+         dec->refs[refs[j]->valid_ref].decoded_bottom && d->bottom_is_reference[i] ?
+         1 + d->is_long_term[i] : 0;
       h->refs[j].pad = 0;
-      assert(!d->is_long_term[i]);
       j++;
    }
    for (; i < 16; ++i)
-- 
1.8.3.2
