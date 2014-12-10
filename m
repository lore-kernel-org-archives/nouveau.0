From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87179] New: [NVE7] Oops while reenabling Optimus
	dedicated card
Date: Wed, 10 Dec 2014 02:55:33 +0000
Message-ID: <bug-87179-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1163985251=="
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


--===============1163985251==
Content-Type: multipart/alternative; boundary="1418180133.D8Ad261.19329"; charset="UTF-8"


--1418180133.D8Ad261.19329
Date: Wed, 10 Dec 2014 02:55:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87179

            Bug ID: 87179
           Summary: [NVE7] Oops while reenabling Optimus dedicated card
           Product: xorg
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: tobias.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 110662
  --> https://bugs.freedesktop.org/attachment.cgi?id=110662&action=edit
kernel 3.18 oops

Sometimes while waking the dedicated card, the system oopses and gets
unresponsive (sometimes this hangs the entire graphics system). 
Steam triggers this very easily somehow...

These hangs plague me for a while now, but this is the first hang i could
capture in a whole!

Kernel: 3.18.0, occurred with kernels at least down to 3.16

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418180133.D8Ad261.19329
Date: Wed, 10 Dec 2014 02:55:33 +0000
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
   title="NEW - [NVE7] Oops while reenabling Optimus dedicated card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87179">87179</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE7] Oops while reenabling Optimus dedicated card
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
          <td>tobias.klausmann&#64;mni.thm.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=110662" name="attach_110662" title="kernel 3.18 oops">attachment 110662</a> <a href="attachment.cgi?id=110662&amp;action=edit" title="kernel 3.18 oops">[details]</a></span>
kernel 3.18 oops

Sometimes while waking the dedicated card, the system oopses and gets
unresponsive (sometimes this hangs the entire graphics system). 
Steam triggers this very easily somehow...

These hangs plague me for a while now, but this is the first hang i could
capture in a whole!

Kernel: 3.18.0, occurred with kernels at least down to 3.16</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418180133.D8Ad261.19329--

--===============1163985251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1163985251==--
