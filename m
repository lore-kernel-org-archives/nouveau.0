From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86503] New: Discrete card seems to be powered on
 even if reported as Off
Date: Fri, 21 Nov 2014 00:01:09 +0000
Message-ID: <bug-86503-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1966596313=="
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


--===============1966596313==
Content-Type: multipart/alternative; boundary="1416528069.d3Ad17c71.620"; charset="UTF-8"


--1416528069.d3Ad17c71.620
Date: Fri, 21 Nov 2014 00:01:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86503

            Bug ID: 86503
           Summary: Discrete card seems to be powered on even if reported
                    as Off
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mszpak-5tc4TXWwyLM@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Following up Bug 70895.

On Fedora 21 with 3.17.3-300.fc21.x86_64 when booting with nouveau.runpm=0 I
have both cards on:
$ $ sudo cat /sys/kernel/debug/vgaswitcheroo/switch
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :Pwr:0000:01:00.0

and after:
# echo OFF > /sys/kernel/debug/vgaswitcheroo/switch

I have:
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :Off:0000:01:00.0

Looks ok, but I still see 3 providers:
$ xrandr --listproviders
Providers: number : 3
Provider 0: id: 0x90 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
3 outputs: 5 associated providers: 2 name:Intel
Provider 1: id: 0x63 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 2 outputs: 2 associated providers: 2 name:nouveau
Provider 2: id: 0x63 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 2 outputs: 2 associated providers: 2 name:nouveau

and system temperature could suggest that the card is still on.

When I use (on the second kernel) bbswitch with bumblebee I see only one
provider and the temperature is a few (~6) degrees lower.

I see no messages from VGA switcheroo in the system log (as there were in
3.11.6). Can I make output more verbose or do something else to provide more
details about the situation?


System specification:
Asus N43SN
GeForce GT 550M + integrated Intel card using i915 driver (NVidia Optimus)
kernel-3.17.3-300.fc21.x86_64
xorg-x11-drv-nouveau-1.0.11-1.fc21.x86_64
xorg-x11-server-Xorg-1.16.1-1.fc21.x86_64

Btw, on that system there is also problem with auto-suspending (with not
disabled nouveau.runpm) - a card is always in DynPwr - Bug 70875.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416528069.d3Ad17c71.620
Date: Fri, 21 Nov 2014 00:01:09 +0000
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
   title="NEW - Discrete card seems to be powered on even if reported as Off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86503">86503</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Discrete card seems to be powered on even if reported as Off
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>mszpak&#64;wp.pl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Following up <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - BUG: soft lockup - CPU#0 stuck for 22s! [Xorg:1292] after disable descrete card with switcheroo"
   href="show_bug.cgi?id=70895">Bug 70895</a>.

On Fedora 21 with 3.17.3-300.fc21.x86_64 when booting with nouveau.runpm=0 I
have both cards on:
$ $ sudo cat /sys/kernel/debug/vgaswitcheroo/switch
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :Pwr:0000:01:00.0

and after:
# echo OFF &gt; /sys/kernel/debug/vgaswitcheroo/switch

I have:
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :Off:0000:01:00.0

Looks ok, but I still see 3 providers:
$ xrandr --listproviders
Providers: number : 3
Provider 0: id: 0x90 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
3 outputs: 5 associated providers: 2 name:Intel
Provider 1: id: 0x63 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 2 outputs: 2 associated providers: 2 name:nouveau
Provider 2: id: 0x63 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 2 outputs: 2 associated providers: 2 name:nouveau

and system temperature could suggest that the card is still on.

When I use (on the second kernel) bbswitch with bumblebee I see only one
provider and the temperature is a few (~6) degrees lower.

I see no messages from VGA switcheroo in the system log (as there were in
3.11.6). Can I make output more verbose or do something else to provide more
details about the situation?


System specification:
Asus N43SN
GeForce GT 550M + integrated Intel card using i915 driver (NVidia Optimus)
kernel-3.17.3-300.fc21.x86_64
xorg-x11-drv-nouveau-1.0.11-1.fc21.x86_64
xorg-x11-server-Xorg-1.16.1-1.fc21.x86_64

Btw, on that system there is also problem with auto-suspending (with not
disabled nouveau.runpm) - a card is always in DynPwr - <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] runtime pm not auto-suspending card"
   href="show_bug.cgi?id=70875">Bug 70875</a>.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416528069.d3Ad17c71.620--

--===============1966596313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1966596313==--
