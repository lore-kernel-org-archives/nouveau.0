From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60516] New: nouveau driver graphics corrupted in 3.7
 kernel for nvidia FX5200 [NV34] hardware
Date: Fri, 08 Feb 2013 20:50:11 +0000
Message-ID: <bug-60516-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0773006504=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0773006504==
Content-Type: multipart/alternative; boundary="1360356611.8eeDe1.30902"; charset="us-ascii"


--1360356611.8eeDe1.30902
Date: Fri, 8 Feb 2013 20:50:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60516

          Priority: medium
            Bug ID: 60516
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nouveau driver graphics corrupted in 3.7 kernel for
                    nvidia FX5200 [NV34] hardware
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: lee_matheson-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

The 3.7 kernel nouveau driver provides a corrupted display when booting to a PC
with an older nvidia FX5200 graphic card.  This was tested with:
* openSUSE-12.3 32-bit beta1 KDE liveCD and 3.7.1 kernel
* openSUSE-12.3 32-bit RC1 KDE liveCD and 3.7.6-1.2 kernel
* openSUSE-12.2 with the 32-bit Tumbleweed 3.7.2-18 kernel (on an LXDE desktop)
* Porteus-1.2 (release candidate version) which has the 3.7.5 kernel (and is
slackware based).
* Bodhi-2.2.0-32 which has the 3.7.0-7 kernel (and is Ubuntu based)

I rolled back the openSUSE-12.2 with the 32-bit Tumbleweed 3.7.2-18 kernel
(which I noted had the graphics corruption) to a 3.4.6 kernel (with nouveau)
and it works fine on this same PC with both a KDE and an LXDE desktop.  I
tested a Knoppix-7.0.5 with its 3.6.11 kernel which booted fine to superb
graphics with the nouveau driver, to a nice 1680x1050 resolution on this old
FX5200 (NV34) hardware (with special desktop effects working nicely).  

Ergo I believe the 3.7 kernel is at fault.

I have raised a bug report on openSUSE here:
https://bugzilla.novell.com/show_bug.cgi?id=800686 but I believe the problem to
be upstream with the nouveau driver. 

The graphics look like this:  http://www.imagebam.com/image/aaa1db233074551 and
that is pretty much the same appearance across all GNU/Linux distribution
versions that I have tested with the 3.7.x kernel and the nouveau driver.

dmesg of openSUSE-12.3 B1 w/3.7.1 kernel :
https://bugzilla.novell.com/attachment.cgi?id=522124

xorg.0.log of openSUSE-12.3 B1 w/3.7.1 kernel:
https://bugzilla.novell.com/attachment.cgi?id=522125

/var/log/messages of openSUSE-12.3 B1 w/3.7.1 kernel:
https://bugzilla.novell.com/attachment.cgi?id=522126

xsesson errors of openSUSE-12.3 B1 w/3.7.1 kernel:
https://bugzilla.novell.com/attachment.cgi?id=522127

I looked at the image of the corruption (with the 3.7 kernel) on NVIDIA GeForce
8400M G graphics card in this bug report
https://bugs.freedesktop.org/show_bug.cgi?id=58378 and it looks difference,
hence I believe that 'may' be a different problem.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360356611.8eeDe1.30902
Date: Fri, 8 Feb 2013 20:50:11 +0000
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
   title="NEW --- - nouveau driver graphics corrupted in 3.7 kernel for nvidia FX5200 [NV34] hardware"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60516">60516</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau driver graphics corrupted in 3.7 kernel for nvidia FX5200 [NV34] hardware
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
          <td>lee_matheson&#64;hotmail.com
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
        <pre>The 3.7 kernel nouveau driver provides a corrupted display when booting to a PC
with an older nvidia FX5200 graphic card.  This was tested with:
* openSUSE-12.3 32-bit beta1 KDE liveCD and 3.7.1 kernel
* openSUSE-12.3 32-bit RC1 KDE liveCD and 3.7.6-1.2 kernel
* openSUSE-12.2 with the 32-bit Tumbleweed 3.7.2-18 kernel (on an LXDE desktop)
* Porteus-1.2 (release candidate version) which has the 3.7.5 kernel (and is
slackware based).
* Bodhi-2.2.0-32 which has the 3.7.0-7 kernel (and is Ubuntu based)

I rolled back the openSUSE-12.2 with the 32-bit Tumbleweed 3.7.2-18 kernel
(which I noted had the graphics corruption) to a 3.4.6 kernel (with nouveau)
and it works fine on this same PC with both a KDE and an LXDE desktop.  I
tested a Knoppix-7.0.5 with its 3.6.11 kernel which booted fine to superb
graphics with the nouveau driver, to a nice 1680x1050 resolution on this old
FX5200 (NV34) hardware (with special desktop effects working nicely).  

Ergo I believe the 3.7 kernel is at fault.

I have raised a bug report on openSUSE here:
<a href="https://bugzilla.novell.com/show_bug.cgi?id=800686">https://bugzilla.novell.com/show_bug.cgi?id=800686</a> but I believe the problem to
be upstream with the nouveau driver. 

The graphics look like this:  <a href="http://www.imagebam.com/image/aaa1db233074551">http://www.imagebam.com/image/aaa1db233074551</a> and
that is pretty much the same appearance across all GNU/Linux distribution
versions that I have tested with the 3.7.x kernel and the nouveau driver.

dmesg of openSUSE-12.3 B1 w/3.7.1 kernel :
<a href="https://bugzilla.novell.com/attachment.cgi?id=522124">https://bugzilla.novell.com/attachment.cgi?id=522124</a>

xorg.0.log of openSUSE-12.3 B1 w/3.7.1 kernel:
<a href="https://bugzilla.novell.com/attachment.cgi?id=522125">https://bugzilla.novell.com/attachment.cgi?id=522125</a>

/var/log/messages of openSUSE-12.3 B1 w/3.7.1 kernel:
<a href="https://bugzilla.novell.com/attachment.cgi?id=522126">https://bugzilla.novell.com/attachment.cgi?id=522126</a>

xsesson errors of openSUSE-12.3 B1 w/3.7.1 kernel:
<a href="https://bugzilla.novell.com/attachment.cgi?id=522127">https://bugzilla.novell.com/attachment.cgi?id=522127</a>

I looked at the image of the corruption (with the 3.7 kernel) on NVIDIA GeForce
8400M G graphics card in this bug report
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="show_bug.cgi?id=58378">https://bugs.freedesktop.org/show_bug.cgi?id=58378</a> and it looks difference,
hence I believe that 'may' be a different problem.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360356611.8eeDe1.30902--

--===============0773006504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0773006504==--
