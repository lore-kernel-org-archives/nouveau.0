From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Thu, 28 May 2015 18:59:33 +0000
Message-ID: <bug-89730-8800-vun8x29iu5@http.bugs.freedesktop.org/>
References: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1379907123=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89730-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1379907123==
Content-Type: multipart/alternative; boundary="1432839573.a3bf3b21.11522"; charset="UTF-8"


--1432839573.a3bf3b21.11522
Date: Thu, 28 May 2015 18:59:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89730

--- Comment #26 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to andrew p. from comment #25)
> (In reply to Ilia Mirkin from comment #24)
> > It's good that it does that.
> Is it so good that newest nouveau version will resolve this bug?
> 
> About xtrace, for poma:
> > Guys, if any of you know how to x[11]trace lightdm-gtk-greeter?
> You need to modify "greeter-wrapper" script to run xtrace. Default path for
> ubuntu: /usr/lib/lightdm/lightdm-greeter-session
> 
> Replace launching command:
>     exec $@ &
> with xtrace command:
>     exec xtrace -b -o /tmp/xtrace.log $@ &


$ rpm -ql lightdm-gtk | grep -v 'locale\|icons\|doc'
/etc/lightdm/lightdm-gtk-greeter.conf
/usr/sbin/lightdm-gtk-greeter
/usr/share/xgreeters/lightdm-greeter.desktop
/usr/share/xgreeters/lightdm-gtk-greeter.desktop

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432839573.a3bf3b21.11522
Date: Thu, 28 May 2015 18:59:33 +0000
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
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730">bug 89730</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>(In reply to andrew p. from <a href="show_bug.cgi?id=89730#c25">comment #25</a>)
<span class="quote">&gt; (In reply to Ilia Mirkin from <a href="show_bug.cgi?id=89730#c24">comment #24</a>)
&gt; &gt; It's good that it does that.
&gt; Is it so good that newest nouveau version will resolve this bug?
&gt; 
&gt; About xtrace, for poma:
&gt; &gt; Guys, if any of you know how to x[11]trace lightdm-gtk-greeter?
&gt; You need to modify &quot;greeter-wrapper&quot; script to run xtrace. Default path for
&gt; ubuntu: /usr/lib/lightdm/lightdm-greeter-session
&gt; 
&gt; Replace launching command:
&gt;     exec $&#64; &amp;
&gt; with xtrace command:
&gt;     exec xtrace -b -o /tmp/xtrace.log $&#64; &amp;</span >


$ rpm -ql lightdm-gtk | grep -v 'locale\|icons\|doc'
/etc/lightdm/lightdm-gtk-greeter.conf
/usr/sbin/lightdm-gtk-greeter
/usr/share/xgreeters/lightdm-greeter.desktop
/usr/share/xgreeters/lightdm-gtk-greeter.desktop</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432839573.a3bf3b21.11522--

--===============1379907123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1379907123==--
