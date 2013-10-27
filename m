From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 43939] [NV96] monitor connected via HDMI->DVI
 adapter is blank / standby (9500GS)
Date: Sun, 27 Oct 2013 17:19:47 +0000
Message-ID: <bug-43939-8800-V2K30SN4ux@http.bugs.freedesktop.org/>
References: <bug-43939-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0927492020=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-43939-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0927492020==
Content-Type: multipart/alternative; boundary="1382894387.cA44DFba3.20809"; charset="us-ascii"


--1382894387.cA44DFba3.20809
Date: Sun, 27 Oct 2013 17:19:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=43939

--- Comment #17 from shade <shade.poczta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I was thinking about adding a bug, but i found this. Looks like i could have a
small clue or it is just in my case.

I have standard HDMI cable, and my screen is black after grub, but monitor have
signal all the time. I found that i need to force monitor to check again for
signal settings, aka change zoom in/hdmi overscan (in monitor device settings
using pilot/buttons on it) or something simular and then all shows up. After
every restart or changing monitor input from hdmi to other and again to hdmi it
brakes again. I wasn't sure if that wasn't my monitor problem but this bug
looks same and its about hdmi output signal. Every log dmesg/xorg/others does
not show any problems also.

Changing resolution or other settings with xrandr does not affect information
showed by monitor info section (all time shows full hd@60Hz) even if xrandr
says its set to other.

I got:
3.11.5 kernel (same on 3.11.6)
xorg 1.14.3 (same on live trunk from today)
nouveau 1.0.9 (same on live trunk from today)

Hardware:
GFX 950 TI Boost aka NVE6

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382894387.cA44DFba3.20809
Date: Sun, 27 Oct 2013 17:19:47 +0000
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
   title="NEW --- - [NV96] monitor connected via HDMI-&gt;DVI adapter is blank / standby (9500GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=43939#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] monitor connected via HDMI-&gt;DVI adapter is blank / standby (9500GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=43939">bug 43939</a>
              from <span class="vcard"><a class="email" href="mailto:shade.poczta&#64;gmail.com" title="shade &lt;shade.poczta&#64;gmail.com&gt;"> <span class="fn">shade</span></a>
</span></b>
        <pre>I was thinking about adding a bug, but i found this. Looks like i could have a
small clue or it is just in my case.

I have standard HDMI cable, and my screen is black after grub, but monitor have
signal all the time. I found that i need to force monitor to check again for
signal settings, aka change zoom in/hdmi overscan (in monitor device settings
using pilot/buttons on it) or something simular and then all shows up. After
every restart or changing monitor input from hdmi to other and again to hdmi it
brakes again. I wasn't sure if that wasn't my monitor problem but this bug
looks same and its about hdmi output signal. Every log dmesg/xorg/others does
not show any problems also.

Changing resolution or other settings with xrandr does not affect information
showed by monitor info section (all time shows full hd&#64;60Hz) even if xrandr
says its set to other.

I got:
3.11.5 kernel (same on 3.11.6)
xorg 1.14.3 (same on live trunk from today)
nouveau 1.0.9 (same on live trunk from today)

Hardware:
GFX 950 TI Boost aka NVE6</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382894387.cA44DFba3.20809--

--===============0927492020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0927492020==--
