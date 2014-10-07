From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84741] New: (EE) [drm] KMS not enabled
Date: Tue, 07 Oct 2014 09:50:10 +0000
Message-ID: <bug-84741-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1272361798=="
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


--===============1272361798==
Content-Type: multipart/alternative; boundary="1412675410.25dE1.19899"; charset="UTF-8"


--1412675410.25dE1.19899
Date: Tue, 7 Oct 2014 09:50:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84741

            Bug ID: 84741
           Summary: (EE) [drm] KMS not enabled
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: germano.massullo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 107464
  --> https://bugs.freedesktop.org/attachment.cgi?id=107464&action=edit
system logs

Description of problem:
Kernel regression: the system uses VESA due the following error in 
/var/log/Xorg.0.log
 (EE) [drm] KMS not enabled 

with older kernel 3.11.10-301 the bug did not happen.
I also tried booting the system with option "nouveau.config=VBIOS=PRAMIN" but
it did not solve the problem.

===Kernel Version===
kernel-3.16.2-200.fc20.x86_64

===Fedora bugreport===
https://bugzilla.redhat.com/show_bug.cgi?id=1141898

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1412675410.25dE1.19899
Date: Tue, 7 Oct 2014 09:50:10 +0000
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
   title="NEW - (EE) [drm] KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84741">84741</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>(EE) [drm] KMS not enabled
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
          <td>Other
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
          <td>germano.massullo&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=107464" name="attach_107464" title="system logs">attachment 107464</a> <a href="attachment.cgi?id=107464&amp;action=edit" title="system logs">[details]</a></span>
system logs

Description of problem:
Kernel regression: the system uses VESA due the following error in 
/var/log/Xorg.0.log
 (EE) [drm] KMS not enabled 

with older kernel 3.11.10-301 the bug did not happen.
I also tried booting the system with option &quot;nouveau.config=VBIOS=PRAMIN&quot; but
it did not solve the problem.

===Kernel Version===
kernel-3.16.2-200.fc20.x86_64

===Fedora bugreport===
<a href="https://bugzilla.redhat.com/show_bug.cgi?id=1141898">https://bugzilla.redhat.com/show_bug.cgi?id=1141898</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1412675410.25dE1.19899--

--===============1272361798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1272361798==--
