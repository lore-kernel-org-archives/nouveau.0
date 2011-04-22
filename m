From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31169] no image when booting / G86 [GeForce 8400M GS]
Date: Fri, 22 Apr 2011 14:43:12 -0700 (PDT)
Message-ID: <20110422214312.64CD6130051@annarchy.freedesktop.org>
References: <bug-31169-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31169-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31169

--- Comment #13 from stephan-VFuFlIpLkl8z9h7fjEe8Mw@public.gmane.org 2011-04-22 14:43:11 PDT ---
Hi,

dont know if this is related to this bug, but i dont have output in xorg too.

- linux-2.6.39-rc4 with all changes from
http://cgit.freedesktop.org/nouveau/linux-2.6 up to
4a76dc872b9ba0a29399c7149e59190f21797e8e (drm/nouveau/pm: translate ramcfg
strap through ram restrict table)
- xf86-video-nouveau git 8378443bd3b26b57ef2ae424a700e01ead813d33
(nv50-nvc0/exa: fix bug causing surface state to not be reemitted after flush)
- libdrm-2.4.25
- Mesa master git 6067a2a67f9a7aab2aee051469bea8af03747a95 (r600g: don't flush
the dest caches on every draw)

Xorg.log: http://pastebin.com/5GHkDzp3
dmesg: http://pastebin.com/4f8kRhWf

it seems xorg is running and i cant see anything wrong in xorg.log and dmesg.

Stephan

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
