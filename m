From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90871] NV30: Xfwm4 use_compositing - garbled display
Date: Sun, 16 Aug 2015 20:14:41 +0000
Message-ID: <bug-90871-8800-cVMHfQCoOt@http.bugs.freedesktop.org/>
References: <bug-90871-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0912265035=="
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


--===============0912265035==
Content-Type: multipart/alternative; boundary="1439756081.a5fECE61.7024"; charset="UTF-8"


--1439756081.a5fECE61.7024
Date: Sun, 16 Aug 2015 20:14:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90871

--- Comment #26 from Hans de Goede <jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> ---
(In reply to poma from comment #25)
> Here you can find the source rpm of the Xfce's window manager with GLX
> support:
> http://goo.gl/Gm4ffO
> source/xfwm4-4.12.3-11.2.glx.git20150615.fc22.src.rpm
> 
> Besides it is an integral part of the test compilation:
> http://goo.gl/Gm4ffO
> iso/Twenty-Two-Xfce-Live-*.iso
> 
> 
> Ref.
> compositor: Add support for GLX
> http://git.xfce.org/xfce/xfwm4/commit/?id=fee08ea

Interesting so what you are saying is that the default F-22 xfwm builds do not
have this patch, and thus cannot be used to reproduce the problem ?

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1439756081.a5fECE61.7024
Date: Sun, 16 Aug 2015 20:14:41 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">bug 90871</a>
              from <span class="vcard"><a class="email" href="mailto:jwrdegoede&#64;fedoraproject.org" title="Hans de Goede &lt;jwrdegoede&#64;fedoraproject.org&gt;"> <span class="fn">Hans de Goede</span></a>
</span></b>
        <pre>(In reply to poma from <a href="show_bug.cgi?id=90871#c25">comment #25</a>)
<span class="quote">&gt; Here you can find the source rpm of the Xfce's window manager with GLX
&gt; support:
&gt; <a href="http://goo.gl/Gm4ffO">http://goo.gl/Gm4ffO</a>
&gt; source/xfwm4-4.12.3-11.2.glx.git20150615.fc22.src.rpm
&gt; 
&gt; Besides it is an integral part of the test compilation:
&gt; <a href="http://goo.gl/Gm4ffO">http://goo.gl/Gm4ffO</a>
&gt; iso/Twenty-Two-Xfce-Live-*.iso
&gt; 
&gt; 
&gt; Ref.
&gt; compositor: Add support for GLX
&gt; <a href="http://git.xfce.org/xfce/xfwm4/commit/?id=fee08ea">http://git.xfce.org/xfce/xfwm4/commit/?id=fee08ea</a></span >

Interesting so what you are saying is that the default F-22 xfwm builds do not
have this patch, and thus cannot be used to reproduce the problem ?</pre>
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

--1439756081.a5fECE61.7024--

--===============0912265035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0912265035==--
