From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27706] Blank screen and "Error referencing VRAM
 ctxdma: -12" on NV44A with ubuntu lucid beta 2 (worked in alpha 3)
Date: Fri, 16 Apr 2010 15:31:56 -0700 (PDT)
Message-ID: <20100416223156.78C2C130011@annarchy.freedesktop.org>
References: <bug-27706-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27706-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

https://bugs.freedesktop.org/show_bug.cgi?id=27706

--- Comment #11 from mossroy.mossroy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2010-04-16 15:31:56 PDT ---
Regarding the version number of libdrmnouveau1, normally ubuntu uses a prefix
for the version upstream, and a suffix for the patches it applies on it.
So, I suppose it is based on version 2.4.18 (
http://cgit.freedesktop.org/mesa/drm/tag/?id=2.4.18 )
The changelog of ubuntu patches are there :
http://changelogs.ubuntu.com/changelogs/pool/main/libd/libdrm/libdrm_2.4.18-1ubuntu3/changelog
The difference between version "ubuntu2" and "ubuntu3" seems to be the
correction of this bug :
https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/547124
, that did not apparently affect me, and that corresponds to the following
commit :
http://cgit.freedesktop.org/mesa/drm/commit/?id=df32c307e8f81b46ee8aa4dd7222fc18f175bbb3
Not sure if it's really relevant in our case.

Maybe version alpha3 of ubuntu had the option "nouveau.noaccel=1" by default,
and not in version beta2? Which would explain the difference of behavior even
if the versions are very close.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
