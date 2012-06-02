From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31961] [drm:drm_crtc_helper_set_config] *ERROR*
 failed to set mode on [CRTC:6]
Date: Sat, 02 Jun 2012 07:45:57 +0000
Message-ID: <bug-31961-8800-LMY1aYc8FC@http.bugs.freedesktop.org/>
References: <bug-31961-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31961-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31961

--- Comment #12 from Salah Coronya <salah.coronya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-06-02 00:45:57 PDT ---
Created attachment 62407
  --> https://bugs.freedesktop.org/attachment.cgi?id=62407
dmesg, kernel 3.4.0 drm.debug=0x06

Here's a better dmesg, however instead of being CTRC 5 and 6; they are 9 and 10
(and so the error is "*ERROR* failed to set mode on [CRTC:10]"). CRTC:9 is the
VGA output, and CRTC:10 is the TV output. However, this card (an NV4E - GeForce
6150 LE - integrated onto the motherboard) HAS no TV output (or a DVI output
either, which is also detected). So CRTC:10 is connected to a phantom output.
Curiously enough, the framebuffer has a physical resolution of CRTC:9 (the
VGA), but a virtual resolution of CRTC:10 (the phantom TV output) - so it only
fills part of the screen.

Adding "video=VGA-1:1280x1024 video=TV-1:d video=DVI-D-1:d" works around the
problem; xorg.conf needs a similar setup to disable the "phantom" output and
specific a sane default resolution for the real one, like this:

Section "Monitor"
    Identifier "TV-1"
    Option "Ignore" "True"
EndSection

Section "Monitor"
    Identifier "DVI-D-1"
    Option "Ignore" "True"
EndSection

Section "Monitor"
    Identifier "VGA-1"
    Option "PreferredMode" "1280x1024"
EndSection

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
