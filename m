From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75813] New: [NV40] X hangs, system unresponsive
Date: Wed, 05 Mar 2014 20:10:42 +0000
Message-ID: <bug-75813-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1045733989=="
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


--===============1045733989==
Content-Type: multipart/alternative; boundary="1394050242.a3eDC401.17911"; charset="us-ascii"


--1394050242.a3eDC401.17911
Date: Wed, 5 Mar 2014 20:10:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75813

          Priority: medium
            Bug ID: 75813
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV40] X hangs, system unresponsive
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: marco-OrqDK/dsKCwdnm+yROfE0A@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 7.7 (2011)
         Component: Driver/nouveau
           Product: xorg

Once every day or so my system practically hangs (gets extremely unresponsive;
X unusable; only SysRq magic working) while using Xorg with the nouveau driver
(version 1.0.10).

I am running Debian GNU/Linux testing (jessie) with

$ uname -r
3.13-1-amd64
$ lspci | grep VGA
05:00.0 VGA compatible controller: NVIDIA Corporation NV40 [GeForce 6800
GT/GTO/Ultra] (rev a2)

This problem did not occur when I ran Debian stable (with nouveau).

When the system (practically) hangs, I get messages like this:

... GPU lockup - switching to software fbcon
nouveau E [Xorg] failed to idle channel 0xcccc0000 [ ...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394050242.a3eDC401.17911
Date: Wed, 5 Mar 2014 20:10:42 +0000
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
   title="NEW --- - [NV40] X hangs, system unresponsive"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75813">75813</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV40] X hangs, system unresponsive
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
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
          <td>marco&#64;hulten.org
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
        <pre>Once every day or so my system practically hangs (gets extremely unresponsive;
X unusable; only SysRq magic working) while using Xorg with the nouveau driver
(version 1.0.10).

I am running Debian GNU/Linux testing (jessie) with

$ uname -r
3.13-1-amd64
$ lspci | grep VGA
05:00.0 VGA compatible controller: NVIDIA Corporation NV40 [GeForce 6800
GT/GTO/Ultra] (rev a2)

This problem did not occur when I ran Debian stable (with nouveau).

When the system (practically) hangs, I get messages like this:

... GPU lockup - switching to software fbcon
nouveau E [Xorg] failed to idle channel 0xcccc0000 [ ...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394050242.a3eDC401.17911--

--===============1045733989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1045733989==--
