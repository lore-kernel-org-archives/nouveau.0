From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81527] New: nouveau crashes on video playback
Date: Sat, 19 Jul 2014 09:57:02 +0000
Message-ID: <bug-81527-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0994140788=="
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


--===============0994140788==
Content-Type: multipart/alternative; boundary="1405763822.DAc1EBc41.3725"; charset="us-ascii"


--1405763822.DAc1EBc41.3725
Date: Sat, 19 Jul 2014 09:57:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81527

          Priority: medium
            Bug ID: 81527
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nouveau crashes on video playback
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: dw.dw.dw-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 103096
  --> https://bugs.freedesktop.org/attachment.cgi?id=103096&action=edit
syslog filtered for nouveau and Xorg

I'm running Linux Mint 17 MATE

Nouveau often freezes my desktop when i start to play videos (no matter what
player I use).

I used Linux Mint 13 before, with the nvidia driver nvidia-173, and everything
worked fine. Now, nvidia-331 crashes very fast (gui login prompt), nvidia-304
medium-fast and nvidia-173 also crashes sometimes (as often as nouveau).

$ lspci -nn | grep VGA
02:00.0 VGA compatible controller [0300]: NVIDIA Corporation C77 [GeForce 8200]
[10de:0849] (rev a2)

$ uname -a
Linux dw 3.13.0-24-generic #47-Ubuntu SMP Fri May 2 23:30:00 UTC 2014 x86_64
x86_64 x86_64 GNU/Linux

Please find attached the syslog with filter to "nouveau" and "Xorg".
It contains the error two times. You can easily find them by the time stamp.
(11:22, 11:24).
I usually use standby/hibernate without problems on wakeup.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1405763822.DAc1EBc41.3725
Date: Sat, 19 Jul 2014 09:57:02 +0000
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
   title="NEW --- - nouveau crashes on video playback"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81527">81527</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau crashes on video playback
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
          <td>dw.dw.dw&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=103096" name="attach_103096" title="syslog filtered for nouveau and Xorg">attachment 103096</a> <a href="attachment.cgi?id=103096&amp;action=edit" title="syslog filtered for nouveau and Xorg">[details]</a></span>
syslog filtered for nouveau and Xorg

I'm running Linux Mint 17 MATE

Nouveau often freezes my desktop when i start to play videos (no matter what
player I use).

I used Linux Mint 13 before, with the nvidia driver nvidia-173, and everything
worked fine. Now, nvidia-331 crashes very fast (gui login prompt), nvidia-304
medium-fast and nvidia-173 also crashes sometimes (as often as nouveau).

$ lspci -nn | grep VGA
02:00.0 VGA compatible controller [0300]: NVIDIA Corporation C77 [GeForce 8200]
[10de:0849] (rev a2)

$ uname -a
Linux dw 3.13.0-24-generic #47-Ubuntu SMP Fri May 2 23:30:00 UTC 2014 x86_64
x86_64 x86_64 GNU/Linux

Please find attached the syslog with filter to &quot;nouveau&quot; and &quot;Xorg&quot;.
It contains the error two times. You can easily find them by the time stamp.
(11:22, 11:24).
I usually use standby/hibernate without problems on wakeup.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1405763822.DAc1EBc41.3725--

--===============0994140788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0994140788==--
