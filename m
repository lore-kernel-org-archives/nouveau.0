From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94949] New: Possible memory leak when
	hibernating/resuming
Date: Fri, 15 Apr 2016 12:44:44 +0000
Message-ID: <bug-94949-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1946274966=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1946274966==
Content-Type: multipart/alternative; boundary="14607242842.Fa63.2686";
 charset="UTF-8"


--14607242842.Fa63.2686
Date: Fri, 15 Apr 2016 12:44:44 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94949

            Bug ID: 94949
           Summary: Possible memory leak when hibernating/resuming
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: me-rYJ0iO+mrgIiq3RsQ1AnAw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I tried nouveau on a 630GT GF108 card (a fermi card) and linux 4.5.
Every time I hibernate/resume, around 100MB of memory was disappearing.
Doing systemctl isolate rescue.target was not recovering it.
I was measuring the memory using 'free' command.
At one point after a few hibernate/resume cycles, the memory leaked was around
500MB.

I am back to the proprietary driver now. This memory leak (or whatever it is)
doesn't happen there. I go back to 90MB at rescue.target there even after 10
hibernate cycles.

The compositor used is gnome-shell under Xorg.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14607242842.Fa63.2686
Date: Fri, 15 Apr 2016 12:44:44 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Possible memory leak when hibernating/resuming"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94949">94949</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Possible memory leak when hibernating/resuming
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
          <td>me&#64;hussam.eu.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I tried nouveau on a 630GT GF108 card (a fermi card) and linux 4.5.
Every time I hibernate/resume, around 100MB of memory was disappearing.
Doing systemctl isolate rescue.target was not recovering it.
I was measuring the memory using 'free' command.
At one point after a few hibernate/resume cycles, the memory leaked was around
500MB.

I am back to the proprietary driver now. This memory leak (or whatever it is)
doesn't happen there. I go back to 90MB at rescue.target there even after 10
hibernate cycles.

The compositor used is gnome-shell under Xorg.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14607242842.Fa63.2686--

--===============1946274966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1946274966==--
