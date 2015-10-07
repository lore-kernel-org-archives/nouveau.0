From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92327] New: Tearing and drm_wait_vblank kernel log
 spam with reverse PRIME (intel+nouveau)
Date: Wed, 07 Oct 2015 07:22:33 +0000
Message-ID: <bug-92327-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0303467816=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0303467816==
Content-Type: multipart/alternative; boundary="1444202553.8Bdd1.27515"; charset="UTF-8"


--1444202553.8Bdd1.27515
Date: Wed, 7 Oct 2015 07:22:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92327

            Bug ID: 92327
           Summary: Tearing and drm_wait_vblank kernel log spam with
                    reverse PRIME (intel+nouveau)
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mschiffer+misc-Nyw9WiXk/RKXhJHkyCwd5uTW4wlIGRCZ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Setup: I use reverse PRIME with a primary intel and a secondary nouveau card. I
have enabled one output on each of the cards. The reverse PRIME (nouveau)
output is set as primary output via xrandr.

Whenever there's a DRI user on the reverse PRIME screen, the following message
gets written to my kernel log once for each buffer swap:

[drm:drm_wait_vblank [drm]] *ERROR* Unsupported type value 0x7d, supported mask
0x7400003f

Both DRI2 and DRI3 cause this behaviour. I also see tearing on the nouveau
output.

Depending on the exact setup (DRI2/DRI3, different DRI users), I also get
slightly different messages:

[drm:drm_wait_vblank [drm]] *ERROR* Unsupported type value 0x15d, supported
mask 0x7400003f
[drm:drm_wait_vblank [drm]] *ERROR* Unsupported type value 0x400015d, supported
mask 0x7400003f


Hardware:

00:02.0 VGA compatible controller: Intel Corporation 2nd Generation Core
Processor Family Integrated Graphics Controller (rev 09)
01:00.0 VGA compatible controller: NVIDIA Corporation GF119M [Quadro NVS 4200M]
(rev a1)

Software:

* xserver 1.17.2
* xf86-video-intel 2.99.917-476-g4e668dd
* xf86-video-nouveau 1.0.11-31-g1ff13a9


I opened a bug report for the kernel first (see
https://bugzilla.kernel.org/show_bug.cgi?id=105601 ), but was told that this is
a userspace bug.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1444202553.8Bdd1.27515
Date: Wed, 7 Oct 2015 07:22:33 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Tearing and drm_wait_vblank kernel log spam with reverse PRIME (intel+nouveau)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92327">92327</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Tearing and drm_wait_vblank kernel log spam with reverse PRIME (intel+nouveau)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mschiffer+misc&#64;universe-factory.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Setup: I use reverse PRIME with a primary intel and a secondary nouveau card. I
have enabled one output on each of the cards. The reverse PRIME (nouveau)
output is set as primary output via xrandr.

Whenever there's a DRI user on the reverse PRIME screen, the following message
gets written to my kernel log once for each buffer swap:

[drm:drm_wait_vblank [drm]] *ERROR* Unsupported type value 0x7d, supported mask
0x7400003f

Both DRI2 and DRI3 cause this behaviour. I also see tearing on the nouveau
output.

Depending on the exact setup (DRI2/DRI3, different DRI users), I also get
slightly different messages:

[drm:drm_wait_vblank [drm]] *ERROR* Unsupported type value 0x15d, supported
mask 0x7400003f
[drm:drm_wait_vblank [drm]] *ERROR* Unsupported type value 0x400015d, supported
mask 0x7400003f


Hardware:

00:02.0 VGA compatible controller: Intel Corporation 2nd Generation Core
Processor Family Integrated Graphics Controller (rev 09)
01:00.0 VGA compatible controller: NVIDIA Corporation GF119M [Quadro NVS 4200M]
(rev a1)

Software:

* xserver 1.17.2
* xf86-video-intel 2.99.917-476-g4e668dd
* xf86-video-nouveau 1.0.11-31-g1ff13a9


I opened a bug report for the kernel first (see
<a href="https://bugzilla.kernel.org/show_bug.cgi?id=105601">https://bugzilla.kernel.org/show_bug.cgi?id=105601</a> ), but was told that this is
a userspace bug.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444202553.8Bdd1.27515--

--===============0303467816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0303467816==--
