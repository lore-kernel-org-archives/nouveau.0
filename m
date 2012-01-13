From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: "enable ctxprog xfer only when we need it to save
 power" introduces big performance regression
Date: Fri, 13 Jan 2012 22:26:38 +0100
Message-ID: <4F10A18E.1030908@free.fr>
References: <20111029170801.GA3219@joi.lan> <20111029172923.GA3110@joi.lan>
	<20111029190938.GA3105@joi.lan> <20111109221009.GD3402@joi.lan>
	<4EBB78F4.2020902@ensi-bourges.fr> <20111228213902.GA4275@joi.lan>
	<4EFBAD2B.8080207@ensi-bourges.fr> <20111229013850.GA4076@joi.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------070103070801000605020507"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20111229013850.GA4076-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------070103070801000605020507
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Marcin,

As promised, I started working on your performance problem.

Le 29/12/2011 02:38, Marcin Slusarz a =E9crit :
> I tried to implement xfers runtime switching, but couldn't figure out=20
> how to change ctxprog behaviour without rebuilding and reuploading=20
> whole thing. Reading host-writable memory from ctxprog would be enough.=
=20
Well, I did that for you (see the patch enclosed). The patch uses the=20
4th ctxprog flag register's bit 0 to store the wanted behaviour.
Mwk suggested me to do so and it worked perfectly.

You have all the instructions in the commit message, please report on=20
the actual results!

By the mean time, I'll plug it to a PM brain so as it would switch back=20
and forth between the two modes according to the load or the perflvl.

Take care,

Martin

--------------070103070801000605020507
Content-Type: text/x-patch;
 name="0001-drm-nv50-gr-make-ctxprog-decide-at-run-time-to-disab.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-drm-nv50-gr-make-ctxprog-decide-at-run-time-to-disab.pa";
 filename*1="tch"

From 8e6667c87074b1b519fef0946083d46d01dfe8a0 Mon Sep 17 00:00:00 2001
From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
Date: Fri, 13 Jan 2012 22:05:28 +0100
Subject: [PATCH] drm/nv50/gr: make ctxprog decide at run time to disable or
 not xfer

This commit is a follow-up on "drm/nv50/gr: enable ctxprog xfer only when we need it to save power".

The current situation is that some cards (nv92) have an hw regression that lower performance that
has been reported to about 15%.

This commit is the initial work to get the best of both world, that is to say:
- Performance when it is actually needed
- Power consumption when current performance is enough for the current needs

How-to:
- To go for performance      : nvapoke 400830 1
- To go for power consumption: nvapoke 400830 0

Then, force the card to do a context switch (switch to a TTY for instance).
Make sure it worked by peeking 400824. Bit 0x4000 is the XFER_ENABLE.

Reported-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_grctx.c |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_grctx.c b/drivers/gpu/drm/nouveau/nv50_grctx.c
index 4b46d69..b2fdb7d 100644
--- a/drivers/gpu/drm/nouveau/nv50_grctx.c
+++ b/drivers/gpu/drm/nouveau/nv50_grctx.c
@@ -74,6 +74,11 @@
 #define CP_FLAG_INTR_NOT_PENDING      0
 #define CP_FLAG_INTR_PENDING          1
 
+/* CTXCTL_FLAGS_3: should only be written by host ! */
+#define CP_FLAG_PM_XFER               ((3 * 32) + 0)
+#define CP_FLAG_PM_XFER_ENABLE        0
+#define CP_FLAG_PM_XFER_DISABLE       1
+
 #define CP_CTX                   0x00100000
 #define CP_CTX_COUNT             0x000f0000
 #define CP_CTX_COUNT_SHIFT               16
@@ -163,6 +168,7 @@ enum cp_label {
 	cp_setup_save,
 	cp_swap_state,
 	cp_prepare_exit,
+	cp_xfer,
 	cp_exit,
 };
 
@@ -263,13 +269,17 @@ nv50_grctx_init(struct nouveau_grctx *ctx)
 	cp_set (ctx, UNK03, CLEAR);
 	cp_set (ctx, UNK1D, CLEAR);
 
-	cp_bra (ctx, USER_SAVE, PENDING, cp_exit);
+	cp_bra (ctx, USER_SAVE, PENDING, cp_xfer);
 	cp_out (ctx, CP_NEXT_TO_CURRENT);
 
+	/* disable xfer unless we are told otherwise by the host */
+	cp_name(ctx, cp_xfer);
+	cp_bra (ctx, PM_XFER, DISABLE, cp_exit);
+	cp_set (ctx, XFER_SWITCH, DISABLE);
+
 	cp_name(ctx, cp_exit);
 	cp_set (ctx, USER_SAVE, NOT_PENDING);
 	cp_set (ctx, USER_LOAD, NOT_PENDING);
-	cp_set (ctx, XFER_SWITCH, DISABLE);
 	cp_set (ctx, STATE, STOPPED);
 	cp_out (ctx, CP_END);
 	ctx->ctxvals_pos += 0x400; /* padding... no idea why you need it */
-- 
1.7.8.3


--------------070103070801000605020507
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------070103070801000605020507--
