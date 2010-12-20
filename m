From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: nouveau_bo_busy not supported in kernel anymore
Date: Mon, 20 Dec 2010 22:20:35 +0100
Message-ID: <1292880035.3094.266.camel@workstation>
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
To: Nouveau Dev List <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi all,

I want to bring up this issue again on the mailing list, since it got
lost in some irc chat a few days ago.

Deadwood came to the channel and noted that
25ee1f0e25195729f28b15f33d74db9ec6afd696 removes support for
NOUVEAU_GEM_CPU_PREP_NOBLOCK in the kernel. This renders nouveau_bo_busy
quite useless.

Since nvfx depends on this function to avoid render serialization in the
fragment shader code we should either revert the commit, or if there are
valid reasons to remove the kernel support, rewrite the frag shader path
in nvfx.

Also radeon guys use some similar logic in their caching buffer manager
to implement buffer reuse, which seems to be a possible worthwhile
optimization for nvfx.

Darktama, can you please comment on the reasons for the kernel change?

-- lynxeye
