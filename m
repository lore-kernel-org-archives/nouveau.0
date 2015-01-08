From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88164] Text in menus not rendered by LibreOffice
Date: Thu, 08 Jan 2015 09:12:44 +0000
Message-ID: <bug-88164-8800-lrrcDS4L0K@http.bugs.freedesktop.org/>
References: <bug-88164-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1700478421=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88164-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1700478421==
Content-Type: multipart/alternative; boundary="1420708363.56AF621.31029"; charset="UTF-8"


--1420708363.56AF621.31029
Date: Thu, 8 Jan 2015 09:12:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88164

--- Comment #5 from Oliver Neukum <oliver-GvhC2dPhHPQdnm+yROfE0A@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #4)
> I just noticed that you said that this is a regression from 3.17 to 3.18 --
> that is _very_ surprising, as acceleration is not being used and it's all
> just software rendering. Perhaps there's more going on here... Could you try
> doing a bisect? You can limit it to drivers/gpu/drm to speed things up.

I just rechecked with vanilla v3.17. It does work. I am starting a bisection.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420708363.56AF621.31029
Date: Thu, 8 Jan 2015 09:12:43 +0000
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
   title="NEW - Text in menus not rendered by LibreOffice"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88164#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Text in menus not rendered by LibreOffice"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88164">bug 88164</a>
              from <span class="vcard"><a class="email" href="mailto:oliver&#64;neukum.org" title="Oliver Neukum &lt;oliver&#64;neukum.org&gt;"> <span class="fn">Oliver Neukum</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=88164#c4">comment #4</a>)
<span class="quote">&gt; I just noticed that you said that this is a regression from 3.17 to 3.18 --
&gt; that is _very_ surprising, as acceleration is not being used and it's all
&gt; just software rendering. Perhaps there's more going on here... Could you try
&gt; doing a bisect? You can limit it to drivers/gpu/drm to speed things up.</span >

I just rechecked with vanilla v3.17. It does work. I am starting a bisection.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420708363.56AF621.31029--

--===============1700478421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1700478421==--
