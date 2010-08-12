From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29525] DVI monitor (via docking station) remains
	blank
Date: Thu, 12 Aug 2010 03:41:32 -0700 (PDT)
Message-ID: <20100812104132.D579A1300F4@annarchy.freedesktop.org>
References: <bug-29525-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29525-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29525

--- Comment #3 from aa_z9-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org 2010-08-12 03:41:32 PDT ---
Created an attachment (id=37808)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=37808)
dmesg output with drm.debug=14 nouveau.reg_debug=0x0200 log_buf_len=2M options

dmesg output

/proc/version: Linux version 2.6.35 (scott-0EOjcATAU6bn8B+8inL+z9Rn8mvF1RMruzRnaZiUymE@public.gmane.org) (gcc
version 4.4.3 (Debian 4.4.3-3) ) #3 SMP Sun Aug 8 16:27:53 EST 2010

/proc/cmdline: root=/dev/sda6 resume=/dev/sda5 no_console_suspend
earlyprintk=vga snd-hda-intel.model=toshiba drm.debug=14
nouveau.reg_debug=0x0200 log_buf_len=2M

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
