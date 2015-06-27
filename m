From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91124] New: Civilization V (in Wine) has rendering
 issues: text missing, menu bar corrupted
Date: Sat, 27 Jun 2015 07:53:42 +0000
Message-ID: <bug-91124-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1491403353=="
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


--===============1491403353==
Content-Type: multipart/alternative; boundary="1435391621.6431bec30.18928"; charset="UTF-8"


--1435391621.6431bec30.18928
Date: Sat, 27 Jun 2015 07:53:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91124

            Bug ID: 91124
           Summary: Civilization V (in Wine) has rendering issues: text
                    missing, menu bar corrupted
           Product: Mesa
           Version: git
          Hardware: Other
               URL: http://store.steampowered.com/app/8930/
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Civilization V when running in Wine has the following issues on my system with
nouveau:
all text is missing from game (in the menus, on the loading screens and in
mid-game)
when starting a game from the menu the upper menu bar that contains menu
options and icons is corrupted (terrain and units are rendered properly though)

The problem is not present:
- with the Nvidia binary drivers (340.76)
- when using the software renderer (LIBGL_ALWAYS_SOFTWARE=1)
- when starting the game with NV50_PROG_OPTIMIZE=0 or NV50_PROG_OPTIMIZE=1

See this screenshot for comparison:
http://imgur.com/pzpPgNL

I created a trace with apitrace and the problem is reproducible with that on my
system (uncompressed 366 MB):
https://drive.google.com/open?id=0B-tTbLKBl-tON09yaE14eEkwb28&authuser=0

Demo version is available on Steam (~4 GB download size):
http://store.steampowered.com/app/8930/

Fedora 22 32-bit
Mesa 10.6-branchpoint-684-g556dd4a
VGA compatible controller: NVIDIA Corporation G92 [GeForce GTS 250] (rev a2)
(prog-if 00 [VGA controller])
Kernel 4.0.5-300.fc22.i686+PAE
xorg-x11-server-Xorg-1.17.2-1.fc22.i686
libdrm-2.4.61-3.fc22.i686

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1435391621.6431bec30.18928
Date: Sat, 27 Jun 2015 07:53:41 +0000
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
   title="NEW - Civilization V (in Wine) has rendering issues: text missing, menu bar corrupted"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91124">91124</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Civilization V (in Wine) has rendering issues: text missing, menu bar corrupted
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
          <td>http://store.steampowered.com/app/8930/
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
        <pre>Civilization V when running in Wine has the following issues on my system with
nouveau:
all text is missing from game (in the menus, on the loading screens and in
mid-game)
when starting a game from the menu the upper menu bar that contains menu
options and icons is corrupted (terrain and units are rendered properly though)

The problem is not present:
- with the Nvidia binary drivers (340.76)
- when using the software renderer (LIBGL_ALWAYS_SOFTWARE=1)
- when starting the game with NV50_PROG_OPTIMIZE=0 or NV50_PROG_OPTIMIZE=1

See this screenshot for comparison:
<a href="http://imgur.com/pzpPgNL">http://imgur.com/pzpPgNL</a>

I created a trace with apitrace and the problem is reproducible with that on my
system (uncompressed 366 MB):
<a href="https://drive.google.com/open?id=0B-tTbLKBl-tON09yaE14eEkwb28&amp;authuser=0">https://drive.google.com/open?id=0B-tTbLKBl-tON09yaE14eEkwb28&amp;authuser=0</a>

Demo version is available on Steam (~4 GB download size):
<a href="http://store.steampowered.com/app/8930/">http://store.steampowered.com/app/8930/</a>

Fedora 22 32-bit
Mesa 10.6-branchpoint-684-g556dd4a
VGA compatible controller: NVIDIA Corporation G92 [GeForce GTS 250] (rev a2)
(prog-if 00 [VGA controller])
Kernel 4.0.5-300.fc22.i686+PAE
xorg-x11-server-Xorg-1.17.2-1.fc22.i686
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

--1435391621.6431bec30.18928--

--===============1491403353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1491403353==--
