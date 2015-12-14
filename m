From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93373] New: sometimes hickup with persistent garbaby
Date: Mon, 14 Dec 2015 16:45:34 +0000
Message-ID: <bug-93373-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0994191214=="
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


--===============0994191214==
Content-Type: multipart/alternative; boundary="1450111534.BE6F01.2848"; charset="UTF-8"


--1450111534.BE6F01.2848
Date: Mon, 14 Dec 2015 16:45:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93373

            Bug ID: 93373
           Summary: sometimes hickup with persistent garbaby
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: minor
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: blade-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 120498
  --> https://bugs.freedesktop.org/attachment.cgi?id=120498&action=edit
Screenshot just after the hickup

Version:

ii  xserver-xorg-v 1:1.0.12-1   amd64        X.Org X server -- Nouveau display

See attached screenshot. How it happens? Everything works normal (except for
some minor glitches like the substring "www." displayed in black-on-black
Terminator resp. Gnome Terminal).

But sometimes (once a week to every couple of days) and usually when Firefox is
in front, the screen suddenly displays lots of garbage. There are no errors in
Xorg.0.log. Usually the fonts in the main HTML area get weird or dots on them
and this stays even when the window is scrolled. Some page areas with other
fonts are sometimes also affected and they look even worse (covered in
stripes). The same applies to the GTK controls. (Note: I use thinice Gtk theme,
this fact might be related).

Anyhow, making Gtk redraw the controls (hover or click blindly) makes them
appear normal but not so with the fonts. Even when I restart Firefox, some tabs
still have areas (randomly!) with garbled letters.

Note: I had a similar issue with the previous version too but it was worse, it
also affected Terminator (Gnome Terminal renderer). Now Terminator seems to
stay unaffected, at least for now.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1450111534.BE6F01.2848
Date: Mon, 14 Dec 2015 16:45:34 +0000
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
   title="NEW - sometimes hickup with persistent garbaby"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93373">93373</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>sometimes hickup with persistent garbaby
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
          <td>minor
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
          <td>blade&#64;debian.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=120498" name="attach_120498" title="Screenshot just after the hickup">attachment 120498</a> <a href="attachment.cgi?id=120498&amp;action=edit" title="Screenshot just after the hickup">[details]</a></span>
Screenshot just after the hickup

Version:

ii  xserver-xorg-v 1:1.0.12-1   amd64        X.Org X server -- Nouveau display

See attached screenshot. How it happens? Everything works normal (except for
some minor glitches like the substring &quot;www.&quot; displayed in black-on-black
Terminator resp. Gnome Terminal).

But sometimes (once a week to every couple of days) and usually when Firefox is
in front, the screen suddenly displays lots of garbage. There are no errors in
Xorg.0.log. Usually the fonts in the main HTML area get weird or dots on them
and this stays even when the window is scrolled. Some page areas with other
fonts are sometimes also affected and they look even worse (covered in
stripes). The same applies to the GTK controls. (Note: I use thinice Gtk theme,
this fact might be related).

Anyhow, making Gtk redraw the controls (hover or click blindly) makes them
appear normal but not so with the fonts. Even when I restart Firefox, some tabs
still have areas (randomly!) with garbled letters.

Note: I had a similar issue with the previous version too but it was worse, it
also affected Terminator (Gnome Terminal renderer). Now Terminator seems to
stay unaffected, at least for now.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1450111534.BE6F01.2848--

--===============0994191214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0994191214==--
