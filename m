From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/3] nouveau/video: update h264 picparm field
	names based on usage
Date: Sun,  8 Dec 2013 00:32:00 -0500
Message-ID: <1386480721-10167-2-git-send-email-imirkin@alum.mit.edu>
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

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c | 28 ++++++++++------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c b/src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c
index a0f5332..ad4a586 100644
--- a/src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c
+++ b/src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c
@@ -118,10 +118,10 @@ struct h264_picparm_vp { // 700..a00
 	uint32_t bucket_size; // 28 bucket size
 	uint32_t inter_ring_data_size; // 2c
 
-	unsigned f0 : 1; // 0 0x01: into 640 shifted by 3, 540 shifted by 5, half size something?
-	unsigned f1 : 1; // 1 0x02: into vuc ofs 56
+	unsigned mb_adaptive_frame_field_flag : 1; // 0
+	unsigned direct_8x8_inference_flag : 1; // 1 0x02: into vuc ofs 56
 	unsigned weighted_pred_flag : 1; // 2 0x04
-	unsigned f3 : 1; // 3 0x08: into vuc ofs 68
+	unsigned constrained_intra_pred_flag : 1; // 3 0x08: into vuc ofs 68
 	unsigned is_reference : 1; // 4
 	unsigned interlace : 1; // 5 field_pic_flag
 	unsigned bottom_field_flag : 1; // 6
@@ -144,15 +144,13 @@ struct h264_picparm_vp { // 700..a00
 	uint32_t field_order_cnt[2]; // 38, 3c
 
 	struct { // 40
-		// 0x00223102
-		// nfi (needs: top_is_reference, bottom_is_reference, is_long_term, maybe some other state that was saved..
 		unsigned fifo_idx : 7; // 00 0..6
 		unsigned tmp_idx : 5; // 00 7..11
-		unsigned unk12 : 1; // 00 12 not seen yet, but set, maybe top_is_reference
-		unsigned unk13 : 1; // 00 13 not seen yet, but set, maybe bottom_is_reference?
+		unsigned top_is_reference : 1; // 00 12
+		unsigned bottom_is_reference : 1; // 00 13
 		unsigned unk14 : 1; // 00 14 skipped?
 		unsigned notseenyet : 1; // 00 15 pad?
-		unsigned unk16 : 1; // 00 16
+		unsigned field_pic_flag : 1; // 00 16
 		unsigned unk17 : 4; // 00 17..20
 		unsigned unk21 : 4; // 00 21..24
 		unsigned pad : 7; // 00 d25..31
@@ -340,10 +338,10 @@ nouveau_vp3_fill_picparm_h264_vp(struct nouveau_vp3_decoder *dec,
    nouveau_vp3_inter_sizes(dec, 1, &ring, &h->bucket_size, &h->inter_ring_data_size);
 
    h->u220 = 0;
-   h->f0 = d->pps->sps->mb_adaptive_frame_field_flag;
-   h->f1 = d->pps->sps->direct_8x8_inference_flag;
+   h->mb_adaptive_frame_field_flag = d->pps->sps->mb_adaptive_frame_field_flag;
+   h->direct_8x8_inference_flag = d->pps->sps->direct_8x8_inference_flag;
    h->weighted_pred_flag = d->pps->weighted_pred_flag;
-   h->f3 = d->pps->constrained_intra_pred_flag;
+   h->constrained_intra_pred_flag = d->pps->constrained_intra_pred_flag;
    h->is_reference = d->is_reference;
    h->interlace = d->field_pic_flag;
    h->bottom_field_flag = d->bottom_field_flag;
@@ -376,12 +374,12 @@ nouveau_vp3_fill_picparm_h264_vp(struct nouveau_vp3_decoder *dec,
       h->refs[j].field_order_cnt[1] = d->field_order_cnt_list[i][1];
       h->refs[j].frame_idx = d->frame_num_list[i];
       if (!dec->refs[refs[j]->valid_ref].field_pic_flag) {
-         h->refs[j].unk12 = d->top_is_reference[i];
-         h->refs[j].unk13 = d->bottom_is_reference[i];
+         h->refs[j].top_is_reference = d->top_is_reference[i];
+         h->refs[j].bottom_is_reference = d->bottom_is_reference[i];
       }
       h->refs[j].unk14 = 0;
       h->refs[j].notseenyet = 0;
-      h->refs[j].unk16 = dec->refs[refs[j]->valid_ref].field_pic_flag;
+      h->refs[j].field_pic_flag = dec->refs[refs[j]->valid_ref].field_pic_flag;
       h->refs[j].unk17 = dec->refs[refs[j]->valid_ref].decoded_top &&
                          d->top_is_reference[i];
       h->refs[j].unk21 = dec->refs[refs[j]->valid_ref].decoded_bottom &&
@@ -395,7 +393,7 @@ nouveau_vp3_fill_picparm_h264_vp(struct nouveau_vp3_decoder *dec,
    assert(d->num_ref_frames <= dec->base.max_references);
 
    for (; i < d->num_ref_frames; ++i)
-      h->refs[j].unk16 = d->field_pic_flag;
+      h->refs[j].field_pic_flag = d->field_pic_flag;
    *(struct h264_picparm_vp *)map = *h;
 
    return 0x1113;
-- 
1.8.3.2
