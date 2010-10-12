From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29525] DVI monitor (via docking station) remains
	blank
Date: Tue, 12 Oct 2010 04:11:52 -0700 (PDT)
Message-ID: <20101012111152.BF97413004F@annarchy.freedesktop.org>
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

aa_z9-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #38327|0                           |1
        is obsolete|                            |

--- Comment #7 from aa_z9-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org 2010-10-12 04:11:52 PDT ---
Created an attachment (id=39378)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=39378)
Dmesg output

Using the (latest) nouveau driver and kernel from:

Repository: git://anongit.freedesktop.org/nouveau/linux-2.6
Commit: 4ec13442f9f9dfedb15473fdfc99fa71967ed48e

I still see the same issue. If I boot with the DVI monitor attached, only the
LVDS on the laptop is initialised, but as soon as I physically unplug the DVI
and plug it back in, the DVI starts working.

Dmesg output attached - DVI unplugged at about 16 seconds and reconnected at
about 18 seconds.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
