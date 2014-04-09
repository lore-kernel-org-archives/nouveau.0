From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77230] New: NV40 PGRAPH "unknown bits" - windows
 render in white
Date: Wed, 09 Apr 2014 09:12:13 +0000
Message-ID: <bug-77230-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2088863410=="
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


--===============2088863410==
Content-Type: multipart/alternative; boundary="1397034733.acbFe51.8673"; charset="us-ascii"


--1397034733.acbFe51.8673
Date: Wed, 9 Apr 2014 09:12:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77230

          Priority: medium
            Bug ID: 77230
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: NV40 PGRAPH "unknown bits" - windows render in white
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: guinness.meredith-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 97126
  --> https://bugs.freedesktop.org/attachment.cgi?id=97126&action=edit
dmesg from boot to just after login

Previously I was using Fedora 17 and found that once a week or so I would get
nouveau errors and had to reboot.

Recently I installed Fedora 20 (always clean installs) and for the first few
weeks all was good so I thought the problem had been resolved.  Alas the
problem remains, although slightly different, and has slowly deteriorated to
the point that now it presents at login.

As suggested on your site I initially  lodged a bug with redhat, but that seems
to have stalled:
https://bugzilla.redhat.com/show_bug.cgi?id=708422

My workaround is to use vncserver and my notebook to remote into F20. The
virtual consoles on F20 are fine, and the UI also working, the problem is
(excuse the windows terminology) the client area of application windows is
rendered as white.

As an example I can start terminal from my favourites bar, the client area
displays as white, I can type "exit", it is not reflected in terminal, hit
enter and the window will close

Same white windows in gnote, settings, nautilus, etc

Are there any special configs I can try? I am happy to provide more info, do
more tests and compile nouveau myself if it would help... just need some
guidance.

Thanks,
Troy

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397034733.acbFe51.8673
Date: Wed, 9 Apr 2014 09:12:13 +0000
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
   title="NEW --- - NV40 PGRAPH &quot;unknown bits&quot; - windows render in white"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77230">77230</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NV40 PGRAPH &quot;unknown bits&quot; - windows render in white
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
          <td>guinness.meredith&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=97126" name="attach_97126" title="dmesg from boot to just after login">attachment 97126</a> <a href="attachment.cgi?id=97126&amp;action=edit" title="dmesg from boot to just after login">[details]</a></span>
dmesg from boot to just after login

Previously I was using Fedora 17 and found that once a week or so I would get
nouveau errors and had to reboot.

Recently I installed Fedora 20 (always clean installs) and for the first few
weeks all was good so I thought the problem had been resolved.  Alas the
problem remains, although slightly different, and has slowly deteriorated to
the point that now it presents at login.

As suggested on your site I initially  lodged a bug with redhat, but that seems
to have stalled:
<a href="https://bugzilla.redhat.com/show_bug.cgi?id=708422">https://bugzilla.redhat.com/show_bug.cgi?id=708422</a>

My workaround is to use vncserver and my notebook to remote into F20. The
virtual consoles on F20 are fine, and the UI also working, the problem is
(excuse the windows terminology) the client area of application windows is
rendered as white.

As an example I can start terminal from my favourites bar, the client area
displays as white, I can type &quot;exit&quot;, it is not reflected in terminal, hit
enter and the window will close

Same white windows in gnote, settings, nautilus, etc

Are there any special configs I can try? I am happy to provide more info, do
more tests and compile nouveau myself if it would help... just need some
guidance.

Thanks,
Troy</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397034733.acbFe51.8673--

--===============2088863410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2088863410==--
