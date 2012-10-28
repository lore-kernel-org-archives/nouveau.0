From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56502] New: regression: gnome 3 & cinnamon desktop
 moves up and down in virtualbox
Date: Sun, 28 Oct 2012 18:18:16 +0000
Message-ID: <bug-56502-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1608904490=="
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


--===============1608904490==
Content-Type: multipart/alternative; boundary="1351448296.20B41.12711"; charset="us-ascii"


--1351448296.20B41.12711
Date: Sun, 28 Oct 2012 18:18:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56502

          Priority: medium
            Bug ID: 56502
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: regression: gnome 3 & cinnamon desktop moves up and
                    down in virtualbox
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: thepouar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 69199
  --> https://bugs.freedesktop.org/attachment.cgi?id=69199&action=edit
kernel log

when using hardware accleeration in virtualbox, the gnome 3 desktop and
cinnamon the whole screen moves downward then back to normal constantly for
some reason, this only happens on VirtualBox and not the host, and only happens
with the latest nouveau driver, I'm using NVIDIA Corporation GF114 [GeForce GTX
560 Ti], and XFCE4 on my host

A screenshot of the desktop when it moves downward
http://lists.freedesktop.org/archives/nouveau/attachments/20121027/96eabc5f/attachment-0001.jpg

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351448296.20B41.12711
Date: Sun, 28 Oct 2012 18:18:16 +0000
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
   title="NEW --- - regression: gnome 3 &amp; cinnamon desktop moves up and down in virtualbox"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56502">56502</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>regression: gnome 3 &amp; cinnamon desktop moves up and down in virtualbox
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
          <td>thepouar&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=69199" name="attach_69199" title="kernel log">attachment 69199</a> <a href="attachment.cgi?id=69199&amp;action=edit" title="kernel log">[details]</a></span>
kernel log

when using hardware accleeration in virtualbox, the gnome 3 desktop and
cinnamon the whole screen moves downward then back to normal constantly for
some reason, this only happens on VirtualBox and not the host, and only happens
with the latest nouveau driver, I'm using NVIDIA Corporation GF114 [GeForce GTX
560 Ti], and XFCE4 on my host

A screenshot of the desktop when it moves downward
<a href="http://lists.freedesktop.org/archives/nouveau/attachments/20121027/96eabc5f/attachment-0001.jpg">http://lists.freedesktop.org/archives/nouveau/attachments/20121027/96eabc5f/attachment-0001.jpg</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351448296.20B41.12711--

--===============1608904490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1608904490==--
