From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35267] nouveau fails to load BIOS on EFI boot.
Date: Thu, 24 Mar 2011 12:36:57 -0700 (PDT)
Message-ID: <20110324193657.1452C13000C@annarchy.freedesktop.org>
References: <bug-35267-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35267-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35267

--- Comment #5 from hanfi <freedesktop.org-6Pg49yFQ+vvtRgLqZ5aouw@public.gmane.org> 2011-03-24 12:36:56 PDT ---
Back when I had a OSX on my laptop, I used refit with GPT/BIOS syncing, and
nouveau worked back then (At least I think it did..I should been checking more
carefully back then)
I was hoping to somehow get away with no bios sync.

about your points:
a) I use(d) 2.6.36/38 in various versions. If your kernel does not boot at all,
you may want check my config at
https://dev.spahan.ch/svn/linux/kernel/configs/config oh, and you MUST use a
64bit kernel with EFI64 I think.
c) that is a error on that page. I can boot with EFI64 but not with EFI32
d) I think I tried different values there. But I  did not get any different
results at all, which makes me think I maybe did something worng, I will try
test again. (As I do not have macosx installed, I am not able to do that dtrace
thing as that is not installed in the install disk environment... well, I try
install it on a external disk and see if I can get any results.)
Additionaly, those screen resolutions there are for the default macbookpro4,1
(1440x900) but i got the "HighDEf" (1920x1200).


Anyway, can a developer tell me if it should be possible to use nouveau without
BIOS at all? If not, I wont waste more time on this and move on to waste time
on try getting BIOS emulation work in Grub.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
