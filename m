From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91972] New: xorg/nouveau crashes when running wine's
 unit tests under valgrind: EXA: malloc failed for size -262140 bytes
Date: Fri, 11 Sep 2015 06:17:05 +0000
Message-ID: <bug-91972-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0596821050=="
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


--===============0596821050==
Content-Type: multipart/alternative; boundary="1441952225.2aFaB31.23121"; charset="UTF-8"


--1441952225.2aFaB31.23121
Date: Fri, 11 Sep 2015 06:17:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91972

            Bug ID: 91972
           Summary: xorg/nouveau crashes when running wine's unit tests
                    under valgrind: EXA: malloc failed for size -262140
                    bytes
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: austinenglish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 118205
  --> https://bugs.freedesktop.org/attachment.cgi?id=118205&action=edit
xorg.log

Originally reported here:
https://bugzilla.redhat.com/show_bug.cgi?id=1248314

bug only occurred sometimes, but running the tests under valgrind triggers this
bug 100% of the time for me.

Running wine's dlls/user32/tests/win.c tests under valgrind causes the X client
to fail, killing the user session.

[austin@localhost ~]$ dnf list installed | grep xorg | grep -e nouveau -e
server
xorg-x11-drv-nouveau.x86_64            1:1.0.11-2.fc22                  
@System
xorg-x11-server-Xorg.x86_64            1.17.2-2.fc22                    
@System
xorg-x11-server-Xwayland.x86_64        1.17.2-2.fc22                    
@System
xorg-x11-server-common.x86_64          1.17.2-2.fc22                    
@System
xorg-x11-server-utils.x86_64           7.7-15.fc22                      
@System

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1441952225.2aFaB31.23121
Date: Fri, 11 Sep 2015 06:17:05 +0000
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
   title="NEW - xorg/nouveau crashes when running wine's unit tests under valgrind: EXA: malloc failed for size -262140 bytes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91972">91972</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>xorg/nouveau crashes when running wine's unit tests under valgrind: EXA: malloc failed for size -262140 bytes
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
          <td>x86-64 (AMD64)
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
          <td>austinenglish&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=118205" name="attach_118205" title="xorg.log">attachment 118205</a> <a href="attachment.cgi?id=118205&amp;action=edit" title="xorg.log">[details]</a></span>
xorg.log

Originally reported here:
<a href="https://bugzilla.redhat.com/show_bug.cgi?id=1248314">https://bugzilla.redhat.com/show_bug.cgi?id=1248314</a>

bug only occurred sometimes, but running the tests under valgrind triggers this
<a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Language filtering not working"
   href="show_bug.cgi?id=100">bug 100</a>% of the time for me.

Running wine's dlls/user32/tests/win.c tests under valgrind causes the X client
to fail, killing the user session.

[austin&#64;localhost ~]$ dnf list installed | grep xorg | grep -e nouveau -e
server
xorg-x11-drv-nouveau.x86_64            1:1.0.11-2.fc22                  
&#64;System
xorg-x11-server-Xorg.x86_64            1.17.2-2.fc22                    
&#64;System
xorg-x11-server-Xwayland.x86_64        1.17.2-2.fc22                    
&#64;System
xorg-x11-server-common.x86_64          1.17.2-2.fc22                    
&#64;System
xorg-x11-server-utils.x86_64           7.7-15.fc22                      
&#64;System</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1441952225.2aFaB31.23121--

--===============0596821050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0596821050==--
