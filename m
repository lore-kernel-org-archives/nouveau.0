From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26733] Full-screen XV causes graphics lockup
Date: Tue, 10 Aug 2010 11:12:42 -0700 (PDT)
Message-ID: <20100810181242.2442C1300D7@annarchy.freedesktop.org>
References: <bug-26733-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26733-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=26733

--- Comment #22 from Ben Kevan <ben.kevan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-08-10 11:12:42 PDT ---
I am having the same issue during normal day to day use. The applications being
used are:

Fluxbox
urxvt
xcompmgr
mpc 
pidgin
Chromium (unsure if pages have flash at the time of crash) 

Here's info on my card:

$ lspci | grep -i nvidia
01:00.0 VGA compatible controller: nVidia Corporation G98M [Quadro NVS 160M]

Here's the info from /var/log/messages that pertain to the crash: 

$ sudo grep PGRAPH /var/log/messages
Aug 10 10:39:10 bkfc05006060 kernel: [drm] nouveau 0000:01:00.0:
PGRAPH_DATA_ERROR - Ch 2/5 Class 0x8297 Mthd 0x0200 Data 0x00000000:0x00044110
Aug 10 10:39:10 bkfc05006060 kernel: [drm] nouveau 0000:01:00.0:
PGRAPH_DATA_ERROR - INVALID_BITFIELD
Aug 10 10:39:10 bkfc05006060 kernel: [drm] nouveau 0000:01:00.0:
PGRAPH_DATA_ERROR - Ch 2/5 Class 0x8297 Mthd 0x0208 Data 0x00000000:0x0014a200
Aug 10 10:39:10 bkfc05006060 kernel: [drm] nouveau 0000:01:00.0:
PGRAPH_DATA_ERROR - INVALID_BITFIELD
Aug 10 10:48:23 bkfc05006060 kernel: [drm] nouveau 0000:01:00.0:
PGRAPH_DATA_ERROR - Ch 2/5 Class 0x8297 Mthd 0x0fa4 Data 0x00000000:0x00042050
Aug 10 10:48:23 bkfc05006060 kernel: [drm] nouveau 0000:01:00.0:
PGRAPH_DATA_ERROR - INVALID_BITFIELD
Aug 10 10:48:23 bkfc05006060 kernel: [drm] nouveau 0000:01:00.0:
PGRAPH_DATA_ERROR - Ch 2/5 Class 0x8297 Mthd 0x0fa8 Data 0x00000000:0x00036c0f
Aug 10 10:48:23 bkfc05006060 kernel: [drm] nouveau 0000:01:00.0:
PGRAPH_DATA_ERROR - INVALID_VALUE

I'm on Fedora 13, running: 

2.6.33.6-147.2.4.fc13.i686.PAE

Please fix.. I would hate to have to move to the proprietary driver to get a
functional machine.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
