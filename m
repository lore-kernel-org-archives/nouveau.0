From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Sun, 07 Jul 2013 12:34:54 +0000
Message-ID: <bug-54700-8800-50mfsBOQEV@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0106473098=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0106473098==
Content-Type: multipart/alternative; boundary="1373200494.78fb61.13070"; charset="us-ascii"


--1373200494.78fb61.13070
Date: Sun, 7 Jul 2013 12:34:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #10 from r.ductor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
.... further info ....

# xrandr --verbose --q12
No protocol specified
Can't open display :0
# xrandr --prop --q12
No protocol specified
Can't open display :0


The only anomaly in Xorg.0.log I can detect is:
[    26.386] (II) NOUVEAU(0): Unknown vendor-specific block f
[    26.386] (II) NOUVEAU(0):  U0674^B<9A>M1LW02
[    26.386] (II) NOUVEAU(0):  <C0><B0><A0><90><80>hH
[    26.386] (II) NOUVEAU(0): EDID (in hex):
[    26.386] (II) NOUVEAU(0):   00ffffffffffff004d109f1300000000
[    26.386] (II) NOUVEAU(0):   200d0103802115780aa8a098554d8f26
[    26.386] (II) NOUVEAU(0):   1f505400000001010101010101010101
[    26.386] (II) NOUVEAU(0):   0101010101012f3f800871b023406420
[    26.386] (II) NOUVEAU(0):   26004bcf100000190000000f00000000
[    26.386] (II) NOUVEAU(0):   00000000002892025000000000fe0055
[    26.386] (II) NOUVEAU(0):   30363734029a4d314c573032000000fe
[    26.386] (II) NOUVEAU(0):   00c0b0a0908068480002010a202000a4

# dmesg|egrep -C 2 'nouveau E'
[    7.842891] nouveau  [     DRM] DCB outp 00: 01000100 000088b8
[    7.842900] nouveau  [     DRM] DCB outp 01: 02110223 00000064
[    7.842907] nouveau E[     DRM] Unknown LVDS configuration bits, please
report
[    7.842985] nouveau  [     DRM] DCB outp 02: 01120312 00000040
[    7.842994] nouveau  [     DRM] DCB outp 03: 01130321 00000001


... I'll be happy to report more info if required (in a detailed way please)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1373200494.78fb61.13070
Date: Sun, 7 Jul 2013 12:34:54 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:r.ductor&#64;gmail.com" title="r.ductor&#64;gmail.com">r.ductor&#64;gmail.com</a>
</span></b>
        <pre>.... further info ....

# xrandr --verbose --q12
No protocol specified
Can't open display :0
# xrandr --prop --q12
No protocol specified
Can't open display :0


The only anomaly in Xorg.0.log I can detect is:
[    26.386] (II) NOUVEAU(0): Unknown vendor-specific block f
[    26.386] (II) NOUVEAU(0):  U0674^B&lt;9A&gt;M1LW02
[    26.386] (II) NOUVEAU(0):  &lt;C0&gt;&lt;B0&gt;&lt;A0&gt;&lt;90&gt;&lt;80&gt;hH
[    26.386] (II) NOUVEAU(0): EDID (in hex):
[    26.386] (II) NOUVEAU(0):   00ffffffffffff004d109f1300000000
[    26.386] (II) NOUVEAU(0):   200d0103802115780aa8a098554d8f26
[    26.386] (II) NOUVEAU(0):   1f505400000001010101010101010101
[    26.386] (II) NOUVEAU(0):   0101010101012f3f800871b023406420
[    26.386] (II) NOUVEAU(0):   26004bcf100000190000000f00000000
[    26.386] (II) NOUVEAU(0):   00000000002892025000000000fe0055
[    26.386] (II) NOUVEAU(0):   30363734029a4d314c573032000000fe
[    26.386] (II) NOUVEAU(0):   00c0b0a0908068480002010a202000a4

# dmesg|egrep -C 2 'nouveau E'
[    7.842891] nouveau  [     DRM] DCB outp 00: 01000100 000088b8
[    7.842900] nouveau  [     DRM] DCB outp 01: 02110223 00000064
[    7.842907] nouveau E[     DRM] Unknown LVDS configuration bits, please
report
[    7.842985] nouveau  [     DRM] DCB outp 02: 01120312 00000040
[    7.842994] nouveau  [     DRM] DCB outp 03: 01130321 00000001


... I'll be happy to report more info if required (in a detailed way please)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1373200494.78fb61.13070--

--===============0106473098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0106473098==--
