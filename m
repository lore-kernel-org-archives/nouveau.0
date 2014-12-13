From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82714] [G84] nouveau fails to properly initialize GPU
Date: Sat, 13 Dec 2014 11:52:15 +0000
Message-ID: <bug-82714-8800-OfH64Q2PVF@http.bugs.freedesktop.org/>
References: <bug-82714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1648329373=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82714-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1648329373==
Content-Type: multipart/alternative; boundary="1418471535.888D1.21479"; charset="UTF-8"


--1418471535.888D1.21479
Date: Sat, 13 Dec 2014 11:52:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82714

Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |---

--- Comment #3 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org> ---
This bug still applies with 3.18.

(In reply to Pierre Moreau from comment #2)
> I just tested on a GeForce 8600 GTS and had no problem loading Nouveau,
> launching X or kmscon or glxgears. Closing as fixed.

Are you testing on a system where the GeForce 8600 GTS is a secondary GPU and
not initialized by VBIOS?

If I'm booting on GF as primary GPU nouveau gets along with it. It's in the
case I'm booting on the radeon (and GF is thus left alone by BIOS) that things
are broken. Modprobe nouveau works, writing to its /dev/fb1 seems to work as
well (though monitor connected to GF via VGA cable sees no signal).

Launching kmscon freezes the whole system:
kmscon --drm --gpus=all -v --debug
[0000.000000] NOTICE: kmscon Revision kmscon-8 Oct 26 2014 19:43:16
[0000.000101] INFO: conf: reading config file /etc/kmscon/kmscon.conf
[0000.045957] NOTICE: vt: using tty /dev/tty7
[0000.046126] DEBUG: tsm_screen: new screen (tsm_screen_new() in
src/tsm_screen.c:573)
[0000.046152] DEBUG: tsm_vte: new vte object (tsm_vte_new() in
src/tsm_vte.c:399)
[0000.399785] INFO: drm_shared: new drm device via /dev/dri/card0
[0000.493045] INFO: video: new device 0x1f67ae0
[0000.493491] INFO: ignoring video device /dev/fb0 on seat seat0 as it is a
DRM-fbdev device
[0000.493772] INFO: drm_shared: new drm device via /dev/dri/card1

nothing follows and system does not respond anymore.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418471535.888D1.21479
Date: Sat, 13 Dec 2014 11:52:15 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:bonbons67&#64;internet.lu" title="Bruno &lt;bonbons67&#64;internet.lu&gt;"> <span class="fn">Bruno</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714">bug 82714</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>FIXED
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714">bug 82714</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons67&#64;internet.lu" title="Bruno &lt;bonbons67&#64;internet.lu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>This bug still applies with 3.18.

(In reply to Pierre Moreau from <a href="show_bug.cgi?id=82714#c2">comment #2</a>)
<span class="quote">&gt; I just tested on a GeForce 8600 GTS and had no problem loading Nouveau,
&gt; launching X or kmscon or glxgears. Closing as fixed.</span >

Are you testing on a system where the GeForce 8600 GTS is a secondary GPU and
not initialized by VBIOS?

If I'm booting on GF as primary GPU nouveau gets along with it. It's in the
case I'm booting on the radeon (and GF is thus left alone by BIOS) that things
are broken. Modprobe nouveau works, writing to its /dev/fb1 seems to work as
well (though monitor connected to GF via VGA cable sees no signal).

Launching kmscon freezes the whole system:
kmscon --drm --gpus=all -v --debug
[0000.000000] NOTICE: kmscon Revision kmscon-8 Oct 26 2014 19:43:16
[0000.000101] INFO: conf: reading config file /etc/kmscon/kmscon.conf
[0000.045957] NOTICE: vt: using tty /dev/tty7
[0000.046126] DEBUG: tsm_screen: new screen (tsm_screen_new() in
src/tsm_screen.c:573)
[0000.046152] DEBUG: tsm_vte: new vte object (tsm_vte_new() in
src/tsm_vte.c:399)
[0000.399785] INFO: drm_shared: new drm device via /dev/dri/card0
[0000.493045] INFO: video: new device 0x1f67ae0
[0000.493491] INFO: ignoring video device /dev/fb0 on seat seat0 as it is a
DRM-fbdev device
[0000.493772] INFO: drm_shared: new drm device via /dev/dri/card1

nothing follows and system does not respond anymore.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418471535.888D1.21479--

--===============1648329373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1648329373==--
