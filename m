From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90435] [NV46] moving 3D objects drawn static
Date: Tue, 26 May 2015 10:49:16 +0000
Message-ID: <bug-90435-8800-C1QZuvSvPh@http.bugs.freedesktop.org/>
References: <bug-90435-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1186612266=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90435-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1186612266==
Content-Type: multipart/alternative; boundary="1432637355.Abf5e1.18452"; charset="UTF-8"


--1432637355.Abf5e1.18452
Date: Tue, 26 May 2015 10:49:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90435

--- Comment #11 from Hans de Goede <jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> ---
Hi all,

I've been looking into this toay, it seems that with the latest
xf86-video-nouveau + latest mesa (both git master) I can reproduce the problem
and work around it by starting glxgears like this:

"vblank_mode=0 glxgears"

I need this workaround on both mesa-10.0 and mesa-git-master, so it seems that
whatever problem Ilya was original seeing has been fixed in mesa-git-master.

Ilya can you please try mesa-git-master and if that does not work (the vblank
issue may be specific to my card), try it with: "vblank_mode=0 glxgears" ?

Downgrading xf86-video-nouveau to 1.0.10 fixes the vblank issue for me, a git
bisect points to:
http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=f0fa8313714c2a5b16e784b257b5ff79da3a443b

Which is a commit which enables sync-to-vblank by default and as such is not
really useful, and the real problem lies elsewhere.

Suggestions how to further debug the vblank issue are welcome.

Regards,

Hans

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432637355.Abf5e1.18452
Date: Tue, 26 May 2015 10:49:15 +0000
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
   title="NEW - [NV46] moving 3D objects drawn static"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90435#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV46] moving 3D objects drawn static"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90435">bug 90435</a>
              from <span class="vcard"><a class="email" href="mailto:jwrdegoede&#64;fedoraproject.org" title="Hans de Goede &lt;jwrdegoede&#64;fedoraproject.org&gt;"> <span class="fn">Hans de Goede</span></a>
</span></b>
        <pre>Hi all,

I've been looking into this toay, it seems that with the latest
xf86-video-nouveau + latest mesa (both git master) I can reproduce the problem
and work around it by starting glxgears like this:

&quot;vblank_mode=0 glxgears&quot;

I need this workaround on both mesa-10.0 and mesa-git-master, so it seems that
whatever problem Ilya was original seeing has been fixed in mesa-git-master.

Ilya can you please try mesa-git-master and if that does not work (the vblank
issue may be specific to my card), try it with: &quot;vblank_mode=0 glxgears&quot; ?

Downgrading xf86-video-nouveau to 1.0.10 fixes the vblank issue for me, a git
bisect points to:
<a href="http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=f0fa8313714c2a5b16e784b257b5ff79da3a443b">http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=f0fa8313714c2a5b16e784b257b5ff79da3a443b</a>

Which is a commit which enables sync-to-vblank by default and as such is not
really useful, and the real problem lies elsewhere.

Suggestions how to further debug the vblank issue are welcome.

Regards,

Hans</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432637355.Abf5e1.18452--

--===============1186612266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1186612266==--
