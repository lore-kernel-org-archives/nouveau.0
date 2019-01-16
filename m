From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109371] New: Textures seem to be byteswapped on big
 endian architectures
Date: Wed, 16 Jan 2019 00:36:08 +0000
Message-ID: <bug-109371-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0157681472=="
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


--===============0157681472==
Content-Type: multipart/alternative; boundary="15475989680.DAd798A.18249"
Content-Transfer-Encoding: 7bit


--15475989680.DAd798A.18249
Date: Wed, 16 Jan 2019 00:36:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109371

            Bug ID: 109371
           Summary: Textures seem to be byteswapped on big endian
                    architectures
           Product: Mesa
           Version: 18.3
          Hardware: PowerPC
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: kungfujesus06-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

When using an NV43 based GPU on a PPC64 kernel with a 64 bit userspace, it
seems applications will have byte swapped textures when specified with GL_R=
GBA
and GL_UNSIGNED_BYTE.  Matplotlib will do this when blit=3DTrue for the plot
routines, and several games will have this issue.  In particular, for Legacy
Doom, I've found that if I swap the textures so that they are A,B,G,R just
before the textures are mapped, everything is correct.=20=20

I also found that doing glPixelStorei(GL_UNPACK_BYTES, GL_TRUE) and choosing
GL_UNSIGNED_INT_8_8_8_8 as the representation seemed to also remedy this.  I
found that the _REV variant didn't byte swap the textures back to the incor=
rect
ordering (this is probably a different bug).

Easiest way to demonstrate the bug:
svn co https://svn.code.sf.net/p/doomlegacy/svn/legacy_one/trunk doomlegacy
cd doomlegacy
make OS=3DLINUX
make
cd bin
Grab this archive:
https://sourceforge.net/projects/doomlegacy/files/1.47.2/doomlegacy_1.47.2_=
common.zip/download,
unzip it, extract legacy.wad into the bin directory
Grab this archive:
https://github.com/freedoom/freedoom/releases/download/v0.11.3/freedoom-0.1=
1.3.zip,
extract, move freedoom1.wad into the bin directory.
Then do:
./doomlegacy -iwad freedoom1.wad -opengl

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15475989680.DAd798A.18249
Date: Wed, 16 Jan 2019 00:36:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Textures seem to be byteswapped on big endian architectur=
es"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109371">109371</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Textures seem to be byteswapped on big endian architectures
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>18.3
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>PowerPC
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
          <td>kungfujesus06&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When using an NV43 based GPU on a PPC64 kernel with a 64 bit u=
serspace, it
seems applications will have byte swapped textures when specified with GL_R=
GBA
and GL_UNSIGNED_BYTE.  Matplotlib will do this when blit=3DTrue for the plot
routines, and several games will have this issue.  In particular, for Legacy
Doom, I've found that if I swap the textures so that they are A,B,G,R just
before the textures are mapped, everything is correct.=20=20

I also found that doing glPixelStorei(GL_UNPACK_BYTES, GL_TRUE) and choosing
GL_UNSIGNED_INT_8_8_8_8 as the representation seemed to also remedy this.  I
found that the _REV variant didn't byte swap the textures back to the incor=
rect
ordering (this is probably a different bug).

Easiest way to demonstrate the bug:
svn co <a href=3D"https://svn.code.sf.net/p/doomlegacy/svn/legacy_one/trunk=
">https://svn.code.sf.net/p/doomlegacy/svn/legacy_one/trunk</a> doomlegacy
cd doomlegacy
make OS=3DLINUX
make
cd bin
Grab this archive:
<a href=3D"https://sourceforge.net/projects/doomlegacy/files/1.47.2/doomleg=
acy_1.47.2_common.zip/download">https://sourceforge.net/projects/doomlegacy=
/files/1.47.2/doomlegacy_1.47.2_common.zip/download</a>,
unzip it, extract legacy.wad into the bin directory
Grab this archive:
<a href=3D"https://github.com/freedoom/freedoom/releases/download/v0.11.3/f=
reedoom-0.11.3.zip">https://github.com/freedoom/freedoom/releases/download/=
v0.11.3/freedoom-0.11.3.zip</a>,
extract, move freedoom1.wad into the bin directory.
Then do:
./doomlegacy -iwad freedoom1.wad -opengl</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15475989680.DAd798A.18249--

--===============0157681472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0157681472==--
