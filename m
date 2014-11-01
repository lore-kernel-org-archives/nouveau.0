From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85742] New: GF117M Can *not* use nouveau at all
Date: Sat, 01 Nov 2014 19:32:46 +0000
Message-ID: <bug-85742-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1050404990=="
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


--===============1050404990==
Content-Type: multipart/alternative; boundary="1414870366.aED7F54e1.2586"; charset="UTF-8"


--1414870366.aED7F54e1.2586
Date: Sat, 1 Nov 2014 19:32:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85742

            Bug ID: 85742
           Summary: GF117M Can *not* use nouveau at all
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: lampshade-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 108769
  --> https://bugs.freedesktop.org/attachment.cgi?id=108769&action=edit
dmesg

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF117M [GeForce
610M/710M/820M / GT 620M/625M/630M/720M] [10de:1140] (rev a1)
    Subsystem: Acer Incorporated [ALI] GeForce GT 620M [1025:064a]
    Kernel driver in use: nouveau
    Kernel modules: nouveau

lsb_release -ircd
Distributor ID:    Fedora
Description:    Fedora release 21 (Twenty One)
Release:    21
Codename:    TwentyOne

uname -a
Linux Fedora21 3.17.1-304.fc21.x86_64 #1 SMP Sat Oct 25 00:56:36 UTC 2014
x86_64 x86_64 x86_64 GNU/Linux


cat /home/fedora/dmesg | grep -e "nouveau E" -e "nouveau W"
[    3.655926] nouveau W[     PFB][0000:01:00.0][0x00000000][ffff88009832f800]
reclocking of this ram type unsupported
[    3.709612] nouveau E[     DRM] Pointer to TMDS table invalid
[    3.711778] nouveau E[     DRM] Pointer to flat panel table invalid
[   30.776804] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x0000001f FAULT
at 0x6013d4 [ !ENGINE ]
[   51.790691] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x0000001f FAULT
at 0x6013d4 [ !ENGINE ]
[  109.843251] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x0000001f FAULT
at 0x6013d4 [ !ENGINE ]

Fortunately I have also Intel GPU (Optimus) so I can use my laptop.

xrandr --listproviders 
Providers: number : 1
Provider 0: id: 0x47 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
3 outputs: 5 associated providers: 0 name:Intel

On Ubuntu 14.04 with kernel based on 3.13 everything was OK. I also had
Slackware with custom build kernel 3.16 and nouveau doesn't worked.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414870366.aED7F54e1.2586
Date: Sat, 1 Nov 2014 19:32:46 +0000
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
   title="NEW - GF117M Can *not* use nouveau at all"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85742">85742</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GF117M Can *not* use nouveau at all
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
          <td>critical
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
          <td>lampshade&#64;poczta.fm
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=108769" name="attach_108769" title="dmesg">attachment 108769</a> <a href="attachment.cgi?id=108769&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF117M [GeForce
610M/710M/820M / GT 620M/625M/630M/720M] [10de:1140] (rev a1)
    Subsystem: Acer Incorporated [ALI] GeForce GT 620M [1025:064a]
    Kernel driver in use: nouveau
    Kernel modules: nouveau

lsb_release -ircd
Distributor ID:    Fedora
Description:    Fedora release 21 (Twenty One)
Release:    21
Codename:    TwentyOne

uname -a
Linux Fedora21 3.17.1-304.fc21.x86_64 #1 SMP Sat Oct 25 00:56:36 UTC 2014
x86_64 x86_64 x86_64 GNU/Linux


cat /home/fedora/dmesg | grep -e &quot;nouveau E&quot; -e &quot;nouveau W&quot;
[    3.655926] nouveau W[     PFB][0000:01:00.0][0x00000000][ffff88009832f800]
reclocking of this ram type unsupported
[    3.709612] nouveau E[     DRM] Pointer to TMDS table invalid
[    3.711778] nouveau E[     DRM] Pointer to flat panel table invalid
[   30.776804] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x0000001f FAULT
at 0x6013d4 [ !ENGINE ]
[   51.790691] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x0000001f FAULT
at 0x6013d4 [ !ENGINE ]
[  109.843251] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x0000001f FAULT
at 0x6013d4 [ !ENGINE ]

Fortunately I have also Intel GPU (Optimus) so I can use my laptop.

xrandr --listproviders 
Providers: number : 1
Provider 0: id: 0x47 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
3 outputs: 5 associated providers: 0 name:Intel

On Ubuntu 14.04 with kernel based on 3.13 everything was OK. I also had
Slackware with custom build kernel 3.16 and nouveau doesn't worked.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414870366.aED7F54e1.2586--

--===============1050404990==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1050404990==--
