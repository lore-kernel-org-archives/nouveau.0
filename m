From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85444] New: [NV46] Heavy corruption, no hardfreeze,
 back to console and libexa.so segfault
Date: Sat, 25 Oct 2014 14:50:54 +0000
Message-ID: <bug-85444-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2113704394=="
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


--===============2113704394==
Content-Type: multipart/alternative; boundary="1414248655.Cc031.7183"; charset="UTF-8"


--1414248655.Cc031.7183
Date: Sat, 25 Oct 2014 14:50:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85444

            Bug ID: 85444
           Summary: [NV46] Heavy corruption, no hardfreeze, back to
                    console and libexa.so segfault
           Product: xorg
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jesus.guerrero.botella-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 108396
  --> https://bugs.freedesktop.org/attachment.cgi?id=108396&action=edit
Screenshot

Hello.

I am trying to use the nouveau driver in an Aspire 9420, which is shipped with
a go7300 nvidia card. The lspci line is this:

01:00.0 VGA compatible controller: NVIDIA Corporation G72M [Quadro NVS
110M/GeForce Go 7300] (rev a1)

I am using the following software:
* gentoo x86_64
* kernel 3.17.1 from kernel.org, no patches
* no fb driver enabled, other than what the nouveau drm stack enables
automatically as deps
* no compositor, no xorg.conf
* libdrm, xf86-video-nouveau and mesa from git as of today (oct 25, 2014)
* xorg-server 1.16.1

When I boot my machine I can see the fb coming up, and the mode is set ok (with
tiny characters and such). When startx takes into scene, then the screen
becomes a pile of garbage. The laptop is not hard-frozen however. Most times,
after like a minute or two I am taken back to the console (not always though).
In any case, the computer is responsive. I can control+alt+del it even when the
console remains garbled. Because of this, I was able to easily save the X log
and the dmesg output, which I attach along with a photo of the corrupted
screen.

I have tried rebuilding everything many times, in the hope that any ABI issues
went away, but no change.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414248655.Cc031.7183
Date: Sat, 25 Oct 2014 14:50:55 +0000
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
   title="NEW - [NV46] Heavy corruption, no hardfreeze, back to console and libexa.so segfault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85444">85444</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV46] Heavy corruption, no hardfreeze, back to console and libexa.so segfault
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
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
          <td>jesus.guerrero.botella&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=108396" name="attach_108396" title="Screenshot">attachment 108396</a> <a href="attachment.cgi?id=108396&amp;action=edit" title="Screenshot">[details]</a></span>
Screenshot

Hello.

I am trying to use the nouveau driver in an Aspire 9420, which is shipped with
a go7300 nvidia card. The lspci line is this:

01:00.0 VGA compatible controller: NVIDIA Corporation G72M [Quadro NVS
110M/GeForce Go 7300] (rev a1)

I am using the following software:
* gentoo x86_64
* kernel 3.17.1 from kernel.org, no patches
* no fb driver enabled, other than what the nouveau drm stack enables
automatically as deps
* no compositor, no xorg.conf
* libdrm, xf86-video-nouveau and mesa from git as of today (oct 25, 2014)
* xorg-server 1.16.1

When I boot my machine I can see the fb coming up, and the mode is set ok (with
tiny characters and such). When startx takes into scene, then the screen
becomes a pile of garbage. The laptop is not hard-frozen however. Most times,
after like a minute or two I am taken back to the console (not always though).
In any case, the computer is responsive. I can control+alt+del it even when the
console remains garbled. Because of this, I was able to easily save the X log
and the dmesg output, which I attach along with a photo of the corrupted
screen.

I have tried rebuilding everything many times, in the hope that any ABI issues
went away, but no change.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414248655.Cc031.7183--

--===============2113704394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2113704394==--
