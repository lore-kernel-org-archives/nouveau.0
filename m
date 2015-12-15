From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93385] New: Dual head issues with xrandr
Date: Tue, 15 Dec 2015 11:33:57 +0000
Message-ID: <bug-93385-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0333035666=="
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


--===============0333035666==
Content-Type: multipart/alternative; boundary="1450179237.5DDC8c1.2048"; charset="UTF-8"


--1450179237.5DDC8c1.2048
Date: Tue, 15 Dec 2015 11:33:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93385

            Bug ID: 93385
           Summary: Dual head issues with xrandr
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: astrofacile-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 120523
  --> https://bugs.freedesktop.org/attachment.cgi?id=120523&action=edit
config-xrandr script

For some reasons I wrote a script that configures my dual screen with Xrandr
and Nouveau, that I manually launch with the command line (see attached
"config-xrandr" file).

All this worked perfectly until an update of Xorg and Nouveau, when it totally
fails to configure my dual screen and the display is completely broken, as you
can see on this photo: http://i.imgur.com/yyAqHZI.jpg

I took a screenshot: http://i.imgur.com/WkbXCPC.png and saw that the size of
the left screen (the external) and the position of the right screen (the
internal) were not correct.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1450179237.5DDC8c1.2048
Date: Tue, 15 Dec 2015 11:33:57 +0000
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
   title="NEW - Dual head issues with xrandr"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93385">93385</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Dual head issues with xrandr
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
          <td>astrofacile&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=120523" name="attach_120523" title="config-xrandr script">attachment 120523</a> <a href="attachment.cgi?id=120523&amp;action=edit" title="config-xrandr script">[details]</a></span>
config-xrandr script

For some reasons I wrote a script that configures my dual screen with Xrandr
and Nouveau, that I manually launch with the command line (see attached
&quot;config-xrandr&quot; file).

All this worked perfectly until an update of Xorg and Nouveau, when it totally
fails to configure my dual screen and the display is completely broken, as you
can see on this photo: <a href="http://i.imgur.com/yyAqHZI.jpg">http://i.imgur.com/yyAqHZI.jpg</a>

I took a screenshot: <a href="http://i.imgur.com/WkbXCPC.png">http://i.imgur.com/WkbXCPC.png</a> and saw that the size of
the left screen (the external) and the position of the right screen (the
internal) were not correct.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1450179237.5DDC8c1.2048--

--===============0333035666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0333035666==--
