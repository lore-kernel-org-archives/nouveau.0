From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91526] New: World of Warcraft (on Wine) has UI
 corruption with nouveau
Date: Sat, 01 Aug 2015 19:27:28 +0000
Message-ID: <bug-91526-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0314197487=="
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


--===============0314197487==
Content-Type: multipart/alternative; boundary="1438457248.B5b01f0.31683"; charset="UTF-8"


--1438457248.B5b01f0.31683
Date: Sat, 1 Aug 2015 19:27:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D91526

            Bug ID: 91526
           Summary: World of Warcraft (on Wine) has UI corruption with
                    nouveau
           Product: Mesa
           Version: git
          Hardware: Other
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gediminas-1NU85dn7e2ownf/OCUKchA@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 117482
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D117482&action=3Dedit
example of UI corruption

When I run World of Warcraft under Wine with Nouveau, the game has UI
corruption ranging from very mild (e.g. bits of text garbled here and there=
) to
severe (complete lack of UI whatsoever).
I recorded an apitrace trace[2] and when replaying on Nouveau, the corrupti=
ons
still do happen, complete with variations[1]. The same trace replayed on LL=
VM
(i.e. with LIBGL_ALWAYS_SOFTWARE=3D1) results with the UI being rendered 10=
0%
fine.
Running on the binary blob also does result in the UI being rendered 100% f=
ine.

I tested with two WoW versions: the [at the time of writing] latest 6.20 an=
d an
old 3.3.5a client =E2=80=93 both have the same kind of corruptions.

Do note that in some cases, the initial game "login screen" appears to look
perfectly fine; until one tries to e.g. enter one's login credentials or op=
en
the settings menu. So in order to tell if there are corruptions or not, sim=
ply
launching the game might not be enough.

[1] the corruptions seem to be consistent between runs (on both actual game=
 and
trace replay) as long as I don't change anything window-wise. e.g. opening a
some program or moving some random window around results in different
corruptions each time while not touching anything and just re-starting the =
game
(or replay) results in very consistent corruptions.
I also noticed that when it comes to typed-in text (e.g. field to enter the
account name), the typed in letters seem to most of the time contain bits f=
rom
other portions of the screen outside of game's window.

[2] https://seriouss.am/wow-nouveau-2015-08-01T2052.trace.xz filesize: 20.4=
MiB

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1438457248.B5b01f0.31683
Date: Sat, 1 Aug 2015 19:27:28 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - World of Warcraft (on Wine) has UI corruption with nouvea=
u"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91526">91526</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>World of Warcraft (on Wine) has UI corruption with nouveau
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
          <td>gediminas&#64;varciai.lt
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D117482=
" name=3D"attach_117482" title=3D"example of UI corruption">attachment 1174=
82</a> <a href=3D"attachment.cgi?id=3D117482&amp;action=3Dedit" title=3D"ex=
ample of UI corruption">[details]</a></span>
example of UI corruption

When I run World of Warcraft under Wine with Nouveau, the game has UI
corruption ranging from very mild (e.g. bits of text garbled here and there=
) to
severe (complete lack of UI whatsoever).
I recorded an apitrace trace[2] and when replaying on Nouveau, the corrupti=
ons
still do happen, complete with variations[1]. The same trace replayed on LL=
VM
(i.e. with LIBGL_ALWAYS_SOFTWARE=3D1) results with the UI being rendered 10=
0%
fine.
Running on the binary blob also does result in the UI being rendered 100% f=
ine.

I tested with two WoW versions: the [at the time of writing] latest 6.20 an=
d an
old 3.3.5a client =E2=80=93 both have the same kind of corruptions.

Do note that in some cases, the initial game &quot;login screen&quot; appea=
rs to look
perfectly fine; until one tries to e.g. enter one's login credentials or op=
en
the settings menu. So in order to tell if there are corruptions or not, sim=
ply
launching the game might not be enough.

[1] the corruptions seem to be consistent between runs (on both actual game=
 and
trace replay) as long as I don't change anything window-wise. e.g. opening a
some program or moving some random window around results in different
corruptions each time while not touching anything and just re-starting the =
game
(or replay) results in very consistent corruptions.
I also noticed that when it comes to typed-in text (e.g. field to enter the
account name), the typed in letters seem to most of the time contain bits f=
rom
other portions of the screen outside of game's window.

[2] <a href=3D"https://seriouss.am/wow-nouveau-2015-08-01T2052.trace.xz">ht=
tps://seriouss.am/wow-nouveau-2015-08-01T2052.trace.xz</a> filesize: 20.4Mi=
B</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1438457248.B5b01f0.31683--

--===============0314197487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0314197487==--
