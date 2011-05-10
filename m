From: Didier Spaier <didier.spaier-GqzDj6/B2j8@public.gmane.org>
Subject: Re: [Bug 37026] New: can't compile drm_nouveau. Slackware
 12.2 (linux-2.6.38-r4 from gentoo-sources)
Date: Tue, 10 May 2011 23:07:41 +0200
Message-ID: <4DC9A91D.2080505@epsm.fr>
References: <bug-37026-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-37026-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

First I am a bit surprised that you use a kernel coming from gentoo on Slackware 12.2.

I would suggest you configure, compile and install a vanilla 2.6.39-rc7 (as of today) kernel,
re-using one of the .config files available in a slackware-13.37 mirror, in the directory
/slackware-13.37-mirror/testing/source/linux-2.6.39-rc4-configs

In of of these you'll get e.g. :

bash-4.1$ grep DRM config-generic-smp-2.6.39-rc4-smp
CONFIG_DRM=m
CONFIG_DRM_KMS_HELPER=m
CONFIG_DRM_TTM=m
...
CONFIG_DRM_NOUVEAU=m
CONFIG_DRM_NOUVEAU_BACKLIGHT=y
CONFIG_DRM_NOUVEAU_DEBUG=y
...

Please note that all drivers are modularized, though I don't know if that really matters.

Then, I suggest that you re-use the SlackBuilds available in:
/slackware-13.37-mirror/testing/source
to build Slackware package(s) for recent (but not git) version(s) of (mesa and) libdrm, i.e. lindrm-24.25 and mesa-7.10.2.

If this work (which I am not sure at all as the other components of the X stack and the libraries are pretty old in slackware-12.2),
you will be able to build xf86-video-nouveau-git_20110417_8378443 the same way.

PS Out of curiosity, why put a very recent X stack on top of a very old distribution?

On 09/05/2011 19:10, bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org wrote:
> https://bugs.freedesktop.org/show_bug.cgi?id=37026
>
>             Summary: can't compile drm_nouveau. Slackware 12.2
>                      (linux-2.6.38-r4 from gentoo-sources)
>             Product: xorg
>             Version: git
>            Platform: x86 (IA32)
>          OS/Version: Linux (All)
>              Status: NEW
>            Severity: critical
>            Priority: medium
>           Component: Driver/nouveau
>          AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>          ReportedBy: ualinuxcn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>           QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
>
>
> # git clone git://anongit.freedesktop.org/git/mesa/drm
> # cd ./drm
> # ./autogen.sh
> http://paste.pocoo.org/show/385919/
>
> Here is my kernel .config
> http://paste.pocoo.org/show/385920/
> or
> # grep DRM .config
> CONFIG_DRM=y
> CONFIG_DRM_KMS_HELPER=y
> CONFIG_DRM_TTM=y
> CONFIG_DRM_NOUVEAU=y
>
> Here is # head  /var/log/messages
> http://paste.pocoo.org/show/385922/
>
