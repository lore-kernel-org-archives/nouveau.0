From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 0/2] nv50,
	nvc0: fix weirdo zs formats and their blits
Date: Fri, 19 Sep 2014 00:19:42 -0400
Message-ID: <1411100384-22547-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: David Heidelberger <david.heidelberger-W22tF5X+A20@public.gmane.org>
List-Id: nouveau.vger.kernel.org

There were reports of issues with gallium-nine. It's unclear whether mesa/st
uses these, the patches did not produce any piglit changes. However they seem
right...

Ilia Mirkin (2):
  nv50,nvc0: add missing depth/stencil formats to tile flag selection
  nv50,nvc0: fix 3d blit logic for odd depth/stencil formats

 src/gallium/drivers/nouveau/nv50/nv50_blit.h    | 21 ++++++++++++++-------
 src/gallium/drivers/nouveau/nv50/nv50_miptree.c |  4 ++++
 src/gallium/drivers/nouveau/nv50/nv50_surface.c |  4 ++++
 src/gallium/drivers/nouveau/nvc0/nvc0_miptree.c |  4 ++++
 4 files changed, 26 insertions(+), 7 deletions(-)

-- 
1.8.5.5
