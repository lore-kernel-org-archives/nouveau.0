From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74710] New: GT 730M: unknown chipset
Date: Sat, 08 Feb 2014 13:14:43 +0000
Message-ID: <bug-74710-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1273099574=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1273099574==
Content-Type: multipart/alternative; boundary="1391865283.5fAB2C31.29129"; charset="us-ascii"


--1391865283.5fAB2C31.29129
Date: Sat, 8 Feb 2014 13:14:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74710

          Priority: medium
            Bug ID: 74710
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: GT 730M: unknown chipset
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: blocker
    Classification: Unclassified
                OS: Linux (All)
          Reporter: mail-IUm52rQyP5wMgLIkOwrGR4dd74u8MsAO@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Hi,

I'm using linux 3.12.9 on a Thinkpad T440s with Intel HD 4400 and Nvidia GT
730M. The nvidia card is not working with nouveau:

[    2.769730] nouveau 0000:04:00.0: enabling device (0004 -> 0007)
[    2.769936] [drm] hdmi device  not found 4 0 1
[    2.770067] nouveau E[  DEVICE][0000:04:00.0] unknown chipset, 0x108100a1
[    2.770069] nouveau E[     DRM] failed to create 0x80000080, -22
[    2.770697] nouveau: probe of 0000:04:00.0 failed with error -22

[    0.000000] DMI: LENOVO 20ARS0XL00/20ARS0XL00, BIOS GJET67WW (2.17 )
12/10/2013

% xrandr --listproviders
Providers: number : 1
Provider 0: id: 0x49 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
4 outputs: 6 associated providers: 0 name:Intel

The issue also seemed to appear at
https://github.com/Bumblebee-Project/bbswitch/issues/78

I attached the full dmesg and hope you can help!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391865283.5fAB2C31.29129
Date: Sat, 8 Feb 2014 13:14:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - GT 730M: unknown chipset"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74710">74710</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GT 730M: unknown chipset
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>blocker
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mail&#64;tobias-neumann.eu
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi,

I'm using linux 3.12.9 on a Thinkpad T440s with Intel HD 4400 and Nvidia GT
730M. The nvidia card is not working with nouveau:

[    2.769730] nouveau 0000:04:00.0: enabling device (0004 -&gt; 0007)
[    2.769936] [drm] hdmi device  not found 4 0 1
[    2.770067] nouveau E[  DEVICE][0000:04:00.0] unknown chipset, 0x108100a1
[    2.770069] nouveau E[     DRM] failed to create 0x80000080, -22
[    2.770697] nouveau: probe of 0000:04:00.0 failed with error -22

[    0.000000] DMI: LENOVO 20ARS0XL00/20ARS0XL00, BIOS GJET67WW (2.17 )
12/10/2013

% xrandr --listproviders
Providers: number : 1
Provider 0: id: 0x49 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
4 outputs: 6 associated providers: 0 name:Intel

The issue also seemed to appear at
<a href="https://github.com/Bumblebee-Project/bbswitch/issues/78">https://github.com/Bumblebee-Project/bbswitch/issues/78</a>

I attached the full dmesg and hope you can help!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391865283.5fAB2C31.29129--

--===============1273099574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1273099574==--
