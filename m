From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 38759] three monitors,
 two graphic cards and Xinerama - almost working
Date: Thu, 30 Jun 2011 14:38:18 -0700 (PDT)
Message-ID: <20110630213818.EC48513004D@annarchy.freedesktop.org>
References: <bug-38759-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-38759-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=38759

--- Comment #3 from Damian Nowak <nowaker-qMBiBlq7xnnVItvQsEIGlw@public.gmane.org> 2011-06-30 14:38:15 PDT ---
@Pekka, thanks for your suggestion. I first tried ZaphodHeads but got a message
in Xorg.0.log that driver doesn't understand it. I updated all X-related
packages to the newest versions from
https://launchpad.net/~xorg-edgers/+archive/ppa and apparently it works.

The strange thing you saw on the video is gone.
I saw it just once - maybe for 5 seconds - after a day-long work.
That's acceptable. :)

My xorg.conf: http://wklej.org/id/555276/txt/
You may update your instructions at
http://nouveau.freedesktop.org/wiki/MultiMonitorDesktop
I wrote it from scratch as I didn't find any examples on the Internet.

In my case, three Xineramed screens, nouveau > nvidia in terms of performance.

Windows maximizing works correctly.

More about my system:
libdrm-nouveau1 2.4.23+git20110119.550fe2ca
xserver-xorg 1:7.5+6+xserver1.9
xserver-xorg-video-nouveau 1:0.0.16+git20110214.46acb7e0
kernel 2.6.35-30-generic
Ubuntu 10.10

---

Currently I'm not interested in 4 monitors environment but being here I just
checked it. X doesn't start. First GPUs monitors only blink several times. I
will report a new bug for this issue soon after I test more xorg.conf
variations.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
