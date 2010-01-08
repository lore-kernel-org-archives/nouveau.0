From: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: low memory
Date: Fri, 8 Jan 2010 15:55:23 +0100
Message-ID: <91752841001080655g1ceb4bb4v8df9ccb467c53084@mail.gmail.com>
References: <91752840912111111q222602f8g87b1727c24bd06ba@mail.gmail.com>
	<6d4bc9fc0912111604oca0be3dm7f001bb05e85084@mail.gmail.com>
	<6d4bc9fc0912121350x54cde8b5yf72552c2d89ca2ab@mail.gmail.com>
	<91752840912131235v7e2a289ap32e92ef95574ce8b@mail.gmail.com>
	<91752841001071551i22069238of23551dc4b67cf39@mail.gmail.com>
	<1262909650.7007.1.camel@araqiel>
	<91752841001071650t4a9ecb3cm5c922105a668771a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001485f44e9a91d1ab047ca86073
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <91752841001071650t4a9ecb3cm5c922105a668771a-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--001485f44e9a91d1ab047ca86073
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 8, 2010 at 1:50 AM, Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Strange, I am 99% sure I did update libdrm , and before updating ddx.
> I will double-check tomorrow.
>
> And I indeed found this commit :
> http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=bb1947831d9a4e080b8d1e9dba086af6527ef479
> So I assume the libdrm one is this one on the same day :
> http://cgit.freedesktop.org/mesa/drm/commit/?id=f1660c249198b5cc14ebbb75107da7bcb6972033
>
> So by playing with these two commits, I should also be able to provide
> more information. Thanks !
>

So it more looks like a drm/ttm problem.
With a recent drm/ttm (after 98ba9c1322), firefox just displays a
black box instead of the picture, the system lags a bit, and I get the
following in dmesg :
[   75.800986] [drm] nouveau 0000:03:00.0: validate: -12
[   75.801365] [drm] nouveau 0000:03:00.0: validate: -12
[   80.772360] reserve_ram_pages_type failed 0xc403000-0xc404000,
track 0x8, req 0x10

If I go before the drm/ttm merge, it still works fine. commit b5d1f52b
or earlier.

If I try to go somewhere between b5d1f52b and 98ba9c1322, I get the
attached bug. But that might be because some important bugfix has been
made at the end of that range, like "drm/nouveau: Fix "general
protection fault" in the flipd/flips eviction path."

Here is the commit range I mentioned :

* commit 98ba9c1322ed334b223117654cb671ea320919d5
| Author: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
| Date:   Wed Dec 16 19:03:28 2009 +0100
|
|     drm/nouveau: Drop redundant placement initialization.
|
|     Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
|
* commit 4ee7ee3f1e824561a779c068773ed21bd7df5413
| Author: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
| Date:   Wed Dec 16 19:05:38 2009 +0100
|
|     drm/nouveau: No need to force evict=true when swapping evicted
BOs back in.
|
|     Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
|
* commit 81c1019857b70efbba831f4a02b377066b836cbc
| Author: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
| Date:   Wed Dec 16 19:05:00 2009 +0100
|
|     drm/nouveau: Fix "general protection fault" in the flipd/flips
eviction path.
|
|     Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
|
* commit f4e1a1bd530b6e4d2bfd1fbd7daddd5020359f15
| Author: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
| Date:   Wed Dec 16 18:42:35 2009 +0100
|
|     Revert "drm/nouveau: unpin cursor and lut bo when suspending"
|
|     This reverts commit a330aea77289d8d4465ea0d072fb868f9c782577.
|
|     - For some odd reason the cursor gets stuck with the last image,
don't see why.
|     - The clut is already regenerated after resume it seems.
|
|     Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
|
* commit dd6e87021a45c56acddbf229221543239f12a924
| Author: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
| Date:   Wed Dec 16 12:27:11 2009 +0100
|
|     drm/i2c/ch7006: Drop build time dependency to nouveau.
|
|     This partially reverts e4b41066, as this driver is intended to be
|     useful with any KMS driver for suitable hardware. The missing build
|     dependency that commit workarounded was DRM_KMS_HELPER.
|
|     Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
|
* commit 64aec72df1fa782ec3b060ccbdfa3fc9594f6119
| Author: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
| Date:   Fri Dec 11 16:51:09 2009 +0100
|
|     drm/nouveau: Make the MM aware of pre-G80 tiling.
|
|     Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
|
* commit a49b387671a26e875d07befdc1d65087c557f5a8
| Author: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
| Date:   Wed Dec 16 12:12:27 2009 +0100
|
|     drm/nouveau: Pre-G80 tiling support.
|
|     Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
|
* commit dddd2e625429cfd3c692928bbba3b74aa2d528b2
| Author: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
| Date:   Sun Dec 13 20:07:42 2009 +0100
|
|     drm/nouveau: Add cache_flush/pull fifo engine functions.
|
|     Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
|
*   commit 69c27c09270b6898a06948d61b4b310e80990798
|\  Merge: b5d1f52 5012f50
| | Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
| | Date:   Wed Dec 16 16:46:17 2009 +1000
| |
| |     Merge branch 'drm-core-next' of
git://git.kernel.org/pub/scm/linux/kernel/git/airlied/drm-2.6 into
nouveau
| |
| * commit 5012f5063f41ca01240e5983c3b2cceb9aafc7a4
| | Author: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
| | Date:   Thu Dec 10 18:07:26 2009 +0100
| |
| |     drm/ttm: Fix memory type manager debug information printing
| |
| |     System memory type doesn't have a drm_mm manager associated to
| |     it. This patch avoid trying to call drm_mm_debug on unitialized
| |     drm_mm when printing debug info on the system memory manager.
| |
| |     Signed-off-by: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
| |     Signed-off-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
| |
| * commit eb6d2c39dbe46ea1c4f3da4eac5728c73f109ea1
| | Author: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
| | Date:   Thu Dec 10 16:15:52 2009 +0100
| |
| |     drm/ttm: Fix printk format & compute bo->mem.size at bo initialization
| |
| |     Signed-off-by: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
| |     Signed-off-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
| |
| * commit 9c51ba1db37cab780f38b2210913959f22d7b830
| | Author: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
| | Date:   Wed Dec 2 18:33:46 2009 +0100
| |
| |     drm/ttm: Fix potential ttm_mem_evict_first races.
| |
| |     1) The function was previously called with a potentially empty
| |     LRU list which would have lead to an OOPS or servere corruption.
| |     2) In rare cases, after reservation has succeeded, another process may
| |     already have evicted it or even pinned it. We must revalidate the
| |     buffer status after releasing the lru lock.
| |
| |     Signed-off-by: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
| |     Signed-off-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
| |
| * commit aaa207369436d04bb85382ddbb688a5b9461fd21
| | Author: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
| | Date:   Wed Dec 2 18:33:45 2009 +0100
| |
| |     drm/ttm: Delayed delete fixes.
| |
| |     1) Remove from lru before reserving so we avoid competing with
| |     evicting processes.
| |     2) Avoid calling kref_put() on bo::list_kref while spinlocked.
| |     3) Additional refcounting bug-checking.
| |
| |     Signed-off-by: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
| |     Signed-off-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
| |
| * commit b663752627e7c6b4bc414684d71c6adce5719fce
| | Author: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
| | Date:   Mon Dec 14 14:51:35 2009 +1000
| |
| |     drm/ttm: fix two bugs in new placement routines.
| |
| |     a) the loops were going to <= not <, leading to illegal memory access
| |     b) the busy placement checks were using the placement arrays not the
| |        busy placement ones.
| |
| |     Acked-by: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
| |     Signed-off-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
| |
| * commit b8ff7357da45e025c446fe0479612215fe56a249
| | Author: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
| | Date:   Tue Dec 15 08:07:12 2009 +1000
| |
| |     drm/ttm: fix incorrect logic in ttm_bo_io path
| |
| |     This path isn't used by radeon yet, but future drivers will want it,
| |     so fix it right.
| |
| |     Reported-by: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
| |     Signed-off-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
| |
* | commit b5d1f52b73059bd34355e35654abc91015e03bb5
| | Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
| | Date:   Wed Dec 16 16:22:42 2009 +1000
| |
| |     drm/nouveau: fix bug causing pinned buffers to lose their NO_EVICT flag
| |
| |     Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
| |

--001485f44e9a91d1ab047ca86073
Content-Type: application/octet-stream; name=bug
Content-Disposition: attachment; filename=bug
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g473b5px0

WyAxMDUyLjc0NzgxMF0gQlVHOiB1bmFibGUgdG8gaGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIg
ZGVyZWZlcmVuY2UgYXQgKG51bGwpClsgMTA1Mi43NDc4MjJdIElQOiBbPGUwOGQyNGM0Pl0gdHRt
X2JvX21lbV9zcGFjZSsweDFlNS8weDM3YiBbdHRtXQpbIDEwNTIuNzQ3ODQzXSAqcGRlID0gMDAw
MDAwMDAgClsgMTA1Mi43NDc4NDhdIE9vcHM6IDAwMDAgWyMxXSAKWyAxMDUyLjc0Nzg1Ml0gbGFz
dCBzeXNmcyBmaWxlOiAvc3lzL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjAyLjIvdXNiMS8x
LTA6MS4wL3VldmVudApbIDEwNTIuNzQ3ODU4XSBNb2R1bGVzIGxpbmtlZCBpbjogbm91dmVhdSB0
dG0gc25kX2VtdTEwazEgc25kX3Jhd21pZGkgc25kX3V0aWxfbWVtIGVtdTEwazFfZ3AgYXRoNWsg
ZmlyZXdpcmVfb2hjaSBzbmRfaHdkZXAgZHJtX2ttc19oZWxwZXIgYXRoIGdhbWVwb3J0IHNrZ2Ug
c25kX2ludGVsOHgwIGZpcmV3aXJlX2NvcmUgY3JjX2l0dV90IGRybSBzbmRfYWM5N19jb2RlYyBh
Yzk3X2J1cyBudmlkaWFfYWdwIGZvcmNlZGV0aCBpMmNfbmZvcmNlMiBhZ3BnYXJ0IGkyY19hbGdv
X2JpdCBbbGFzdCB1bmxvYWRlZDogdHRtXQpbIDEwNTIuNzQ3ODg4XSAKWyAxMDUyLjc0Nzg5NF0g
UGlkOiA5ODcxLCBjb21tOiBYb3JnIFRhaW50ZWQ6IEcgIFIgICAgICAgICgyLjYuMzIgIzkpIEE3
TjhYLUUKWyAxMDUyLjc0Nzg5OV0gRUlQOiAwMDYwOls8ZTA4ZDI0YzQ+XSBFRkxBR1M6IDAwMjEz
MjQ2IENQVTogMApbIDEwNTIuNzQ3OTA5XSBFSVAgaXMgYXQgdHRtX2JvX21lbV9zcGFjZSsweDFl
NS8weDM3YiBbdHRtXQpbIDEwNTIuNzQ3OTEzXSBFQVg6IDAwMDAwMDAwIEVCWDogZGZiOGJiZjQg
RUNYOiAwMDAwMDAwMCBFRFg6IDAwMDAwMDAwClsgMTA1Mi43NDc5MThdIEVTSTogY2JkNDBjMDAg
RURJOiBkZmI4YmMwYyBFQlA6IGRmYjhiYmQwIEVTUDogZGZiOGJiODAKWyAxMDUyLjc0NzkyMl0g
IERTOiAwMDdiIEVTOiAwMDdiIEZTOiAwMDAwIEdTOiAwMDMzIFNTOiAwMDY4ClsgMTA1Mi43NDc5
MjhdIFByb2Nlc3MgWG9yZyAocGlkOiA5ODcxLCB0aT1kZmI4YTAwMCB0YXNrPWRlODFhZDAwIHRh
c2sudGk9ZGZiOGEwMDApClsgMTA1Mi43NDc5MzFdIFN0YWNrOgpbIDEwNTIuNzQ3OTMzXSAgMDAw
MDAwMDAgMDAwMDAwMDAgMDAyMDMwMDAgMDAwMDAwMDAgMDAwMjAwMDAgMDAwMDAwMDAgZGZiOGJi
ZTggMDAwMDAwMDgKWyAxMDUyLjc0Nzk0Ml0gPDA+IDAwMDAwMDE4IGRmYjhiYmY0IGRjZDgwMDY4
IDAwMDAwMDAxIDAwMDAwMDAxIDAwMDAwMDAwIDAwMDcwMDAyIGRmYjhiYmQ4ClsgMTA1Mi43NDc5
NTFdIDwwPiAwMDAwMDAwMCBjYmQ0MGMwMCBkZmI4YmMwYyBkZmI4YmMyNCBkZmI4YmMzNCBlMGFh
ZDYzMCAwMDAwMDAwMCAwMDAwMDAwMApbIDEwNTIuNzQ3OTYxXSBDYWxsIFRyYWNlOgpbIDEwNTIu
NzQ4MDAwXSAgWzxlMGFhZDYzMD5dID8gbm91dmVhdV9ib19tb3ZlKzB4MTRkLzB4MjliIFtub3V2
ZWF1XQpbIDEwNTIuNzQ4MDIzXSAgWzxlMGFhZDRlMz5dID8gbm91dmVhdV9ib19tb3ZlKzB4MC8w
eDI5YiBbbm91dmVhdV0KWyAxMDUyLjc0ODAyM10gIFs8ZTA4ZDFiNzg+XSA/IHR0bV9ib19oYW5k
bGVfbW92ZV9tZW0rMHgxNzkvMHgyMWIgW3R0bV0KWyAxMDUyLjc0ODAyM10gIFs8ZTA4ZDI5NTQ+
XSA/IHR0bV9tZW1fZXZpY3RfZmlyc3QrMHgyZmEvMHgzNTYgW3R0bV0KWyAxMDUyLjc0ODAyM10g
IFs8YzExNmE0MjI+XSA/IGF2Y19oYXNfcGVybV9ub2F1ZGl0KzB4MWMyLzB4MmNhClsgMTA1Mi43
NDgwMjNdICBbPGUwOGQyNWYxPl0gPyB0dG1fYm9fbWVtX3NwYWNlKzB4MzEyLzB4MzdiIFt0dG1d
ClsgMTA1Mi43NDgwMjNdICBbPGUwOGQyZDA0Pl0gPyB0dG1fYm9fbW92ZV9idWZmZXIrMHg1Yi8w
eDlmIFt0dG1dClsgMTA1Mi43NDgwMjNdICBbPGUwOGZjYzA5Pl0gPyBkcm1fbW1fa21hbGxvYysw
eGIvMHg4OSBbZHJtXQpbIDEwNTIuNzQ4MDIzXSAgWzxlMDhkMmRiZj5dID8gdHRtX2JvX3ZhbGlk
YXRlKzB4NzcvMHhiOCBbdHRtXQpbIDEwNTIuNzQ4MDIzXSAgWzxlMDhkMzAzNT5dID8gdHRtX2Jv
X2luaXQrMHgyMzUvMHgyNjAgW3R0bV0KWyAxMDUyLjc0ODAyM10gIFs8ZTBhYWRjM2Y+XSA/IG5v
dXZlYXVfYm9fbmV3KzB4MWY0LzB4MjM1IFtub3V2ZWF1XQpbIDEwNTIuNzQ4MDIzXSAgWzxlMGFh
ZDllZD5dID8gbm91dmVhdV9ib19kZWxfdHRtKzB4MC8weDVlIFtub3V2ZWF1XQpbIDEwNTIuNzQ4
MDIzXSAgWzxlMGFhZWE2NT5dID8gbm91dmVhdV9nZW1fbmV3KzB4MmUvMHg4NSBbbm91dmVhdV0K
WyAxMDUyLjc0ODAyM10gIFs8ZTBhYWVjMTk+XSA/IG5vdXZlYXVfZ2VtX2lvY3RsX25ldysweDE1
ZC8weDIzYSBbbm91dmVhdV0KWyAxMDUyLjc0ODAyM10gIFs8ZTA4ZjY3MDQ+XSA/IGRybV9pb2N0
bCsweDFlZi8weDI3ZiBbZHJtXQpbIDEwNTIuNzQ4MDIzXSAgWzxlMGFhZWFiYz5dID8gbm91dmVh
dV9nZW1faW9jdGxfbmV3KzB4MC8weDIzYSBbbm91dmVhdV0KWyAxMDUyLjc0ODAyM10gIFs8YzEw
OTJkMmI+XSA/IGRvX3N5bmNfcmVhZCsweGE4LzB4ZTMKWyAxMDUyLjc0ODAyM10gIFs8YzExNmI4
ODE+XSA/IGZpbGVfaGFzX3Blcm0rMHg3OS8weDgyClsgMTA1Mi43NDgwMjNdICBbPGUwOGY2NTE1
Pl0gPyBkcm1faW9jdGwrMHgwLzB4MjdmIFtkcm1dClsgMTA1Mi43NDgwMjNdICBbPGMxMDljNzZh
Pl0gPyB2ZnNfaW9jdGwrMHgzYS8weDQ5ClsgMTA1Mi43NDgwMjNdICBbPGMxMDlkMDAzPl0gPyBk
b192ZnNfaW9jdGwrMHg0NTUvMHg0OTMKWyAxMDUyLjc0ODAyM10gIFs8YzExNmJhZWY+XSA/IHNl
bGludXhfZmlsZV9pb2N0bCsweDNkLzB4NDAKWyAxMDUyLjc0ODAyM10gIFs8YzEwOWQwODI+XSA/
IHN5c19pb2N0bCsweDQxLzB4NjEKWyAxMDUyLjc0ODAyM10gIFs8YzEwMDI5NDQ+XSA/IHN5c2Vu
dGVyX2RvX2NhbGwrMHgxMi8weDIyClsgMTA1Mi43NDgwMjNdIENvZGU6IDBmIGI2IDU1IGI4IDg5
IGRmIDBmIGI2IDRkIGJjIGM3IDQ1IGU0IDAwIDAwIDAwIDAwIGM2IDQ1IGM0IDAwIDg5IDU1IGI0
IDg5IDRkIGIwIGU5IDczIDAxIDAwIDAwIDhiIDVkIGQ0IDMxIGM5IDhiIDU1IGU0IDhiIDQzIDE0
IDw4Yj4gMDQgOTAgYzcgNDUgZTggMDAgMDAgMDAgMDAgODkgNDUgZTAgYjggMDEgMDAgMDAgMDAg
ODkgYzIgZDMgClsgMTA1Mi43NDgwMjNdIEVJUDogWzxlMDhkMjRjND5dIHR0bV9ib19tZW1fc3Bh
Y2UrMHgxZTUvMHgzN2IgW3R0bV0gU1M6RVNQIDAwNjg6ZGZiOGJiODAKWyAxMDUyLjc0ODAyM10g
Q1IyOiAwMDAwMDAwMDAwMDAwMDAwClsgMTA1Mi43NDg0OTFdIC0tLVsgZW5kIHRyYWNlIDBiMGNl
MzE5MzU2YzA2NTIgXS0tLQoK
--001485f44e9a91d1ab047ca86073
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--001485f44e9a91d1ab047ca86073--
