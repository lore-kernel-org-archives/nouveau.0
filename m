From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86491] New: Nouveau crash when shutting down
Date: Thu, 20 Nov 2014 14:50:33 +0000
Message-ID: <bug-86491-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0331708618=="
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


--===============0331708618==
Content-Type: multipart/alternative; boundary="1416495033.0b1b671.18514"; charset="UTF-8"


--1416495033.0b1b671.18514
Date: Thu, 20 Nov 2014 14:50:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86491

            Bug ID: 86491
           Summary: Nouveau crash when shutting down
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jarlgjessing-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 109755
  --> https://bugs.freedesktop.org/attachment.cgi?id=109755&action=edit
Image showing the screen on shutdown

When doing init 0, or shutdown from KDE, I end up with a kernel dump :-(
I'm unable to stop this from happening so, I cannot get into Windows either.
I tried openSUSE 13.2 just as it came out and thought that this problem was due
to the live image, and therefore tried again today, using the DVD image.

Same problem :-(
Unfortunately there are no longer any /var/log/messages or the like, so I don't
know what to attach.
And the guides as to where to locate these information (which I could before
13.2) is not as I see, easy to find.
I have also tried with openSUSE's HEAD version, which was a 3.18.xx version. 
Same problem

The problem arises when shutting down or sleeping.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416495033.0b1b671.18514
Date: Thu, 20 Nov 2014 14:50:33 +0000
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
   title="NEW - Nouveau crash when shutting down"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86491">86491</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau crash when shutting down
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
          <td>jarlgjessing&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=109755" name="attach_109755" title="Image showing the screen on shutdown">attachment 109755</a> <a href="attachment.cgi?id=109755&amp;action=edit" title="Image showing the screen on shutdown">[details]</a></span>
Image showing the screen on shutdown

When doing init 0, or shutdown from KDE, I end up with a kernel dump :-(
I'm unable to stop this from happening so, I cannot get into Windows either.
I tried openSUSE 13.2 just as it came out and thought that this problem was due
to the live image, and therefore tried again today, using the DVD image.

Same problem :-(
Unfortunately there are no longer any /var/log/messages or the like, so I don't
know what to attach.
And the guides as to where to locate these information (which I could before
13.2) is not as I see, easy to find.
I have also tried with openSUSE's HEAD version, which was a 3.18.xx version. 
Same problem

The problem arises when shutting down or sleeping.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416495033.0b1b671.18514--

--===============0331708618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0331708618==--
