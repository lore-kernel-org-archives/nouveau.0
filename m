From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89019] New: Black texture using Qt5
Date: Sat, 07 Feb 2015 11:37:46 +0000
Message-ID: <bug-89019-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1040171671=="
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


--===============1040171671==
Content-Type: multipart/alternative; boundary="1423309066.fc2b8cfe0.4971"; charset="UTF-8"


--1423309066.fc2b8cfe0.4971
Date: Sat, 7 Feb 2015 11:37:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89019

            Bug ID: 89019
           Summary: Black texture using Qt5
           Product: Mesa
           Version: 10.4
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: andrea-fd97jBR+K/6hPH1hqNUYSQ@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 113241
  --> https://bugs.freedesktop.org/attachment.cgi?id=113241&action=edit
Screenshot of Plasma 2

Hi there,
I don't know where to start because I just migrated to Plasma 2 and got this
black texture (see attachment).

Everything is fine using Qt4, so I suppose this could be a Qt issue? But then I
used vesa as Xorg driver and the texture is painted correctly.
The same black texture is used in SDDM too, which is also a Qt5 application.

Any idea on where to start?

NVIDIA FX 5500, Xorg 1.16.3, mesa 10.4.4, nouveau 1.0.11, Qt 5.4.0

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1423309066.fc2b8cfe0.4971
Date: Sat, 7 Feb 2015 11:37:46 +0000
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
   title="NEW - Black texture using Qt5"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89019">89019</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Black texture using Qt5
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>10.4
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>andrea&#64;archlinux.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=113241" name="attach_113241" title="Screenshot of Plasma 2">attachment 113241</a> <a href="attachment.cgi?id=113241&amp;action=edit" title="Screenshot of Plasma 2">[details]</a></span>
Screenshot of Plasma 2

Hi there,
I don't know where to start because I just migrated to Plasma 2 and got this
black texture (see attachment).

Everything is fine using Qt4, so I suppose this could be a Qt issue? But then I
used vesa as Xorg driver and the texture is painted correctly.
The same black texture is used in SDDM too, which is also a Qt5 application.

Any idea on where to start?

NVIDIA FX 5500, Xorg 1.16.3, mesa 10.4.4, nouveau 1.0.11, Qt 5.4.0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1423309066.fc2b8cfe0.4971--

--===============1040171671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1040171671==--
