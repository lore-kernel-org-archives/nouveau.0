From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92991] Nouveau module loading regression in 4.4-rc1
 on optimus system
Date: Tue, 24 Nov 2015 10:18:05 +0000
Message-ID: <bug-92991-8800-6CYk6QD1Tq@http.bugs.freedesktop.org/>
References: <bug-92991-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0763460327=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92991-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0763460327==
Content-Type: multipart/alternative; boundary="1448360284.a3E77B831.9218"; charset="UTF-8"


--1448360284.a3E77B831.9218
Date: Tue, 24 Nov 2015 10:18:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92991

--- Comment #11 from Oliver Neukum <oliver-GvhC2dPhHPQdnm+yROfE0A@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #9)

It turns out that with nouveau statically compiled I can use an external
monitor and xrandr without "runpm=0"

> Those connector names look like they're from xf86-video-modesetting, not
> xf86-video-nouveau. Could you try with xf86-video-nouveau installed? What
> version of xf86-video-intel are you using? SNA or UXA?

How do I do that, as far as I can tell, it is not used.

> I definitely know that earlier modesetting various had various issues with
> reverse prime... when you say "lockup", do you really mean "lockup", or
> "system working perfectly fine with the minor exception that the display
> stops updating"?

Total lockup. Even CAPS LOCK not working.

> Lastly, can you ensure that nouveau is loaded *before* X starts?

Done. That helps.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1448360284.a3E77B831.9218
Date: Tue, 24 Nov 2015 10:18:04 +0000
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
   title="NEW - Nouveau module loading regression in 4.4-rc1 on optimus system"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92991#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau module loading regression in 4.4-rc1 on optimus system"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92991">bug 92991</a>
              from <span class="vcard"><a class="email" href="mailto:oliver&#64;neukum.org" title="Oliver Neukum &lt;oliver&#64;neukum.org&gt;"> <span class="fn">Oliver Neukum</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=92991#c9">comment #9</a>)

It turns out that with nouveau statically compiled I can use an external
monitor and xrandr without &quot;runpm=0&quot;

<span class="quote">&gt; Those connector names look like they're from xf86-video-modesetting, not
&gt; xf86-video-nouveau. Could you try with xf86-video-nouveau installed? What
&gt; version of xf86-video-intel are you using? SNA or UXA?</span >

How do I do that, as far as I can tell, it is not used.

<span class="quote">&gt; I definitely know that earlier modesetting various had various issues with
&gt; reverse prime... when you say &quot;lockup&quot;, do you really mean &quot;lockup&quot;, or
&gt; &quot;system working perfectly fine with the minor exception that the display
&gt; stops updating&quot;?</span >

Total lockup. Even CAPS LOCK not working.

<span class="quote">&gt; Lastly, can you ensure that nouveau is loaded *before* X starts?</span >

Done. That helps.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1448360284.a3E77B831.9218--

--===============0763460327==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0763460327==--
