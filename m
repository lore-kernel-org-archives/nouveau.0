From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH 0/4] nvfx: rework render temps code and fixes
Date: Tue, 10 Jan 2012 12:41:00 +0100
Message-ID: <1326195664-28384-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This patch series silences some	unknown	cap warnings and fixes up       
coding style (patch 1+4).

The most important part	of this	series are the two patches in the       
middle.	They rework the	state_fb code, so that we are able to   
render to not 64 byte aligned targets, as this is the only real
use-case for render temporaries	this allows us to drop temp code
completely and simplifies a lot	of cases.

This is	only tested on nv49, but there should be nothing different
in this	area for other nv3x or nv4x gpus.

I plan on working on top of that in the	following days,	so please
review and apply as time permits.

Thanks,
Lucas

Lucas Stach (4):
  nvfx: say no to stream output caps
  nvfx: rework state_fb code to get rid of render temps
  nvfx: drop render temporaries code
  nvfx: random cleanups of the state validation code

 src/gallium/drivers/nvfx/nvfx_context.h    |    2 +-
 src/gallium/drivers/nvfx/nvfx_fragtex.c    |    4 -
 src/gallium/drivers/nvfx/nvfx_miptree.c    |   18 +---
 src/gallium/drivers/nvfx/nvfx_resource.h   |   30 +-----
 src/gallium/drivers/nvfx/nvfx_screen.c     |    6 +-
 src/gallium/drivers/nvfx/nvfx_state_emit.c |   94 +++++------------
 src/gallium/drivers/nvfx/nvfx_state_fb.c   |  155 ++++++++++-----------------
 src/gallium/drivers/nvfx/nvfx_surface.c    |  136 +++----------------------
 8 files changed, 108 insertions(+), 337 deletions(-)

-- 
1.7.7.5
