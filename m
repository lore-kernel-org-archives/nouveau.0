From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85160] New: [NV94] INVALID_STATE error,
 X fails to start on GeForce 9600 GT with dual monitors,
 kernels 3.18.0-0.rc0.git8.2.fc22.1 onwards
Date: Fri, 17 Oct 2014 23:13:05 +0000
Message-ID: <bug-85160-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0002545519=="
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


--===============0002545519==
Content-Type: multipart/alternative; boundary="1413587585.aE76C01.3490"; charset="UTF-8"


--1413587585.aE76C01.3490
Date: Fri, 17 Oct 2014 23:13:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85160

            Bug ID: 85160
           Summary: [NV94] INVALID_STATE error, X fails to start on
                    GeForce 9600 GT with dual monitors, kernels
                    3.18.0-0.rc0.git8.2.fc22.1 onwards
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: adamw-cfjF3rc+CpsYNetmKr+vY16hYfS7NtTn@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Running Fedora 21 with kernels from
https://alt.fedoraproject.org/pub/alt/rawhide-kernel-nodebug/ (tracking 3.18
development).

I have kernel-3.18.0-0.rc0.git1.2.fc22.1.x86_64 ,
kernel-3.18.0-0.rc0.git8.2.fc22.1.x86_64 and
kernel-3.18.0-0.rc0.git9.2.fc22.1.x86_64 installed .
kernel-3.18.0-0.rc0.git1.2.fc22.1.x86_64 boots fine on my system, the other two
do not.

On git1 I get boot framebuffer output on both heads, then X starts properly. On
git8 and git9, I get boot framebuffer only on one head, then both screens go
into power saving mode when X starts, or one keeps cycling power-saving /
non-power-saving but never comes up.

The logs have a bunch of stuff, but it seems to kick off with an error:

nouveau E[   PDISP][0000:01:00.0] INVALID_STATE [UNK0B] chid 1 mthd 0x0080 data
0x00000000

I'll attach drm.debug=15 logs. Hardware is:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G94 [GeForce 9600
GT] [10de:0622] (rev a1)

Ben Skeggs has one of the same cards, somewhere in his pile. May only be
reproducible with dual displays, I didn't try with just one yet.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1413587585.aE76C01.3490
Date: Fri, 17 Oct 2014 23:13:05 +0000
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
   title="NEW - [NV94] INVALID_STATE error, X fails to start on GeForce 9600 GT with dual monitors, kernels 3.18.0-0.rc0.git8.2.fc22.1 onwards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85160">85160</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV94] INVALID_STATE error, X fails to start on GeForce 9600 GT with dual monitors, kernels 3.18.0-0.rc0.git8.2.fc22.1 onwards
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
          <td>adamw&#64;happyassassin.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Running Fedora 21 with kernels from
<a href="https://alt.fedoraproject.org/pub/alt/rawhide-kernel-nodebug/">https://alt.fedoraproject.org/pub/alt/rawhide-kernel-nodebug/</a> (tracking 3.18
development).

I have kernel-3.18.0-0.rc0.git1.2.fc22.1.x86_64 ,
kernel-3.18.0-0.rc0.git8.2.fc22.1.x86_64 and
kernel-3.18.0-0.rc0.git9.2.fc22.1.x86_64 installed .
kernel-3.18.0-0.rc0.git1.2.fc22.1.x86_64 boots fine on my system, the other two
do not.

On git1 I get boot framebuffer output on both heads, then X starts properly. On
git8 and git9, I get boot framebuffer only on one head, then both screens go
into power saving mode when X starts, or one keeps cycling power-saving /
non-power-saving but never comes up.

The logs have a bunch of stuff, but it seems to kick off with an error:

nouveau E[   PDISP][0000:01:00.0] INVALID_STATE [UNK0B] chid 1 mthd 0x0080 data
0x00000000

I'll attach drm.debug=15 logs. Hardware is:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G94 [GeForce 9600
GT] [10de:0622] (rev a1)

Ben Skeggs has one of the same cards, somewhere in his pile. May only be
reproducible with dual displays, I didn't try with just one yet.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1413587585.aE76C01.3490--

--===============0002545519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0002545519==--
