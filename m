From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97462] Graphics deadlock "ILLEGAL_MTHD" in nouveau
 with mesa version 11.2.2 when visiting Google Maps with firefox 49.0b5
Date: Thu, 15 Sep 2016 16:47:00 +0000
Message-ID: <bug-97462-8800-akCMc2woa3@http.bugs.freedesktop.org/>
References: <bug-97462-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0678895759=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97462-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0678895759==
Content-Type: multipart/alternative; boundary="14739580202.dE919C3.3293";
 charset="UTF-8"


--14739580202.dE919C3.3293
Date: Thu, 15 Sep 2016 16:47:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97462

--- Comment #9 from Paviluf <jeremy9856-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I have the same problem I think. I opened a bug report against Firefox
https://bugzilla.mozilla.org/show_bug.cgi?id=3D1302974

As you can see there it seem that is
"user_pref("layers.acceleration.force-enabled", true);" that make Firefox
crash. If I set it to false Google Maps works. To confirm with a clean prof=
ile,
Firefox crash on Google Maps with just this setting enabled
"user_pref("layers.acceleration.force-enabled", true);". Weirdly it make
Firefox crash only on Google Maps. Unfortunately I, and a lot of people I
guess, need this feature to get rid of tearing. Firefox doesn't crash in sa=
fe
mode. It don't crash too with HWA disabled.

Here is the section "graphics"

Acc=C3=A9l=C3=A9ration graphique
Fonctionnalit=C3=A9s
Composition     OpenGL
Zoom/Panoramique asynchrones    aucun
Rendu WebGL     nouveau -- Gallium 0.4 on NVC1
D=C3=A9codage mat=C3=A9riel H264  No
GPU 1
Actif   Oui
Description     nouveau -- Gallium 0.4 on NVC1
ID du vendeur   nouveau
ID du p=C3=A9riph=C3=A9rique      Gallium 0.4 on NVC1
Version du pilote       3.0 Mesa 12.0.2
Diagnostics
AzureCanvasAccelerated  0
AzureCanvasBackend      skia
AzureContentBackend     cairo
AzureFallbackCanvasBackend      none
CairoUseXRender 0

I hope we can find a fix ! Thanks !

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14739580202.dE919C3.3293
Date: Thu, 15 Sep 2016 16:47:00 +0000
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
   title=3D"NEW - Graphics deadlock &quot;ILLEGAL_MTHD&quot; in nouveau wit=
h mesa version 11.2.2 when visiting Google Maps with firefox 49.0b5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97462#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Graphics deadlock &quot;ILLEGAL_MTHD&quot; in nouveau wit=
h mesa version 11.2.2 when visiting Google Maps with firefox 49.0b5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97462">bug 97462<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jeremy9856&#64;gmail.com" title=3D"Paviluf &lt;jeremy9856&#64;gmail.com&gt;=
"> <span class=3D"fn">Paviluf</span></a>
</span></b>
        <pre>I have the same problem I think. I opened a bug report against=
 Firefox
<a href=3D"https://bugzilla.mozilla.org/show_bug.cgi?id=3D1302974">https://=
bugzilla.mozilla.org/show_bug.cgi?id=3D1302974</a>

As you can see there it seem that is
&quot;user_pref(&quot;layers.acceleration.force-enabled&quot;, true);&quot;=
 that make Firefox
crash. If I set it to false Google Maps works. To confirm with a clean prof=
ile,
Firefox crash on Google Maps with just this setting enabled
&quot;user_pref(&quot;layers.acceleration.force-enabled&quot;, true);&quot;=
. Weirdly it make
Firefox crash only on Google Maps. Unfortunately I, and a lot of people I
guess, need this feature to get rid of tearing. Firefox doesn't crash in sa=
fe
mode. It don't crash too with HWA disabled.

Here is the section &quot;graphics&quot;

Acc=C3=A9l=C3=A9ration graphique
Fonctionnalit=C3=A9s
Composition     OpenGL
Zoom/Panoramique asynchrones    aucun
Rendu WebGL     nouveau -- Gallium 0.4 on NVC1
D=C3=A9codage mat=C3=A9riel H264  No
GPU 1
Actif   Oui
Description     nouveau -- Gallium 0.4 on NVC1
ID du vendeur   nouveau
ID du p=C3=A9riph=C3=A9rique      Gallium 0.4 on NVC1
Version du pilote       3.0 Mesa 12.0.2
Diagnostics
AzureCanvasAccelerated  0
AzureCanvasBackend      skia
AzureContentBackend     cairo
AzureFallbackCanvasBackend      none
CairoUseXRender 0

I hope we can find a fix ! Thanks !</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14739580202.dE919C3.3293--

--===============0678895759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0678895759==--
