From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74903] New: TV Load not detected in X
Date: Wed, 12 Feb 2014 20:15:52 +0000
Message-ID: <bug-74903-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0480466530=="
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


--===============0480466530==
Content-Type: multipart/alternative; boundary="1392236152.F34f0bdE1.15421"; charset="us-ascii"


--1392236152.F34f0bdE1.15421
Date: Wed, 12 Feb 2014 20:15:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74903

          Priority: medium
            Bug ID: 74903
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: TV Load not detected in X
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: alexandre.nunes-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 93957
  --> https://bugs.freedesktop.org/attachment.cgi?id=93957&action=edit
Xorg.0.log

I have an ancient computer with a FX 5200 card which is played to an old TV via
composite output. It has been working for ages, until I upgraded the system
(debian) and now when I start X, the tv image goes off.

This setup is using KMS, and IIRC newer kernels had the same problem on module
load. I downgraded the kernel to 3.11.2 and now the framebuffer is working 
fine again (with at least 3.11.6 and newer kernels it's a no-go). But when
starting X, the image is gone and the log tells:

[   164.729] (==) NOUVEAU(0): Swap limit set to 2 [Max allowed 2]
[   164.783] (II) NOUVEAU(0): Output VGA-1 has no monitor section
[   164.843] (II) NOUVEAU(0): Output DVI-I-1 has no monitor section
[   164.896] (II) NOUVEAU(0): Output TV-1 has no monitor section
[   164.950] (II) NOUVEAU(0): EDID for output VGA-1
[   165.003] (II) NOUVEAU(0): EDID for output DVI-I-1
[   165.056] (II) NOUVEAU(0): EDID for output TV-1
[   165.056] (II) NOUVEAU(0): Output VGA-1 disconnected
[   165.056] (II) NOUVEAU(0): Output DVI-I-1 disconnected
[   165.056] (II) NOUVEAU(0): Output TV-1 disconnected
[   165.056] (WW) NOUVEAU(0): No outputs definitely connected, trying again...
[   165.056] (II) NOUVEAU(0): Output VGA-1 disconnected
[   165.056] (II) NOUVEAU(0): Output DVI-I-1 disconnected
[   165.056] (II) NOUVEAU(0): Output TV-1 disconnected
[   165.057] (WW) NOUVEAU(0): Unable to find connected outputs - setting
1024x768 initial framebuffer

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392236152.F34f0bdE1.15421
Date: Wed, 12 Feb 2014 20:15:52 +0000
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
   title="NEW --- - TV Load not detected in X"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74903">74903</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>TV Load not detected in X
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
          <td>alexandre.nunes&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=93957" name="attach_93957" title="Xorg.0.log">attachment 93957</a> <a href="attachment.cgi?id=93957&amp;action=edit" title="Xorg.0.log">[details]</a></span>
Xorg.0.log

I have an ancient computer with a FX 5200 card which is played to an old TV via
composite output. It has been working for ages, until I upgraded the system
(debian) and now when I start X, the tv image goes off.

This setup is using KMS, and IIRC newer kernels had the same problem on module
load. I downgraded the kernel to 3.11.2 and now the framebuffer is working 
fine again (with at least 3.11.6 and newer kernels it's a no-go). But when
starting X, the image is gone and the log tells:

[   164.729] (==) NOUVEAU(0): Swap limit set to 2 [Max allowed 2]
[   164.783] (II) NOUVEAU(0): Output VGA-1 has no monitor section
[   164.843] (II) NOUVEAU(0): Output DVI-I-1 has no monitor section
[   164.896] (II) NOUVEAU(0): Output TV-1 has no monitor section
[   164.950] (II) NOUVEAU(0): EDID for output VGA-1
[   165.003] (II) NOUVEAU(0): EDID for output DVI-I-1
[   165.056] (II) NOUVEAU(0): EDID for output TV-1
[   165.056] (II) NOUVEAU(0): Output VGA-1 disconnected
[   165.056] (II) NOUVEAU(0): Output DVI-I-1 disconnected
[   165.056] (II) NOUVEAU(0): Output TV-1 disconnected
[   165.056] (WW) NOUVEAU(0): No outputs definitely connected, trying again...
[   165.056] (II) NOUVEAU(0): Output VGA-1 disconnected
[   165.056] (II) NOUVEAU(0): Output DVI-I-1 disconnected
[   165.056] (II) NOUVEAU(0): Output TV-1 disconnected
[   165.057] (WW) NOUVEAU(0): Unable to find connected outputs - setting
1024x768 initial framebuffer</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392236152.F34f0bdE1.15421--

--===============0480466530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0480466530==--
