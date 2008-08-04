From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16978] "tile offscreen pixmaps" causing graphics
 corruption on NV50?
Date: Mon,  4 Aug 2008 00:44:36 -0700 (PDT)
Message-ID: <20080804074436.967A313001F@annarchy.freedesktop.org>
References: <bug-16978-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-16978-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16978





--- Comment #1 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-08-04 00:44:35 PST ---
Am Sonntag, den 03.08.2008, 16:18 -0700 schrieb
bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org:
> http://bugs.freedesktop.org/show_bug.cgi?id=16978
> 
>            Summary: "tile offscreen pixmaps" causing graphics corruption on
>                     NV50?
>            Product: xorg
>            Version: unspecified
>           Platform: Other
>         OS/Version: All
>             Status: NEW
>           Severity: normal
>           Priority: medium
>          Component: Driver/nouveau
>         AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>         ReportedBy: chris-nEBun6gpv0i26MyoF4Ad0Q@public.gmane.org
>          QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
>                 CC: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> 
> 
> Hi,
> 
> (Shamelessly Cc'ing Ben Skeggs as he authored the offending commits)
Not necessary, unsurprisingly I'm subscribed :)

> 
> Am seeing some graphics corruption on nouveau with my 8600 GT consisting of odd
> black or white speckles on some widgets.
> 
> It's especially noticable on the folder list of the Claws Mail mail client, but
> also appears as white horizontal lines in a gnome-terminal window after some
> time. Please ask if a photo would be useful.
Yeah I'm very much aware of the issue, there's probably some gaps in our
understanding of how the tiled surface stuff works on nv5x chips.

However, the commit also allowed me to implement Xv and XRENDER
acceleration (the 3D engine *must* use tiled surfaces, it'll refuse
anything else), and the corruption is minor in most cases - so I decided
people could live with it for now.

I will note that I use the driver myself, on my main desktop machine -
so I eat my own dog food :)

We'll figure it out eventually, but as we have no nice docs like the
radeon guys it could take time.

Cheers,
Ben.
> 
> I've bisected it as follows:
> 
>  * Working version:
>    - drm
>        401f77a2ef1d55feaccc13cdae1e5379f4cfec7e
>        i915: official name for GM45 chipset
>        Zhenyu Wang <zhenyu.z.wang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>    - nouveau
>        5c1deac8384413dc483238f60c366e98253c11d6
>        exa: pass window coords to m2mf-based UTS/DFS
>        Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
>  * Broken version:
>    - drm
>        c7ed2c67916ee8058301c53b9d4690d81728fb95
>        nouveau: interface changes for nv5x 3d
>        Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>    - nouveau
>        33fad279e935a5a134ee5cc1777b8ed7510101d0
>        nv50: tile offscreen pixmaps
>        Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> I don't know whether it is nouveau or drm commit that is causing the issue -
> the "bad" nouveau commit requires a newer drm than its working neighbour (bumps
> NOUVEAU_DRM_HEADER_PATCHLEVEL). I would guess it was the "tile offscreen
> pixmaps" commit though.
> 
> Am running Linux 2.6.25/2.6.26 on x86_64.
> 
> Regards,
> 
> 


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
