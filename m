From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89113] NVA8 constantly flickers when clocked to
	lowest pstate
Date: Fri, 13 Feb 2015 10:06:13 +0000
Message-ID: <bug-89113-8800-ccXCBgulxA@http.bugs.freedesktop.org/>
References: <bug-89113-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0973837385=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89113-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0973837385==
Content-Type: multipart/alternative; boundary="1423821973.f3CFc1.7683"; charset="UTF-8"


--1423821973.f3CFc1.7683
Date: Fri, 13 Feb 2015 10:06:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89113

--- Comment #3 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
(In reply to C, Zhang from comment #0)
> however, when clocking to pstate=03 i get constant flickering (maybe <5-10
> hz)

Flickering at low clocks is expected and is most likely due to hardware
constraints - memory not being quick enough to deal with the additional screen,
hence no flickering at higher clock - rather than a driver bug. Look in
nvidia-settings which clocks the blob sets when you plug your external screen
in: most likely it will automatically go from level 03 to level 07 and won't go
back to 03 unless you unplug the external screen.
See "Blank monitor, flicker, snow, or other random live image corruption" at
http://nouveau.freedesktop.org/wiki/TroubleShooting/#index8h3.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1423821973.f3CFc1.7683
Date: Fri, 13 Feb 2015 10:06:13 +0000
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
   title="NEW - NVA8 constantly flickers when clocked to lowest pstate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89113#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NVA8 constantly flickers when clocked to lowest pstate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89113">bug 89113</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>(In reply to C, Zhang from <a href="show_bug.cgi?id=89113#c0">comment #0</a>)
<span class="quote">&gt; however, when clocking to pstate=03 i get constant flickering (maybe &lt;5-10
&gt; hz)</span >

Flickering at low clocks is expected and is most likely due to hardware
constraints - memory not being quick enough to deal with the additional screen,
hence no flickering at higher clock - rather than a driver bug. Look in
nvidia-settings which clocks the blob sets when you plug your external screen
in: most likely it will automatically go from level 03 to level 07 and won't go
back to 03 unless you unplug the external screen.
See &quot;Blank monitor, flicker, snow, or other random live image corruption&quot; at
<a href="http://nouveau.freedesktop.org/wiki/TroubleShooting/#index8h3">http://nouveau.freedesktop.org/wiki/TroubleShooting/#index8h3</a>.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1423821973.f3CFc1.7683--

--===============0973837385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0973837385==--
