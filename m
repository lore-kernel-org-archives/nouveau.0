From: "Nenhum_de_Nos" <matheus-jerQ8XtSt+hHp6+AxK4YsA@public.gmane.org>
Subject: install nouveau in FreeBSD 8-CURRENT amd64
Date: Sun, 15 Mar 2009 16:43:43 -0300 (BRT)
Message-ID: <312325d97d9810dfd7c4d9d7ffd6de9a.squirrel@cygnus.homeunix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

hail,

I'd like to try it in this OS, how to do ?

I saw on http://wiki.x.org/wiki/Development/git some info, but I really
need to rebuild all that ?

from my ports dir, I got error:
nv_dri.c:263:2: error: #error nouveau_drm.h does not match expected
patchlevel, update libdrm.
*** Error code 1

Stop in
/usr/ports/x11-drivers/xf86-video-nouveau/work/xf86-video-nouveau-0.0.10.20090129/src.
*** Error code 1

Stop in
/usr/ports/x11-drivers/xf86-video-nouveau/work/xf86-video-nouveau-0.0.10.20090129.
*** Error code 1

Stop in
/usr/ports/x11-drivers/xf86-video-nouveau/work/xf86-video-nouveau-0.0.10.20090129.
*** Error code 1

Stop in /usr/ports/x11-drivers/xf86-video-nouveau.


and also that was a tar.bz2 from january.

is there a easy way to have the new code to run in here ? I already got
the latest code from git.

thanks,

matheus


-- 
We will call you cygnus,
The God of balance you shall be
