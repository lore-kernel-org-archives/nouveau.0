From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85605] New: gk106: GPU lockup on resume (3.16)
Date: Wed, 29 Oct 2014 15:58:04 +0000
Message-ID: <bug-85605-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1061598003=="
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


--===============1061598003==
Content-Type: multipart/alternative; boundary="1414598284.E11Fc071.2855"; charset="UTF-8"


--1414598284.E11Fc071.2855
Date: Wed, 29 Oct 2014 15:58:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85605

            Bug ID: 85605
           Summary: gk106: GPU lockup on resume (3.16)
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: freedesktop-aVMt7ygKTj2t/hvpvFFPbQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 108632
  --> https://bugs.freedesktop.org/attachment.cgi?id=108632&action=edit
journalctl -b (via ssh) with excerpts from suspend and resume

Dell M4800 with QHD+ display -- NVIDIA Corporation GK106GLM [Quadro K2100M]
(rev a1), 3.16.6-gentoo.

systemctl suspend works cleanly and quickly. Resume (power button), not so
much:

   09:33:43 kernel: nouveau E[     DRM] GPU lockup - switching to software
fbcon
   09:33:58 kernel: nouveau E[ X[4664]] failed to idle channel 0xcccc0000
[X[4664]]

...lots more. See attachment. X screen flashes briefly but is unusable and
corrupt (color bars, blocks offset/shifted, no cursor anyway).

This is on a good boot (ref bug 85495).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414598284.E11Fc071.2855
Date: Wed, 29 Oct 2014 15:58:04 +0000
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
   title="NEW - gk106: GPU lockup on resume (3.16)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85605">85605</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>gk106: GPU lockup on resume (3.16)
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
          <td>freedesktop&#64;edsantiago.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=108632" name="attach_108632" title="journalctl -b (via ssh) with excerpts from suspend and resume">attachment 108632</a> <a href="attachment.cgi?id=108632&amp;action=edit" title="journalctl -b (via ssh) with excerpts from suspend and resume">[details]</a></span>
journalctl -b (via ssh) with excerpts from suspend and resume

Dell M4800 with QHD+ display -- NVIDIA Corporation GK106GLM [Quadro K2100M]
(rev a1), 3.16.6-gentoo.

systemctl suspend works cleanly and quickly. Resume (power button), not so
much:

   09:33:43 kernel: nouveau E[     DRM] GPU lockup - switching to software
fbcon
   09:33:58 kernel: nouveau E[ X[4664]] failed to idle channel 0xcccc0000
[X[4664]]

...lots more. See attachment. X screen flashes briefly but is unusable and
corrupt (color bars, blocks offset/shifted, no cursor anyway).

This is on a good boot (ref <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau: xft fonts not rendered on Dell M4800 (QHD+)"
   href="show_bug.cgi?id=85495">bug 85495</a>).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414598284.E11Fc071.2855--

--===============1061598003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1061598003==--
