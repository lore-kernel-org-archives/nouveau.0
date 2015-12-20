From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81363] [NV84] Black screen after UDEV is intialized
Date: Sun, 20 Dec 2015 03:09:35 +0000
Message-ID: <bug-81363-8800-7Cdk6sOAYa@http.bugs.freedesktop.org/>
References: <bug-81363-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0905708612=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81363-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0905708612==
Content-Type: multipart/alternative; boundary="1450580975.4b8dfD61.31863"; charset="UTF-8"


--1450580975.4b8dfD61.31863
Date: Sun, 20 Dec 2015 03:09:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81363

--- Comment #13 from Jeff <jrsx13-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #12)
> A random thing to try -- boot with
> 
> video=LVDS-2:d
> 
> (It appears that you have 2 GPUs... perhaps they're both connected to the
> LVDS somehow, and the second one turns it off?)

I tried this. And it was still a black/blank screen. However maybe you are onto
something as this is a laptop with a Nvidia 8700m setup as an sli card. Though
with the proprietary driver and with Windows it has no issue booting up
properly. However I find windows really slow and would like to switch to
nouveau to future proof my laptop since I am betting Nvidia won't develop a
Wayland driver for this card.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1450580975.4b8dfD61.31863
Date: Sun, 20 Dec 2015 03:09:35 +0000
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
   title="NEW - [NV84] Black screen after UDEV is intialized"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81363#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV84] Black screen after UDEV is intialized"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81363">bug 81363</a>
              from <span class="vcard"><a class="email" href="mailto:jrsx13&#64;gmail.com" title="Jeff &lt;jrsx13&#64;gmail.com&gt;"> <span class="fn">Jeff</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=81363#c12">comment #12</a>)
<span class="quote">&gt; A random thing to try -- boot with
&gt; 
&gt; video=LVDS-2:d
&gt; 
&gt; (It appears that you have 2 GPUs... perhaps they're both connected to the
&gt; LVDS somehow, and the second one turns it off?)</span >

I tried this. And it was still a black/blank screen. However maybe you are onto
something as this is a laptop with a Nvidia 8700m setup as an sli card. Though
with the proprietary driver and with Windows it has no issue booting up
properly. However I find windows really slow and would like to switch to
nouveau to future proof my laptop since I am betting Nvidia won't develop a
Wayland driver for this card.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1450580975.4b8dfD61.31863--

--===============0905708612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0905708612==--
