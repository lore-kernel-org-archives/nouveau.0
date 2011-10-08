From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] xv: add support for AI44/IA44
Date: Sat, 8 Oct 2011 19:43:00 +0200
Message-ID: <20111008174300.GB4025@joi.lan>
References: <4E6B180B.1070401@gmail.com>
	<CAMmP6nczOaGwXbuaNEc-nrTw7kvGdjOr-6+qbWTMqm9s_UkpMA@mail.gmail.com>
	<4E6B977B.8040402@gmail.com> <20110910225420.GB30222@joi.lan>
	<20110913135255.GA6051@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110913135255.GA6051-OI9uyE9O0yo@public.gmane.org>
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

From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Sat, 10 Sep 2011 23:14:53 +0200
Subject: [PATCH] xv: support AI44/IA44

It's needed for osd in mplayer's xvmc output.
---
 src/nouveau_xv.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/src/nouveau_xv.c b/src/nouveau_xv.c
index 30753fa..5a5337c 100644
--- a/src/nouveau_xv.c
+++ b/src/nouveau_xv.c
@@ -1426,7 +1426,15 @@ NVQueryImageAttributes(ScrnInfoPtr pScrn, int id,
 			pitches[0] = size; // 4*width
 		size *= *h; // 4*width*height
 		break;
+	case FOURCC_AI44:
+	case FOURCC_IA44:
+		size = *w; // width
+		if (pitches)
+			pitches[0] = size; // width
+		size *= *h; // width*height
+		break;
 	default:
+		xf86DrvMsg(pScrn->scrnIndex, X_WARNING, "Unknown colorspace: %x\n", id);
 		*w = *h = size = 0;
 		break;
 	}
-- 
1.7.6.1
