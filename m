From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91170] New: World of Zoo (in Wine) has rendering
	issues
Date: Wed, 01 Jul 2015 04:16:36 +0000
Message-ID: <bug-91170-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0733622744=="
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


--===============0733622744==
Content-Type: multipart/alternative; boundary="1435724196.F5687be1.5847"; charset="UTF-8"


--1435724196.F5687be1.5847
Date: Wed, 1 Jul 2015 04:16:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91170

            Bug ID: 91170
           Summary: World of Zoo (in Wine) has rendering issues
           Product: Mesa
           Version: git
          Hardware: Other
               URL: http://store.steampowered.com/app/43100/
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

When the game loads to the menu the screen is scrambled with flashing polygons.
This doesn't occur with the binary drivers (340.76) or when starting the game
with the software renderer.Disabling shader optimization doesn't resolve the
problem.

Screenshot:
http://imgur.com/xro8Ixr

Trace file:
https://drive.google.com/open?id=0B-tTbLKBl-tOdTJxT1o0c2dZMmc
The problem is first visible in frame #152, when the second splash screen is
displayed.

Demo version is available on Steam (needs Wine to run):
http://store.steampowered.com/app/43100/

Fedora 22 32-bit
Mesa 10.6-branchpoint-773-g1de93f9
Kernel 4.0.6-300.fc22.i686+PAE
Xorg 1.17.2
libdrm-2.4.61-3.fc22.i686

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1435724196.F5687be1.5847
Date: Wed, 1 Jul 2015 04:16:36 +0000
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
   title="NEW - World of Zoo (in Wine) has rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91170">91170</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>World of Zoo (in Wine) has rendering issues
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
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
          <th>URL</th>
          <td>http://store.steampowered.com/app/43100/
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
          <td>gyebro69&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When the game loads to the menu the screen is scrambled with flashing polygons.
This doesn't occur with the binary drivers (340.76) or when starting the game
with the software renderer.Disabling shader optimization doesn't resolve the
problem.

Screenshot:
<a href="http://imgur.com/xro8Ixr">http://imgur.com/xro8Ixr</a>

Trace file:
<a href="https://drive.google.com/open?id=0B-tTbLKBl-tOdTJxT1o0c2dZMmc">https://drive.google.com/open?id=0B-tTbLKBl-tOdTJxT1o0c2dZMmc</a>
The problem is first visible in frame #152, when the second splash screen is
displayed.

Demo version is available on Steam (needs Wine to run):
<a href="http://store.steampowered.com/app/43100/">http://store.steampowered.com/app/43100/</a>

Fedora 22 32-bit
Mesa 10.6-branchpoint-773-g1de93f9
Kernel 4.0.6-300.fc22.i686+PAE
Xorg 1.17.2
libdrm-2.4.61-3.fc22.i686</pre>
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

--1435724196.F5687be1.5847--

--===============0733622744==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0733622744==--
