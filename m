From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [Patch] Yet another version of the card pausing patch
Date: Thu, 03 Feb 2011 01:22:11 +0100
Message-ID: <4D49F533.4080301@free.fr>
References: <4D3C37BA.6050503@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------010907050904040909000000"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4D3C37BA.6050503-GANU6spQydw@public.gmane.org>
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
--------------010907050904040909000000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 23/01/2011 15:14, Martin Peres a =E9crit :
> Hi everyone,
>
> I would like devs to test this patch on all their cards(<nvc0) and=20
> report bugs/instability. It shouldn't ever crash (but it may not=20
> always work and return -EAGAIN).
>
> I've attached a little bash script that you need to modify according=20
> to the available perf levels. Please launch it and play, watch videos=20
> or browse the internet.
>
> Also, if you could look at the hold_spin variable and tell me how you=20
> would deal with that, it would be kind of you. The problem is that=20
> PGRAPH may take an awful lot
> of time to pause in certain conditions and holding the lock at this=20
> position isn't needed (as far as I can tell, the critical ressource is=20
> fifo_reassign).
>
> Martin
>
> PS: I'll be out in an hour for a week so I may be slower to answer=20
> messages.
Patch 3: Don't forget to set the name of the boot perf level.


--------------010907050904040909000000
Content-Type: text/x-patch;
 name="0003-Don-t-forget-to-name-the-boot-perflvl-boot.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0003-Don-t-forget-to-name-the-boot-perflvl-boot.patch"

From a7bb68ea2f2aefffd6a1254658b0d424c45622b5 Mon Sep 17 00:00:00 2001
From: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Date: Thu, 3 Feb 2011 00:51:00 +0100
Subject: [PATCH 3/3] Don't forget to name the boot perflvl "boot"

---
 drivers/gpu/drm/nouveau/nouveau_pm.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouveau/nouveau_pm.c
index de18bf2..201a15f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -510,6 +510,7 @@ nouveau_pm_init(struct drm_device *dev)
 	/* determine current ("boot") performance level */
 	ret = nouveau_pm_perflvl_get(dev, &pm->boot);
 	if (ret == 0) {
+		strcpy(pm->boot.name, "boot");
 		pm->cur = &pm->boot;
 
 		nouveau_pm_perflvl_info(&pm->boot, info, sizeof(info));
-- 
1.7.4


--------------010907050904040909000000
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------010907050904040909000000--
