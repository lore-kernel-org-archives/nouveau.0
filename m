From: Didier Spaier <didier.spaier-GqzDj6/B2j8@public.gmane.org>
Subject: Re: [Bug 28196] New: Nouveau only loads correct when
 starting X with nvidia first
Date: Fri, 21 May 2010 12:00:22 +0200
Message-ID: <4BF659B6.1000400@epsm.fr>
References: <bug-28196-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-28196-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org wrote:
> https://bugs.freedesktop.org/show_bug.cgi?id=28196
> 
>            Summary: Nouveau only loads correct when starting X with nvidia
>                     first
>            Product: xorg
>            Version: 7.4
>           Platform: x86-64 (AMD64)
>         OS/Version: Linux (All)
>             Status: NEW
>           Severity: normal
>           Priority: medium
>          Component: Driver/nouveau
>         AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>         ReportedBy: felixblanke-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>          QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
> 
> 
> Created an attachment (id=35780)
>  --> (https://bugs.freedesktop.org/attachment.cgi?id=35780)
> Xorg.log when the problem occurs
> 
> Hi,
> 
> I've a strange problem:
> 
> When I load nouveau at boot it doesn't load correct. X doesn't start (see
> attached Xorg.log) and the resolution of the console doesn't change.
> 
> When I start X with the nvidia driver first, then go to a console, stop X,
> unload nvidia module, load nouveau -> nouveau does work.
> When I just load nouveau without that nvidia stuff before nothing works.
> 
> Kernel: 2.6.34-gentoo
> xf86-video-nouvea: 0.0.16_pre2010051
> x11-base/xorg-server: 1.8.0
> x11-base/xorg-drivers: 1.8
According to http://nouveau.freedesktop.org/wiki/TroubleShooting Nouveau do not coexist nicely with the BLOB.

Could you completely remove the proprietary driver (see basic questions 3. and 5. in aforementioned document) and see if you can load nouveau and start X ?
