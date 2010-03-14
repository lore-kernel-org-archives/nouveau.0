From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: Re: RFC: gallium/nv50: get rid of the screen_init stateobj
Date: Sun, 14 Mar 2010 14:53:18 +0100
Message-ID: <4B9CEA4E.3000508@student.tuwien.ac.at>
References: <4B9CBB24.60202@student.tuwien.ac.at>
	<6d4bc9fc1003140503v724e572t342136e72c8cc164@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------030502090800040303050904"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc1003140503v724e572t342136e72c8cc164-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------030502090800040303050904
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 14.03.2010 13:03, Maarten Maathuis wrote:
> On Sun, Mar 14, 2010 at 11:32 AM, Christoph Bumiller
> <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org> wrote:
>   
>> Hi.
>> There's not much to say here, just replacing the screen_init
>> stateobj with direct pushbuffer emission.
>>
>> We don't need to store all the usless state from init, and the
>> constant buffer relocations which currently don't work if the
>> addresses change (because the method CB_DEF_SET isn't
>> among them (not an address)) become effective.
>>
>> Thoughts, ack / nack ?
>> Thanks,
>>  Christoph
>>
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>
>>
>>     
> Perhaps add a BEGIN_RING_RELOC to libdrm? To make it more obvious.
>
> Maarten.
>   
Like the following (attached) ?:

--------------030502090800040303050904
Content-Type: text/plain;
 name="0001-nv50-add-BGN_RELOC.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-nv50-add-BGN_RELOC.patch"

From 6c5fc819f456b217cb677667e90c1de96ed2ebbb Mon Sep 17 00:00:00 2001
From: root <root@P801.(none)>
Date: Sun, 14 Mar 2010 14:36:23 +0100
Subject: [PATCH] nv50: add BGN_RELOC

---
 nouveau/nouveau_pushbuf.h |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/nouveau/nouveau_pushbuf.h b/nouveau/nouveau_pushbuf.h
index 52d13a0..818b713 100644
--- a/nouveau/nouveau_pushbuf.h
+++ b/nouveau/nouveau_pushbuf.h
@@ -197,4 +197,13 @@ OUT_RELOCh(struct nouveau_channel *chan, struct nouveau_bo *bo,
 	return OUT_RELOC(chan, bo, delta, flags | NOUVEAU_BO_HIGH, 0, 0);
 }
 
+static __inline__ int
+BGN_RELOC(struct nouveau_channel *chan, struct nouveau_bo *bo,
+	   struct nouveau_grobj *gr, unsigned mthd, unsigned size,
+	   unsigned flags)
+{
+	OUT_RELOC(chan, bo, (size << 18) | (gr->subc << 13) | mthd,
+		  flags, 0, 0);
+}
+
 #endif
-- 
1.6.4.4


--------------030502090800040303050904
Content-Type: text/plain;
 name="0001-nv50-use-BGN_RELOC.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-nv50-use-BGN_RELOC.patch"

From bcc4ed3ea1af1bebb2713035432f3477ac89f7ad Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sun, 14 Mar 2010 14:51:03 +0100
Subject: [PATCH] nv50: use BGN_RELOC

---
 src/gallium/drivers/nv50/nv50_screen.c |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index 2b0c9fd..effe20b 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -212,37 +212,37 @@ nv50_screen_relocs(struct nv50_screen *screen)
 	unsigned i;
 	const unsigned rl = NOUVEAU_BO_VRAM | NOUVEAU_BO_RD | NOUVEAU_BO_DUMMY;
 
+	MARK_RING (chan, 28, 26);
+
 	/* cause grobj autobind */
 	BEGIN_RING(chan, tesla, 0x0100, 1);
 	OUT_RING  (chan, 0);
 
-	OUT_RELOC (chan, screen->tic, (tesla->subc << 13) |
-		   NV50TCL_TIC_ADDRESS_HIGH | (2 << 18), rl, 0, 0);
+	BGN_RELOC (chan, screen->tic, tesla, NV50TCL_TIC_ADDRESS_HIGH, 2, rl);
 	OUT_RELOCh(chan, screen->tic, 0, rl);
 	OUT_RELOCl(chan, screen->tic, 0, rl);
 
-	OUT_RELOC (chan, screen->tsc, (tesla->subc << 13) |
-		   NV50TCL_TSC_ADDRESS_HIGH | (2 << 18), rl, 0, 0);
+	BGN_RELOC (chan, screen->tsc, tesla, NV50TCL_TSC_ADDRESS_HIGH, 2, rl);
 	OUT_RELOCh(chan, screen->tsc, 0, rl);
 	OUT_RELOCl(chan, screen->tsc, 0, rl);
 
-	OUT_RELOC (chan, screen->constbuf_misc[0], (tesla->subc << 13) |
-		   NV50TCL_CB_DEF_ADDRESS_HIGH | (3 << 18), rl, 0, 0);
+	BGN_RELOC (chan, screen->constbuf_misc[0],
+		   tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3, rl);
 	OUT_RELOCh(chan, screen->constbuf_misc[0], 0, rl);
 	OUT_RELOCl(chan, screen->constbuf_misc[0], 0, rl);
 	OUT_RELOC (chan, screen->constbuf_misc[0],
 		   (NV50_CB_PMISC << 16) | 0x0200, rl, 0, 0);
 
-	OUT_RELOC (chan, screen->constbuf_misc[0], (tesla->subc << 13) |
-		   NV50TCL_CB_DEF_ADDRESS_HIGH | (3 << 18), rl, 0, 0);
+	BGN_RELOC (chan, screen->constbuf_misc[0],
+		   tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3, rl);
 	OUT_RELOCh(chan, screen->constbuf_misc[0], 0x200, rl);
 	OUT_RELOCl(chan, screen->constbuf_misc[0], 0x200, rl);
 	OUT_RELOC (chan, screen->constbuf_misc[0],
 		   (NV50_CB_AUX << 16) | 0x0200, rl, 0, 0);
 
 	for (i = 0; i < 3; ++i) {
-		OUT_RELOC (chan, screen->constbuf_parm[i], (tesla->subc << 13) |
-			   NV50TCL_CB_DEF_ADDRESS_HIGH | (3 << 18), rl, 0, 0);
+		BGN_RELOC (chan, screen->constbuf_parm[i],
+			   tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3, rl);
 		OUT_RELOCh(chan, screen->constbuf_parm[i], 0, rl);
 		OUT_RELOCl(chan, screen->constbuf_parm[i], 0, rl);
 		OUT_RELOC (chan, screen->constbuf_parm[i],
-- 
1.6.4.4


--------------030502090800040303050904
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------030502090800040303050904--
