From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88893] [NV46] GPU lockup with Quadro NVS 110M
Date: Sun, 01 Feb 2015 19:57:01 +0000
Message-ID: <bug-88893-8800-KxnOct261r@http.bugs.freedesktop.org/>
References: <bug-88893-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0472785673=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88893-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0472785673==
Content-Type: multipart/alternative; boundary="1422820621.D7c5bddD1.32041"; charset="UTF-8"


--1422820621.D7c5bddD1.32041
Date: Sun, 1 Feb 2015 19:57:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88893

--- Comment #12 from Richard <hobbes1069-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #11)
> (In reply to Richard from comment #10)
> > For the heck of it I tried an older kernel from F19, 3.14.27 and no
> > different.
> > 
> > I haven't mentioned it before and I don't think it showed up in the logs but
> > when I try to reboot after getting GPU lockup I also get errors like "failed
> > to idle channel 0xcccc0000"
> 
> Hm, that's surprising if acceleration is disabled. Perhaps fb accel is
> breaking things... try also adding nouveau.nofbaccel=1 . If it still
> happens, try removing all traces of vdpau from your system (just removing
> libvdpau.so.1 should be enough).

I need to be more complete in my statements :) Sorry, busy at home so jumping
back to the office when I can. I tried a "normal" boot with 3.14.27. I am
trying to see if I can find a point where everything just "works". I can find
issues that were "fixed" with this specific laptop back in 2010 so I assume
this problem is different.

I did go back and try with both options on 3.18.3 and I can login with gdm but
no gnome-shell desktop.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422820621.D7c5bddD1.32041
Date: Sun, 1 Feb 2015 19:57:01 +0000
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
   title="NEW - [NV46] GPU lockup with Quadro NVS 110M"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88893#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV46] GPU lockup with Quadro NVS 110M"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88893">bug 88893</a>
              from <span class="vcard"><a class="email" href="mailto:hobbes1069&#64;gmail.com" title="Richard &lt;hobbes1069&#64;gmail.com&gt;"> <span class="fn">Richard</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=88893#c11">comment #11</a>)
<span class="quote">&gt; (In reply to Richard from <a href="show_bug.cgi?id=88893#c10">comment #10</a>)
&gt; &gt; For the heck of it I tried an older kernel from F19, 3.14.27 and no
&gt; &gt; different.
&gt; &gt; 
&gt; &gt; I haven't mentioned it before and I don't think it showed up in the logs but
&gt; &gt; when I try to reboot after getting GPU lockup I also get errors like &quot;failed
&gt; &gt; to idle channel 0xcccc0000&quot;
&gt; 
&gt; Hm, that's surprising if acceleration is disabled. Perhaps fb accel is
&gt; breaking things... try also adding nouveau.nofbaccel=1 . If it still
&gt; happens, try removing all traces of vdpau from your system (just removing
&gt; libvdpau.so.1 should be enough).</span >

I need to be more complete in my statements :) Sorry, busy at home so jumping
back to the office when I can. I tried a &quot;normal&quot; boot with 3.14.27. I am
trying to see if I can find a point where everything just &quot;works&quot;. I can find
issues that were &quot;fixed&quot; with this specific laptop back in 2010 so I assume
this problem is different.

I did go back and try with both options on 3.18.3 and I can login with gdm but
no gnome-shell desktop.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422820621.D7c5bddD1.32041--

--===============0472785673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0472785673==--
