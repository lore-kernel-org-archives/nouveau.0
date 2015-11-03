From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73373] [NVE4] GPU lockup after opening many tabs in
 Chromium web browser
Date: Tue, 03 Nov 2015 16:07:27 +0000
Message-ID: <bug-73373-8800-sOWDsw1gzz@http.bugs.freedesktop.org/>
References: <bug-73373-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1117075688=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73373-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1117075688==
Content-Type: multipart/alternative; boundary="1446566847.57AD00.12796"; charset="UTF-8"


--1446566847.57AD00.12796
Date: Tue, 3 Nov 2015 16:07:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73373

--- Comment #19 from Mario Barrera <mbarrera-KK0ffGbhmjU@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #18)
> (In reply to Mario Barrera from comment #15)
> > Maybe useful, opening about 10 tabs with embedded flash elements in Firefox
> > seems to cause the running Chromium browser to trigger the GPU lockup.
> 
> Does this still happen with a recent kernel / mesa? Among other things, mesa
> 11.0.3 fixes a number of annoying resource management issues.

I can still reproduce the issue by opening many HTML files with Firefox. It
happens always.

I have mesa 11.0.4 in Linux 4.2.5-1-ARCH.

I'm attaching the logs.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446566847.57AD00.12796
Date: Tue, 3 Nov 2015 16:07:27 +0000
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
   title="NEW - [NVE4] GPU lockup after opening many tabs in Chromium web browser"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73373#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] GPU lockup after opening many tabs in Chromium web browser"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73373">bug 73373</a>
              from <span class="vcard"><a class="email" href="mailto:mbarrera&#64;gmx.com" title="Mario Barrera &lt;mbarrera&#64;gmx.com&gt;"> <span class="fn">Mario Barrera</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=73373#c18">comment #18</a>)
<span class="quote">&gt; (In reply to Mario Barrera from <a href="show_bug.cgi?id=73373#c15">comment #15</a>)
&gt; &gt; Maybe useful, opening about 10 tabs with embedded flash elements in Firefox
&gt; &gt; seems to cause the running Chromium browser to trigger the GPU lockup.
&gt; 
&gt; Does this still happen with a recent kernel / mesa? Among other things, mesa
&gt; 11.0.3 fixes a number of annoying resource management issues.</span >

I can still reproduce the issue by opening many HTML files with Firefox. It
happens always.

I have mesa 11.0.4 in Linux 4.2.5-1-ARCH.

I'm attaching the logs.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446566847.57AD00.12796--

--===============1117075688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1117075688==--
