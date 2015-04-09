From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89969] vaDriverInit fails with gallium/nouveau driver
Date: Thu, 09 Apr 2015 17:02:14 +0000
Message-ID: <bug-89969-8800-Zx6X2ibrCo@http.bugs.freedesktop.org/>
References: <bug-89969-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0659453186=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89969-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0659453186==
Content-Type: multipart/alternative; boundary="1428598933.Db44ea1.22184"; charset="UTF-8"


--1428598933.Db44ea1.22184
Date: Thu, 9 Apr 2015 17:02:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89969

--- Comment #5 from Julien Isorce <julien.isorce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I am interested but I would need some infos to start :)

Also I do not understand why a functionality is missing in drivers/nouveau
since st/vdpau works (which means nouveau_vp3_fill_picparm_mpeg12_bsp and
nouveau_vp3_fill_picparm_h264_bsp work).

So I was suspecting something wrong in st/va/picture.c
Using the above bt, I noticed that for st/vpdau
http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/state_trackers/vdpau/decode.c#n557
the third param is well defined.
Whereas for st/va
http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/state_trackers/va/picture.c#n520
the third param is NULL which leads to the crash.

Few minutes ago I tried naively to replace this NULL param with
"&context->desc.base" but then I can see a wrong image in my application when
rendering decoded images.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1428598933.Db44ea1.22184
Date: Thu, 9 Apr 2015 17:02:13 +0000
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
   title="NEW - vaDriverInit fails with gallium/nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89969#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - vaDriverInit fails with gallium/nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89969">bug 89969</a>
              from <span class="vcard"><a class="email" href="mailto:julien.isorce&#64;gmail.com" title="Julien Isorce &lt;julien.isorce&#64;gmail.com&gt;"> <span class="fn">Julien Isorce</span></a>
</span></b>
        <pre>I am interested but I would need some infos to start :)

Also I do not understand why a functionality is missing in drivers/nouveau
since st/vdpau works (which means nouveau_vp3_fill_picparm_mpeg12_bsp and
nouveau_vp3_fill_picparm_h264_bsp work).

So I was suspecting something wrong in st/va/picture.c
Using the above bt, I noticed that for st/vpdau
<a href="http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/state_trackers/vdpau/decode.c#n557">http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/state_trackers/vdpau/decode.c#n557</a>
the third param is well defined.
Whereas for st/va
<a href="http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/state_trackers/va/picture.c#n520">http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/state_trackers/va/picture.c#n520</a>
the third param is NULL which leads to the crash.

Few minutes ago I tried naively to replace this NULL param with
&quot;&amp;context-&gt;desc.base&quot; but then I can see a wrong image in my application when
rendering decoded images.</pre>
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

--1428598933.Db44ea1.22184--

--===============0659453186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0659453186==--
