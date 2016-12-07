From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98852] Nvidia graphics card fan not running or to
 slow, danger of overheating
Date: Wed, 07 Dec 2016 11:16:59 +0000
Message-ID: <bug-98852-8800-3xEI5VRe0z@http.bugs.freedesktop.org/>
References: <bug-98852-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1321550524=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98852-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1321550524==
Content-Type: multipart/alternative; boundary="14811094180.eFf4Dcc.5862";
 charset="UTF-8"


--14811094180.eFf4Dcc.5862
Date: Wed, 7 Dec 2016 11:16:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98852

--- Comment #14 from Egon Niessner <susebugzilla-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> ---
I downloaded the envytools Software from your link and tried an installatio=
n.
I got following error messages:

inux-234d:/home/nie1/envytools/envytools-master # cmake . -G Ninja
CMake Error: CMake was unable to find a build program corresponding to "Nin=
ja".
 CMAKE_MAKE_PROGRAM is not set.  You probably need to select a different bu=
ild
tool.
CMake Error: CMAKE_C_COMPILER not set, after EnableLanguage
CMake Error: CMAKE_CXX_COMPILER not set, after EnableLanguage
-- Configuring incomplete, errors occurred!




linux-234d:/home/nie1/envytools/envytools-master # cmake .
CMake Error: CMake was unable to find a build program corresponding to "Nin=
ja".
 CMAKE_MAKE_PROGRAM is not set.  You probably need to select a different bu=
ild
tool.
CMake Error: CMAKE_C_COMPILER not set, after EnableLanguage
CMake Error: CMAKE_CXX_COMPILER not set, after EnableLanguage
-- Configuring incomplete, errors occurred!


On the system the whole linux kernel development environment is installed
and all packages mentioned in the envytools description.
What have I to do, that the compilation is possible ?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14811094180.eFf4Dcc.5862
Date: Wed, 7 Dec 2016 11:16:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nvidia graphics card fan not running or to slow, danger o=
f overheating"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98852#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nvidia graphics card fan not running or to slow, danger o=
f overheating"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98852">bug 98852<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
susebugzilla&#64;online.de" title=3D"Egon Niessner &lt;susebugzilla&#64;onl=
ine.de&gt;"> <span class=3D"fn">Egon Niessner</span></a>
</span></b>
        <pre>I downloaded the envytools Software from your link and tried a=
n installation.
I got following error messages:

inux-234d:/home/nie1/envytools/envytools-master # cmake . -G Ninja
CMake Error: CMake was unable to find a build program corresponding to &quo=
t;Ninja&quot;.
 CMAKE_MAKE_PROGRAM is not set.  You probably need to select a different bu=
ild
tool.
CMake Error: CMAKE_C_COMPILER not set, after EnableLanguage
CMake Error: CMAKE_CXX_COMPILER not set, after EnableLanguage
-- Configuring incomplete, errors occurred!




linux-234d:/home/nie1/envytools/envytools-master # cmake .
CMake Error: CMake was unable to find a build program corresponding to &quo=
t;Ninja&quot;.
 CMAKE_MAKE_PROGRAM is not set.  You probably need to select a different bu=
ild
tool.
CMake Error: CMAKE_C_COMPILER not set, after EnableLanguage
CMake Error: CMAKE_CXX_COMPILER not set, after EnableLanguage
-- Configuring incomplete, errors occurred!


On the system the whole linux kernel development environment is installed
and all packages mentioned in the envytools description.
What have I to do, that the compilation is possible ?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14811094180.eFf4Dcc.5862--

--===============1321550524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1321550524==--
