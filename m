From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78544] New: NV28M running at 1/8th GPU clock when
	using nouveau
Date: Sat, 10 May 2014 20:29:05 +0000
Message-ID: <bug-78544-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1821404582=="
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


--===============1821404582==
Content-Type: multipart/alternative; boundary="1399753745.b31b1.5118"; charset="us-ascii"


--1399753745.b31b1.5118
Date: Sat, 10 May 2014 20:29:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78544

          Priority: medium
            Bug ID: 78544
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: NV28M running at 1/8th GPU clock when using nouveau
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: nv28m-Y8qEzhMunLyT9ig0jae3mg@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: 7.7 (2011)
         Component: Driver/nouveau
           Product: xorg

See https://bugs.freedesktop.org/show_bug.cgi?id=54700 some details. I've
opened this as the speed problem has nothing to do with the distortion, but
I've noticed it when debugging that problem. I've e-mailed two dumps for that
thread for this machine.

In short nouveau is slow normally, unless I insert the nvidia module in one
kernel and kexec into another kernel. Then nouveau is fast until I suspend to
RAM. After resume it's slow again. And I can't fix it ;)

Long version:

I've played a bit with nvclock and found something interesting. When using the
nvidia driver in X I get:

================================
-- General info --
Card:           nVidia Geforce 4 4000 GO
Architecture:   NV28 A2
PCI id:         0x286
NVPLL_COEFF=00010d01
m=1 n=13 p=1
GPU clock:      175.500 MHz
Bustype:        AGP

-- Memory info --
Amount:         32 MB
Type:           128 bit DDR
MPLL_COEFF=00001d02
m=2 n=29 p=0
Clock:          391.500 MHz

-- AGP info --
Status:         Enabled
Rate:           4X
AGP rates:      1X 2X 4X
Fast Writes:    Disabled
SBA:            Disabled

-- VideoBios information --
Version: 04.28.20.31
Signon message: NV28 P138 Mobile Reference VGA BIOS
================================

When I switch to console, then it's:

================================
-- General info --
Card:           nVidia Geforce 4 4000 GO
Architecture:   NV28 A2
PCI id:         0x286
NVPLL_COEFF=00040d01
m=1 n=13 p=4
GPU clock:      21.937 MHz
Bustype:        AGP
================================

When I do the same using nouveau in X (after nvidia kexec):

================================
-- General info --
Card:         nVidia Geforce 4 4000 GO
Architecture:     NV28 A2
PCI id:     0x286
NVPLL_COEFF=00040d01
m=1 n=13 p=4
GPU clock:     21.937 MHz
Bustype:     AGP

-- Memory info --
Amount:     32 MB
Type:         128 bit DDR
MPLL_COEFF=00000f01
m=1 n=15 p=0
Clock:         405.000 MHz

-- AGP info --
Status:     Enabled
Rate:         4X
AGP rates:     1X 2X 4X 
Fast Writes:     Enabled
SBA:         Enabled

-- VideoBios information --
Version: 04.28.20.31
Signon message: NV28 P138 Mobile Reference VGA BIOS
================================

Nouveau on console (after nvidia kexec):

================================
-- General info --
Card:           nVidia Geforce 4 4000 GO
Architecture:   NV28 A2
PCI id:         0x286
NVPLL_COEFF=00010d01
m=1 n=13 p=1
GPU clock:      175.500 MHz
Bustype:        AGP
================================

And what is interesting if I do a "nvclock -i -d | cat" on console then it's:

================================
-- General info --
Card:         nVidia Geforce 4 4000 GO
Architecture:     NV28 A2
PCI id:     0x286
NVPLL_COEFF=00040d01
m=1 n=13 p=4
GPU clock:     21.937 MHz
Bustype:     AGP
================================

There's no difference with nvidia between redirecting to file or not.

The POST values are 175 MHz GPU and 405 MHz RAM (same as nouveau console). I've
checked the nvidia dump I've made, it's set up to 100 MHz GPU and 199 MHz RAM,
but for some reason that's not the speed it's actually reported later (see
above, 175/391).

When I do a suspend to RAM then I get 22 MHz GPU consistently on console and X
with nouveau, independent of redirecting or not. I guess that the 22 MHz in X
after nvidia kexec is probably false and it's more like 175 MHz as on console
without redirection.

If I directly poke the PLL and read it back then it's not the same. It's always
1/8 of what was requested (actually +3). When I change it on nvidia it's the
same as what I write there. Also after nvidia kexec, on the nouveau console
it's matching. But not after a suspend to RAM or otherwise. The same 1/8 is
there in X when nouveau is running fast after kexec.

Any ideas what is causing this 1/8 speed limit sometimes? Or why it's different
if I redirect/not with nouveau?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1399753745.b31b1.5118
Date: Sat, 10 May 2014 20:29:05 +0000
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
   title="NEW --- - NV28M running at 1/8th GPU clock when using nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78544">78544</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NV28M running at 1/8th GPU clock when using nouveau
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
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
          <td>nv28m&#64;freemail.hu
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2011)
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
        <pre>See <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="show_bug.cgi?id=54700">https://bugs.freedesktop.org/show_bug.cgi?id=54700</a> some details. I've
opened this as the speed problem has nothing to do with the distortion, but
I've noticed it when debugging that problem. I've e-mailed two dumps for that
thread for this machine.

In short nouveau is slow normally, unless I insert the nvidia module in one
kernel and kexec into another kernel. Then nouveau is fast until I suspend to
RAM. After resume it's slow again. And I can't fix it ;)

Long version:

I've played a bit with nvclock and found something interesting. When using the
nvidia driver in X I get:

================================
-- General info --
Card:           nVidia Geforce 4 4000 GO
Architecture:   NV28 A2
PCI id:         0x286
NVPLL_COEFF=00010d01
m=1 n=13 p=1
GPU clock:      175.500 MHz
Bustype:        AGP

-- Memory info --
Amount:         32 MB
Type:           128 bit DDR
MPLL_COEFF=00001d02
m=2 n=29 p=0
Clock:          391.500 MHz

-- AGP info --
Status:         Enabled
Rate:           4X
AGP rates:      1X 2X 4X
Fast Writes:    Disabled
SBA:            Disabled

-- VideoBios information --
Version: 04.28.20.31
Signon message: NV28 P138 Mobile Reference VGA BIOS
================================

When I switch to console, then it's:

================================
-- General info --
Card:           nVidia Geforce 4 4000 GO
Architecture:   NV28 A2
PCI id:         0x286
NVPLL_COEFF=00040d01
m=1 n=13 p=4
GPU clock:      21.937 MHz
Bustype:        AGP
================================

When I do the same using nouveau in X (after nvidia kexec):

================================
-- General info --
Card:         nVidia Geforce 4 4000 GO
Architecture:     NV28 A2
PCI id:     0x286
NVPLL_COEFF=00040d01
m=1 n=13 p=4
GPU clock:     21.937 MHz
Bustype:     AGP

-- Memory info --
Amount:     32 MB
Type:         128 bit DDR
MPLL_COEFF=00000f01
m=1 n=15 p=0
Clock:         405.000 MHz

-- AGP info --
Status:     Enabled
Rate:         4X
AGP rates:     1X 2X 4X 
Fast Writes:     Enabled
SBA:         Enabled

-- VideoBios information --
Version: 04.28.20.31
Signon message: NV28 P138 Mobile Reference VGA BIOS
================================

Nouveau on console (after nvidia kexec):

================================
-- General info --
Card:           nVidia Geforce 4 4000 GO
Architecture:   NV28 A2
PCI id:         0x286
NVPLL_COEFF=00010d01
m=1 n=13 p=1
GPU clock:      175.500 MHz
Bustype:        AGP
================================

And what is interesting if I do a &quot;nvclock -i -d | cat&quot; on console then it's:

================================
-- General info --
Card:         nVidia Geforce 4 4000 GO
Architecture:     NV28 A2
PCI id:     0x286
NVPLL_COEFF=00040d01
m=1 n=13 p=4
GPU clock:     21.937 MHz
Bustype:     AGP
================================

There's no difference with nvidia between redirecting to file or not.

The POST values are 175 MHz GPU and 405 MHz RAM (same as nouveau console). I've
checked the nvidia dump I've made, it's set up to 100 MHz GPU and 199 MHz RAM,
but for some reason that's not the speed it's actually reported later (see
above, 175/391).

When I do a suspend to RAM then I get 22 MHz GPU consistently on console and X
with nouveau, independent of redirecting or not. I guess that the 22 MHz in X
after nvidia kexec is probably false and it's more like 175 MHz as on console
without redirection.

If I directly poke the PLL and read it back then it's not the same. It's always
1/8 of what was requested (actually +3). When I change it on nvidia it's the
same as what I write there. Also after nvidia kexec, on the nouveau console
it's matching. But not after a suspend to RAM or otherwise. The same 1/8 is
there in X when nouveau is running fast after kexec.

Any ideas what is causing this 1/8 speed limit sometimes? Or why it's different
if I redirect/not with nouveau?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1399753745.b31b1.5118--

--===============1821404582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1821404582==--
