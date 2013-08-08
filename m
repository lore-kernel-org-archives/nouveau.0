From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56615] [NVD9] Unable to start X on ThinkPad T420s
	laptop
Date: Thu, 08 Aug 2013 09:34:16 +0000
Message-ID: <bug-56615-8800-7AkNjUW1VL@http.bugs.freedesktop.org/>
References: <bug-56615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1428857307=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56615-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1428857307==
Content-Type: multipart/alternative; boundary="1375954456.B1A06B1.7729"; charset="us-ascii"


--1375954456.B1A06B1.7729
Date: Thu, 8 Aug 2013 09:34:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56615

--- Comment #21 from Mark Cave-Ayland <mark.cave-ayland-r2/yp8inhXLQXOPxS62xeg@public.gmane.org> ---
Hi Ilia,

I finally managed to get a working network connection on boot, and it looks as
if remote SSH is working. So I asked a friend who is fluent in X to ssh in
remotely and perform some tests :)

Things we found were:

1) On boot dmesg shows "nouveau E[     DRM] DDC responded, but no EDID for
DP-1" in the kernel logfile

2) xrandr -q --verbose works but very slowly; each line is noticeably lethargic
when appearing on screen. This output shows 3 DP outputs, but there is only one
DP connector on the laptop?! The physical ports on the laptop are:

LVDS-1 - on-board LCD screen
VGA-1 - external VGA output (possibly only wired to on-board Intel chip?)
DP-1 - external DP output (wired to NV9 chip only)

3) When manually trying to switch between the LVDS/DP-1 outputs with xrandr
there was a backtrace in the logs from drm_mode_set_config_internal().

I'll attach the related files onto this bug report.


Many thanks,

Mark.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375954456.B1A06B1.7729
Date: Thu, 8 Aug 2013 09:34:16 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615">bug 56615</a>
              from <span class="vcard"><a class="email" href="mailto:mark.cave-ayland&#64;ilande.co.uk" title="Mark Cave-Ayland &lt;mark.cave-ayland&#64;ilande.co.uk&gt;"> <span class="fn">Mark Cave-Ayland</span></a>
</span></b>
        <pre>Hi Ilia,

I finally managed to get a working network connection on boot, and it looks as
if remote SSH is working. So I asked a friend who is fluent in X to ssh in
remotely and perform some tests :)

Things we found were:

1) On boot dmesg shows &quot;nouveau E[     DRM] DDC responded, but no EDID for
DP-1&quot; in the kernel logfile

2) xrandr -q --verbose works but very slowly; each line is noticeably lethargic
when appearing on screen. This output shows 3 DP outputs, but there is only one
DP connector on the laptop?! The physical ports on the laptop are:

LVDS-1 - on-board LCD screen
VGA-1 - external VGA output (possibly only wired to on-board Intel chip?)
DP-1 - external DP output (wired to NV9 chip only)

3) When manually trying to switch between the LVDS/DP-1 outputs with xrandr
there was a backtrace in the logs from drm_mode_set_config_internal().

I'll attach the related files onto this bug report.


Many thanks,

Mark.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375954456.B1A06B1.7729--

--===============1428857307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1428857307==--
