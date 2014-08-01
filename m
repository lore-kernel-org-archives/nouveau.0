From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54437] [NVC8] linux-nouveau2.6 (3.6.0-rc4) : GTX580
 : Xorg freezes when using accel
Date: Fri, 01 Aug 2014 21:36:44 +0000
Message-ID: <bug-54437-8800-4wte15cOks@http.bugs.freedesktop.org/>
References: <bug-54437-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1561981476=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54437-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1561981476==
Content-Type: multipart/alternative; boundary="1406929004.c8bdC04.3435"; charset="us-ascii"


--1406929004.c8bdC04.3435
Date: Fri, 1 Aug 2014 21:36:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54437

--- Comment #18 from t.jp-Mmb7MZpHnFY@public.gmane.org ---
I'm affected by this bug as well. Card is ASUS ENGTX580 DCII.

Distro: Arch Linux
X.Org: 1.16
mesa: 10.2.4
xf86-video-nouveau: 1.0.10

I have a Korean Monitor so there are some errors about missing EDID in the
dmesg, but even without an xorg.conf nouveau detected the 2560x1440 resolution
and Gnome 3 looked fine until it locked up.

The lockup happened, while I was typing a terminal in Gnome 3.12.2. Came out of
nowhere. I attached my dmesg log.

I rebooted and got another lockup very quickly but this time without the long
list of nouveau E[   PDISP] messages. Channel value is the same, but process is
Xorg.bin not mutter-launch.

read fault at 0x4391800000 [PT_NOT_PRESENT] from PGRAPH/CTXCTL on channel
0x005fb79000 [Xorg.bin[909]]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1406929004.c8bdC04.3435
Date: Fri, 1 Aug 2014 21:36:44 +0000
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
   title="NEW --- - [NVC8] linux-nouveau2.6 (3.6.0-rc4) : GTX580 : Xorg freezes when using accel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54437#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC8] linux-nouveau2.6 (3.6.0-rc4) : GTX580 : Xorg freezes when using accel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54437">bug 54437</a>
              from <span class="vcard"><a class="email" href="mailto:t.jp&#64;gmx.de" title="t.jp&#64;gmx.de">t.jp&#64;gmx.de</a>
</span></b>
        <pre>I'm affected by this bug as well. Card is ASUS ENGTX580 DCII.

Distro: Arch Linux
X.Org: 1.16
mesa: 10.2.4
xf86-video-nouveau: 1.0.10

I have a Korean Monitor so there are some errors about missing EDID in the
dmesg, but even without an xorg.conf nouveau detected the 2560x1440 resolution
and Gnome 3 looked fine until it locked up.

The lockup happened, while I was typing a terminal in Gnome 3.12.2. Came out of
nowhere. I attached my dmesg log.

I rebooted and got another lockup very quickly but this time without the long
list of nouveau E[   PDISP] messages. Channel value is the same, but process is
Xorg.bin not mutter-launch.

read fault at 0x4391800000 [PT_NOT_PRESENT] from PGRAPH/CTXCTL on channel
0x005fb79000 [Xorg.bin[909]]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1406929004.c8bdC04.3435--

--===============1561981476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1561981476==--
