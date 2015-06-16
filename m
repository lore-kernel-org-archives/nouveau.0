From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90871] NV30: Xfwm4 use_compositing - garbled display
Date: Tue, 16 Jun 2015 19:26:12 +0000
Message-ID: <bug-90871-8800-T2ydiVYRxM@http.bugs.freedesktop.org/>
References: <bug-90871-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0321825483=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90871-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0321825483==
Content-Type: multipart/alternative; boundary="1434482772.Ec1f0.15380"; charset="UTF-8"


--1434482772.Ec1f0.15380
Date: Tue, 16 Jun 2015 19:26:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90871

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
BTW, irrespective of any shortcomings in the modesetting driver, there's 0
chance that GLAMOR will work on nv3x. And like 0.00000000000000001% chance
it'll work on nv4x. The driver logic is just not there to handle those giant
shaders. It should, however, work fine on nv50+, which has a real compiler
backing it.

With xf86-video-nouveau you should be getting dedicated EXA acceleration logic.
I did notice a small bug in some of the pre-nv50 logic while trying to fix
something else:

http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=278ad73475bd137eac8a49ec7a22406bfc2867e7

Unlikely to fix anything for you, but thought I'd mention it.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1434482772.Ec1f0.15380
Date: Tue, 16 Jun 2015 19:26:12 +0000
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
   title="NEW - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">bug 90871</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>BTW, irrespective of any shortcomings in the modesetting driver, there's 0
chance that GLAMOR will work on nv3x. And like 0.00000000000000001% chance
it'll work on nv4x. The driver logic is just not there to handle those giant
shaders. It should, however, work fine on nv50+, which has a real compiler
backing it.

With xf86-video-nouveau you should be getting dedicated EXA acceleration logic.
I did notice a small bug in some of the pre-nv50 logic while trying to fix
something else:

<a href="http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=278ad73475bd137eac8a49ec7a22406bfc2867e7">http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=278ad73475bd137eac8a49ec7a22406bfc2867e7</a>

Unlikely to fix anything for you, but thought I'd mention it.</pre>
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

--1434482772.Ec1f0.15380--

--===============0321825483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0321825483==--
