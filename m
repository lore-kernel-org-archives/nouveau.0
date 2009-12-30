From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: ddx/nv50: use drawable.bitsPerPixel to decide format
Date: Wed, 30 Dec 2009 18:37:29 +0100
Message-ID: <4B3B8FD9.4070605@student.tuwien.ac.at>
References: <20091228173717.GA10639@joi.lan>	<6d4bc9fc0912280955h348381der3ebae761e412ba5c@mail.gmail.com>
	<20091229170634.GA2879@joi.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------010501060201030906090507"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20091229170634.GA2879-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------010501060201030906090507
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/29/2009 06:06 PM, Marcin Slusarz wrote:
> On Mon, Dec 28, 2009 at 06:55:23PM +0100, Maarten Maathuis wrote:
>> On Mon, Dec 28, 2009 at 6:37 PM, Marcin Slusarz
>> <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>
>>> ---
>>>  src/nv50_exa.c |  155 ++++++++++++++++++++++++++++++++++++--------------------
>>>  1 files changed, 100 insertions(+), 55 deletions(-)
>>>
>>> diff --git a/src/nv50_exa.c b/src/nv50_exa.c
>>> index 1f5a4ac..54968e8 100644
>>> --- a/src/nv50_exa.c
>>> +++ b/src/nv50_exa.c
>>> @@ -79,15 +79,16 @@ NV50EXA2DSurfaceFormat(PixmapPtr ppix, uint32_t *fmt)
>>>
>>>        switch (ppix->drawable.depth) {
>>>        case 8 : *fmt = NV50_2D_SRC_FORMAT_R8_UNORM; break;
>>> -       case 15: *fmt = NV50_2D_SRC_FORMAT_X1R5G5B5_UNORM; break;
>>> -       case 16: *fmt = NV50_2D_SRC_FORMAT_R5G6B5_UNORM; break;
>>> +       case 15:
>>> +       case 16:
>>> +               *fmt = NV50_2D_SRC_FORMAT_R5G6B5_UNORM;
>>> +               break;
>>
>> depth 15 is R5G5B5, why this change?
> 
> it's the only value which passes rendercheck tests
> (rendercheck -t blend -o Src -f x1r5g5b5,r5g5b5)
> 
This is as far as I can tell because x1r5g5b5 (XRender direct format as
queries by rendercheck) has depth set to 16, and therefore uses case 16
here.
If you use the same for depth 15, the rendercheck test check succeeds,
but doing this is wrong.
If you check bitsPerPixel instead, this will be 15 for both x1r5g5b5
and r5g5b5, and all looks fine then.

See the attached patch. I'm not sure if I should have changed the xv
stuff also.
>>>        case 24: *fmt = NV50_2D_SRC_FORMAT_X8R8G8B8_UNORM; break;
>>>        case 30: *fmt = NV50_2D_SRC_FORMAT_A2B10G10R10_UNORM; break;
>>>        case 32: *fmt = NV50_2D_SRC_FORMAT_A8R8G8B8_UNORM; break;
>>>        default:
>>>                 NOUVEAU_FALLBACK("Unknown surface format for bpp=%d\n",
>>>                                  ppix->drawable.depth);
>>> -                return FALSE;
>>
>> Why did you remove this?
> 
> because it's unreachable, NOUVEAU_FALLBACK returns FALSE
>  
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau


--------------010501060201030906090507
Content-Type: text/plain;
 name="0001-nv50-check-drawable.bitsPerPixel-instead-of-depth-to.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-nv50-check-drawable.bitsPerPixel-instead-of-depth-to.pa";
 filename*1="tch"

From c1de285273004f90937e909187db654d789617b7 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Wed, 30 Dec 2009 18:28:25 +0100
Subject: [PATCH] nv50: check drawable.bitsPerPixel instead of depth to get format

---
 src/nv50_exa.c |    6 +++---
 src/nv50_xv.c  |    6 ++++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/src/nv50_exa.c b/src/nv50_exa.c
index 1f5a4ac..bddc463 100644
--- a/src/nv50_exa.c
+++ b/src/nv50_exa.c
@@ -77,7 +77,7 @@ NV50EXA2DSurfaceFormat(PixmapPtr ppix, uint32_t *fmt)
 {
 	NV50EXA_LOCALS(ppix);
 
-	switch (ppix->drawable.depth) {
+	switch (ppix->drawable.bitsPerPixel) {
 	case 8 : *fmt = NV50_2D_SRC_FORMAT_R8_UNORM; break;
 	case 15: *fmt = NV50_2D_SRC_FORMAT_X1R5G5B5_UNORM; break;
 	case 16: *fmt = NV50_2D_SRC_FORMAT_R5G6B5_UNORM; break;
@@ -86,7 +86,7 @@ NV50EXA2DSurfaceFormat(PixmapPtr ppix, uint32_t *fmt)
 	case 32: *fmt = NV50_2D_SRC_FORMAT_A8R8G8B8_UNORM; break;
 	default:
 		 NOUVEAU_FALLBACK("Unknown surface format for bpp=%d\n",
-				  ppix->drawable.depth);
+				  ppix->drawable.bitsPerPixel);
 		 return FALSE;
 	}
 
@@ -179,7 +179,7 @@ NV50EXASetROP(PixmapPtr pdpix, int alu, Pixel planemask)
 	}
 
 	BEGIN_RING(chan, eng2d, NV50_2D_PATTERN_FORMAT, 2);
-	switch (pdpix->drawable.depth) {
+	switch (pdpix->drawable.bitsPerPixel) {
 		case  8: OUT_RING  (chan, 3); break;
 		case 15: OUT_RING  (chan, 1); break;
 		case 16: OUT_RING  (chan, 0); break;
diff --git a/src/nv50_xv.c b/src/nv50_xv.c
index b0eccfd..bb9bb43 100644
--- a/src/nv50_xv.c
+++ b/src/nv50_xv.c
@@ -41,10 +41,11 @@ extern Atom xvSyncToVBlank, xvSetDefaults;
 static Bool
 nv50_xv_check_image_put(PixmapPtr ppix)
 {
-	switch (ppix->drawable.depth) {
+	switch (ppix->drawable.bitsPerPixel) {
 	case 32:
 	case 24:
 	case 16:
+	case 15:
 		break;
 	default:
 		return FALSE;
@@ -78,10 +79,11 @@ nv50_xv_state_emit(PixmapPtr ppix, int id, struct nouveau_bo *src,
 		MARK_UNDO(chan);
 		return FALSE;
 	}
-	switch (ppix->drawable.depth) {
+	switch (ppix->drawable.bitsPerPixel) {
 	case 32: OUT_RING  (chan, NV50TCL_RT_FORMAT_A8R8G8B8_UNORM); break;
 	case 24: OUT_RING  (chan, NV50TCL_RT_FORMAT_X8R8G8B8_UNORM); break;
 	case 16: OUT_RING  (chan, NV50TCL_RT_FORMAT_R5G6B5_UNORM); break;
+	case 15: OUT_RING  (chan, NV50TCL_RT_FORMAT_X1R5G5B5_UNORM); break;
 	}
 	OUT_RING  (chan, bo->tile_mode << 4);
 	OUT_RING  (chan, 0);
-- 
1.6.4.4


--------------010501060201030906090507
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------010501060201030906090507--
