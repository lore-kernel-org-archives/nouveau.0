From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56615] New: Unable to start X on ThinkPad T420s
	laptop
Date: Wed, 31 Oct 2012 13:36:50 +0000
Message-ID: <bug-56615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0608064375=="
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


--===============0608064375==
Content-Type: multipart/alternative; boundary="1351690610.BCA01.7344"; charset="us-ascii"


--1351690610.BCA01.7344
Date: Wed, 31 Oct 2012 13:36:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56615

          Priority: medium
            Bug ID: 56615
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Unable to start X on ThinkPad T420s laptop
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: mark.cave-ayland-r2/yp8inhXLQXOPxS62xeg@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 69351
  --> https://bugs.freedesktop.org/attachment.cgi?id=69351&action=edit
dmesg

Hi all,

I am trying to use the discrete graphics (nVidia) graphics card option on my
T420s in order to use the DisplayPort connector, and am currently unable to
start X under Debian Wheezy.

Under advice from IRC, I've upgraded Wheezy with the following components:

Linux kernel 3.7-rc3 from kernel.org
libdrm-2.4.39
xf86-video-nouveau git (commit 8c3e1623b0be15f8cc590d893bfd19be87bd079a)

However I am still unable to start with the new driver in place. When starting
X, the fbconsole remains visible on screen and then "hangs" for nearly a minute
before the login TTY appears again. There are some messages emitted in Xorg.log
and dmesg which are attached to this bug report, along with the output of
lspci.


Many thanks,

Mark.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351690610.BCA01.7344
Date: Wed, 31 Oct 2012 13:36:50 +0000
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
   title="NEW --- - Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615">56615</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Unable to start X on ThinkPad T420s laptop
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
          <td>mark.cave-ayland&#64;ilande.co.uk
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
          <td>git
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
        <pre>Created <span class=""><a href="attachment.cgi?id=69351" name="attach_69351" title="dmesg">attachment 69351</a> <a href="attachment.cgi?id=69351&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

Hi all,

I am trying to use the discrete graphics (nVidia) graphics card option on my
T420s in order to use the DisplayPort connector, and am currently unable to
start X under Debian Wheezy.

Under advice from IRC, I've upgraded Wheezy with the following components:

Linux kernel 3.7-rc3 from kernel.org
libdrm-2.4.39
xf86-video-nouveau git (commit 8c3e1623b0be15f8cc590d893bfd19be87bd079a)

However I am still unable to start with the new driver in place. When starting
X, the fbconsole remains visible on screen and then &quot;hangs&quot; for nearly a minute
before the login TTY appears again. There are some messages emitted in Xorg.log
and dmesg which are attached to this bug report, along with the output of
lspci.


Many thanks,

Mark.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351690610.BCA01.7344--

--===============0608064375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0608064375==--
