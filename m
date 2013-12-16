From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72760] New: gdm hangs, sometimes everything else also
Date: Mon, 16 Dec 2013 15:46:17 +0000
Message-ID: <bug-72760-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0192711569=="
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


--===============0192711569==
Content-Type: multipart/alternative; boundary="1387208777.80C51.21801"; charset="us-ascii"


--1387208777.80C51.21801
Date: Mon, 16 Dec 2013 15:46:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72760

          Priority: medium
            Bug ID: 72760
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: gdm hangs, sometimes everything else also
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: jklawiter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 90840
  --> https://bugs.freedesktop.org/attachment.cgi?id=90840&action=edit
dmesg

Since few weeks i have strange problems with my computer. In fact maybe i have
them more than few weeks but i'm looking and trying to solve it just 2-3 weeks.

Computer (gdm and over part) is hanging from time to time. I cannot reproduce
it always but most times i need just open few windows and wait. Same time
computer is working, I can connect to it via ssh and everything is working
normal except i cannot poweroff computer because it hangs.

What i find few days ago was broken capacitors on my GfX card, i replaced them
but it did not help.

Sometimes (not very often) it ends with Kernel Panic.

i'm using:
05:00.0 VGA compatible controller: NVIDIA Corporation NV43 [GeForce 6600] (rev
a2)

kernel: 3.12.5-gentoo
xf86-video-nouveau-1.0.10
libdrm-2.4.50
mesa-9.2.4
xorg-server-1.14.3

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387208777.80C51.21801
Date: Mon, 16 Dec 2013 15:46:17 +0000
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
   title="NEW --- - gdm hangs, sometimes everything else also"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72760">72760</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>gdm hangs, sometimes everything else also
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
          <td>jklawiter&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=90840" name="attach_90840" title="dmesg">attachment 90840</a> <a href="attachment.cgi?id=90840&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

Since few weeks i have strange problems with my computer. In fact maybe i have
them more than few weeks but i'm looking and trying to solve it just 2-3 weeks.

Computer (gdm and over part) is hanging from time to time. I cannot reproduce
it always but most times i need just open few windows and wait. Same time
computer is working, I can connect to it via ssh and everything is working
normal except i cannot poweroff computer because it hangs.

What i find few days ago was broken capacitors on my GfX card, i replaced them
but it did not help.

Sometimes (not very often) it ends with Kernel Panic.

i'm using:
05:00.0 VGA compatible controller: NVIDIA Corporation NV43 [GeForce 6600] (rev
a2)

kernel: 3.12.5-gentoo
xf86-video-nouveau-1.0.10
libdrm-2.4.50
mesa-9.2.4
xorg-server-1.14.3</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387208777.80C51.21801--

--===============0192711569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0192711569==--
