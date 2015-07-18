From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56615] [NVD9] Unable to start X on ThinkPad T420s
	laptop
Date: Sat, 18 Jul 2015 10:51:44 +0000
Message-ID: <bug-56615-8800-g1rkDJvUzk@http.bugs.freedesktop.org/>
References: <bug-56615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1476360219=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56615-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1476360219==
Content-Type: multipart/alternative; boundary="1437216704.F16e5cC21.21797"; charset="UTF-8"


--1437216704.F16e5cC21.21797
Date: Sat, 18 Jul 2015 10:51:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56615

--- Comment #31 from Mark Cave-Ayland <mark.cave-ayland-r2/yp8inhXLQXOPxS62xeg@public.gmane.org> ---
I also noticed this too:

nouveau E[   VBIOS][0000:01:00.0] 0x5c2a[0]: script needs crtc

Just for the record, here is what happens with the latest linux-4.1 git
repository under a Debian wheezy setup:

1) Reboot laptop into Lenovo BIOS, switch display over from Integrated to
Discrete

2) Plug in DisplayPort cable

3) Reboot laptop once again

4) Initial kernel boot seems normal; kernel mode setting seems to work on
integrated LVDS supply on boot as normal, i.e. screen blanks and then redraws
at a higher resolution during boot with smaller fonts

5) The problem occurs when X starts. Both the integrated LVDS and DisplayPort
screens go black and here everything hangs. The laptop is unresponsive. If I do
a CTRL-ALT-F1 to switch back to a text console, it takes around 30s for the
laptop to react and switch to the new TTY.

6) Once in the text console, the laptop seems responsive once again.

While the related bug report mentioned a problem with the cursor under GNOME,
I'm actually using KDE (kdm) provided as standard with Debian Wheezy.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1437216704.F16e5cC21.21797
Date: Sat, 18 Jul 2015 10:51:44 +0000
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
   title="NEW - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615#c31">Comment # 31</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615">bug 56615</a>
              from <span class="vcard"><a class="email" href="mailto:mark.cave-ayland&#64;ilande.co.uk" title="Mark Cave-Ayland &lt;mark.cave-ayland&#64;ilande.co.uk&gt;"> <span class="fn">Mark Cave-Ayland</span></a>
</span></b>
        <pre>I also noticed this too:

nouveau E[   VBIOS][0000:01:00.0] 0x5c2a[0]: script needs crtc

Just for the record, here is what happens with the latest linux-4.1 git
repository under a Debian wheezy setup:

1) Reboot laptop into Lenovo BIOS, switch display over from Integrated to
Discrete

2) Plug in DisplayPort cable

3) Reboot laptop once again

4) Initial kernel boot seems normal; kernel mode setting seems to work on
integrated LVDS supply on boot as normal, i.e. screen blanks and then redraws
at a higher resolution during boot with smaller fonts

5) The problem occurs when X starts. Both the integrated LVDS and DisplayPort
screens go black and here everything hangs. The laptop is unresponsive. If I do
a CTRL-ALT-F1 to switch back to a text console, it takes around 30s for the
laptop to react and switch to the new TTY.

6) Once in the text console, the laptop seems responsive once again.

While the related bug report mentioned a problem with the cursor under GNOME,
I'm actually using KDE (kdm) provided as standard with Debian Wheezy.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1437216704.F16e5cC21.21797--

--===============1476360219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1476360219==--
