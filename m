From: Andrew Randrianasulu <randrianasulu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: assert in nouveau_vp3_video_vp.c ?
Date: Thu, 13 Aug 2020 22:37:14 +0300
Message-ID: <202008132237.14933.randrianasulu@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

here:

diff --git a/src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c b/src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c
index 53f5db0003d..efd9cf2b004 100644
--- a/src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c
+++ b/src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c
@@ -365,7 +365,7 @@ nouveau_vp3_fill_picparm_h264_vp(struct nouveau_vp3_decoder *dec,
       refs[j] = (struct nouveau_vp3_video_buffer *)d->ref[i];
       h->refs[j].fifo_idx = j + 1;
       h->refs[j].tmp_idx = refs[j]->valid_ref;
-      assert(dec->refs[refs[j]->valid_ref].vidbuf == refs[j]);
+//      assert(dec->refs[refs[j]->valid_ref].vidbuf == refs[j]);
       h->refs[j].field_order_cnt[0] = d->field_order_cnt_list[i][0];
       h->refs[j].field_order_cnt[1] = d->field_order_cnt_list[i][1];
       h->refs[j].frame_idx = d->frame_num_list[i];

what exactly it was supposed to prevent? I removed it just for testing, and now
CinelerraGG from https://git.cinelerra-gg.org/git/?p=goodguy/cinelerra.git;a=summary
(at 
commit a6fa7638ac79011ab3188e1f4120680c641cca52 (HEAD -> master, origin/master, origin/HEAD)
Author: Good Guy <good1.2guy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Sun Aug 9 17:51:03 2020 -0600

    cut with active speed auto correction, add locale pref, mod prores dft profile to hq, change loadmode default to replace, tweak click operation defaults
)

loads h264 files in vdpau mode instead of asserting ...

But may be it will mess up things differently .....

I also run into this error:

[ 5486.914351] nouveau 0000:01:00.0: disp: ERROR 1 [PUSHBUFFER_ERR] 02 [] chid 0 mthd 0000 data 00000400
[ 5488.914339] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5494.140509] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5496.144313] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5498.220935] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5500.232161] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5502.263648] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5504.270297] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5508.419092] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5526.915696] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5529.684062] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5531.686719] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5534.222355] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5536.225058] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5538.671503] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5540.678049] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5598.327491] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5600.327512] nouveau 0000:01:00.0: DRM: base-0: timeout
[ 5620.904307] nouveau 0000:01:00.0: DRM: base-0: timeout
[ 5622.904461] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5624.904938] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5626.937565] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5637.982055] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5639.985649] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5647.682404] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5649.689416] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5653.303186] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5655.317506] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5657.646852] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6043.423417] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6045.647408] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6047.828123] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6052.566656] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6054.572658] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6057.454686] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6059.459471] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6061.478374] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6063.483032] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6065.498513] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6067.503851] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6069.538260] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6071.548000] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6077.351989] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6079.364318] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6081.420916] nouveau 0000:01:00.0: DRM: core notifier timeout

on linus's master, now everything is pausing for some seconds :}

Time to reboot and see if old kernel (5.6.12) will fare better .with new mesa build ...
