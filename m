From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92271] Unusably slow OpenGL performance on nouveau
 (GeForce 9600 GT) with X server 1.18 with rotated output
Date: Thu, 08 Oct 2015 02:13:38 +0000
Message-ID: <bug-92271-8800-LZXs7tkpK3@http.bugs.freedesktop.org/>
References: <bug-92271-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0359508669=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92271-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0359508669==
Content-Type: multipart/alternative; boundary="1444270418.4Cf3cd03.28751"; charset="UTF-8"


--1444270418.4Cf3cd03.28751
Date: Thu, 8 Oct 2015 02:13:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92271

--- Comment #22 from Adam Williamson <adamw-cfjF3rc+CpsYNetmKr+vY16hYfS7NtTn@public.gmane.org> ---
So...yeah, it more or less works with a current git snapshot, except there's
one odd thing...I have a file in /etc/X11/xorg.conf.d with this content:

Section "Device"
        Identifier  "nouveau"
        Driver      "nouveau"
        Option    "Monitor-DVI-I-1"    "Right Monitor"
    Option    "Monitor-DVI-I-2"    "Left Monitor"
EndSection

Section "Monitor"
    Identifier    "Left Monitor"
    Option    "Primary"    "True"
    Option    "Rotate"    "left"
EndSection

Section "Monitor"
    Identifier    "Right Monitor"
    Option    "RightOf"    "Left Monitor"
        Option  "Rotate"        "left"
EndSection

it's to rotate my screens on desktops that don't do their own RandR stuff (and
it used to work for GDM too, doesn't any more). But for some reason, if I have
that file active with latest git nouveau, X won't start; I have to rename it to
.conf.bak to make X start. Still, if I do that, it does run fine and at full
speed, so this one looks like a bug tied to the particular nouveau DDX git
snapshot Fedora is using. Guess I should move it downstream?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1444270418.4Cf3cd03.28751
Date: Thu, 8 Oct 2015 02:13:38 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Unusably slow OpenGL performance on nouveau (GeForce 9600 GT) with X server 1.18 with rotated output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92271#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Unusably slow OpenGL performance on nouveau (GeForce 9600 GT) with X server 1.18 with rotated output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92271">bug 92271</a>
              from <span class="vcard"><a class="email" href="mailto:adamw&#64;happyassassin.net" title="Adam Williamson &lt;adamw&#64;happyassassin.net&gt;"> <span class="fn">Adam Williamson</span></a>
</span></b>
        <pre>So...yeah, it more or less works with a current git snapshot, except there's
one odd thing...I have a file in /etc/X11/xorg.conf.d with this content:

Section &quot;Device&quot;
        Identifier  &quot;nouveau&quot;
        Driver      &quot;nouveau&quot;
        Option    &quot;Monitor-DVI-I-1&quot;    &quot;Right Monitor&quot;
    Option    &quot;Monitor-DVI-I-2&quot;    &quot;Left Monitor&quot;
EndSection

Section &quot;Monitor&quot;
    Identifier    &quot;Left Monitor&quot;
    Option    &quot;Primary&quot;    &quot;True&quot;
    Option    &quot;Rotate&quot;    &quot;left&quot;
EndSection

Section &quot;Monitor&quot;
    Identifier    &quot;Right Monitor&quot;
    Option    &quot;RightOf&quot;    &quot;Left Monitor&quot;
        Option  &quot;Rotate&quot;        &quot;left&quot;
EndSection

it's to rotate my screens on desktops that don't do their own RandR stuff (and
it used to work for GDM too, doesn't any more). But for some reason, if I have
that file active with latest git nouveau, X won't start; I have to rename it to
.conf.bak to make X start. Still, if I do that, it does run fine and at full
speed, so this one looks like a bug tied to the particular nouveau DDX git
snapshot Fedora is using. Guess I should move it downstream?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444270418.4Cf3cd03.28751--

--===============0359508669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0359508669==--
