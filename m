From: Jaime Velasco Juan <jsagarribay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] G72 doesn't need ExaCopy workaround
Date: Sat, 20 Oct 2007 12:19:04 +0100
Message-ID: <20071020111904.GA16500@singular.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="ZPt4rx8FFjLCG7dd"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I have a G72M wich is very slow when the workaround in NVExaCopy
kicks in. It works much better with the attached patch.

I wonder if that workaround is really needed.

Greetings,
   Jaime


--ZPt4rx8FFjLCG7dd
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: inline; filename="0001-G72-doesn-t-need-ExaCopy-workaround.patch"

From a7d1e23dcb6713230c15aa97968890c67fc11f4d Mon Sep 17 00:00:00 2001
From: Jaime Velasco Juan <jsagarribay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Sat, 20 Oct 2007 12:01:59 +0100
Subject: [PATCH] G72 doesn't need ExaCopy workaround

---
 src/nv_exa.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/src/nv_exa.c b/src/nv_exa.c
index d88d85a..b403072 100644
--- a/src/nv_exa.c
+++ b/src/nv_exa.c
@@ -283,7 +283,6 @@ static void NVExaCopy(PixmapPtr pDstPixmap,
 	if ( ((abs(srcY - dstY)< 16)||(abs(srcX-dstX)<16)) &&
 		((((pNv->Chipset & 0xfff0) == CHIPSET_G70) ||
 		 ((pNv->Chipset & 0xfff0) == CHIPSET_G71) ||
-		 ((pNv->Chipset & 0xfff0) == CHIPSET_G72) ||
 		 ((pNv->Chipset & 0xfff0) == CHIPSET_G73) ||
 		 ((pNv->Chipset & 0xfff0) == CHIPSET_C512))) )
 	{
-- 
1.5.3.3


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--ZPt4rx8FFjLCG7dd--
